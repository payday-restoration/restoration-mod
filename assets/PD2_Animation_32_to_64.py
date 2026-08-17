#!/usr/bin/env python3
"""
PAYDAY 2 Diesel .animation legacy 32-bit -> native 64-bit converter.

Reverse engineered from:
  - legacy io_scene_dieselanim source
  - matched legacy/native m14 animation binaries

What changes:
  * legacy zlib(+optional opaque tail)+u32-size trailer -> raw native file
  * 60-byte 32-bit header -> 120-byte 64-bit header
  * 32-bit offsets/count fields -> 64-bit
  * object-name pointers: u32 -> u64
  * trigger records: <f,u32> -> <f,pad4,u64>
  * position/rotation table records: <u32,u32> -> <u64,u64>
  * per-track headers: <pad4,u32,u32> -> <pad8,u64,u64>
  * 64-bit native track blocks are 8-byte aligned

Keyframe payload bytes are preserved exactly. This means all known Diesel
position/rotation codecs survive without float re-encoding or quantization.

Unknown header section entries are intentionally rejected when count != 0;
the supplied native corpus contains zero unknown entries, and guessing their
ABI would be unsafe for a CTD-sensitive converter.
"""

from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import struct
import sys
import zlib
from dataclasses import dataclass
from typing import List, Tuple

FILE_ID = 142855301  # 0x0883CC85

H32 = struct.Struct('<IxxxxxxxxIfIIIIIIIIII')
H64 = struct.Struct('<QxxxxxxxxQxxxxxxxxfxxxxQQQQQQQQQQ')
NAME32 = struct.Struct('<I')
TRIG32 = struct.Struct('<fI')
TRACK1_32 = struct.Struct('<II')
TRACK2_32 = struct.Struct('<xxxxII')

NAME64 = struct.Struct('<Q')
TRIG64 = struct.Struct('<fxxxxQ')
TRACK1_64 = struct.Struct('<QQ')
TRACK2_64 = struct.Struct('<xxxxxxxxQQ')


def align8(n: int) -> int:
    return (n + 7) & ~7


def u32(data: bytes, off: int) -> int:
    return struct.unpack_from('<I', data, off)[0]


def cstring_bytes(data: bytes, off: int, limit: int | None = None) -> bytes:
    if off < 0 or off >= len(data):
        raise ValueError(f'string pointer 0x{off:X} is outside file')
    end_limit = len(data) if limit is None else min(limit, len(data))
    end = data.find(b'\0', off, end_limit)
    if end < 0:
        raise ValueError(f'unterminated string at 0x{off:X}')
    return data[off:end]


@dataclass
class Trigger32:
    time_bits: bytes
    name: bytes


@dataclass
class Track32:
    type_id: int
    count: int
    payload: bytes


@dataclass
class Anim32:
    source_storage: str
    source_size: int
    uncompressed_size: int
    file_id: int
    length_bits: bytes
    names: List[bytes]
    triggers: List[Trigger32]
    positions: List[Track32]
    rotations: List[Track32]
    unknown_count: int


def try_zlib(blob: bytes) -> Tuple[bytes, bytes] | None:
    try:
        obj = zlib.decompressobj()
        out = obj.decompress(blob) + obj.flush()
        if not obj.eof:
            return None
        return out, obj.unused_data
    except zlib.error:
        return None


def looks_native64(data: bytes) -> bool:
    if len(data) < H64.size:
        return False
    try:
        h = H64.unpack_from(data, 0)
    except struct.error:
        return False
    file_id, file_size = h[0], h[1]
    name_count, name_off = h[3], h[4]
    pos_count, pos_off = h[9], h[10]
    rot_count, rot_off = h[11], h[12]
    return (
        file_id == FILE_ID and
        file_size == len(data) and
        name_off >= H64.size and name_off <= len(data) and
        pos_off <= len(data) and rot_off <= len(data) and
        name_count < 1_000_000 and pos_count < 1_000_000 and rot_count < 1_000_000
    )


def looks_legacy32(data: bytes) -> bool:
    if len(data) < H32.size:
        return False
    try:
        h = H32.unpack_from(data, 0)
    except struct.error:
        return False
    file_id = h[0]
    name_count, name_off = h[3], h[4]
    pos_count, pos_off = h[9], h[10]
    rot_count, rot_off = h[11], h[12]
    return (
        file_id == FILE_ID and
        name_off >= H32.size and name_off <= len(data) and
        pos_off <= len(data) and rot_off <= len(data) and
        name_count < 1_000_000 and pos_count < 1_000_000 and rot_count < 1_000_000
    )


def decode_source(blob: bytes) -> Tuple[str, bytes]:
    # Native samples are raw. Check them first so arbitrary raw data is not
    # accidentally treated as a zlib stream.
    if looks_native64(blob):
        return 'native64-raw', blob
    if looks_legacy32(blob):
        return 'legacy32-raw', blob

    zd = try_zlib(blob)
    if zd is not None:
        data, trailer = zd
        if looks_native64(data):
            return '64bit-zlib', data
        if looks_legacy32(data):
            # Production legacy files carry a 4-byte uncompressed-size value
            # at the physical end of the file. Most have only that trailer
            # after the zlib stream, but some valid animations contain opaque
            # trailing bytes between zlib EOF and the final size field.
            # Validate the last 4 bytes, not the first bytes of unused_data.
            if trailer:
                if len(trailer) < 4:
                    raise ValueError('truncated legacy zlib trailer')
                declared = struct.unpack_from('<I', trailer, len(trailer) - 4)[0]
                if declared != len(data):
                    raise ValueError(
                        f'zlib final size says {declared} bytes, decompressed size is {len(data)}'
                    )
            return 'legacy32-zlib', data

    raise ValueError('not a recognized Diesel .animation (32-bit or native 64-bit)')


def parse_track_section_32(data: bytes, count: int, section_off: int,
                           section_end: int, label: str) -> List[Track32]:
    if count == 0:
        return []
    table_end = section_off + count * TRACK1_32.size
    if section_off < 0 or table_end > len(data):
        raise ValueError(f'{label} header table is outside file')

    headers = []
    for i in range(count):
        typ, hdr2_off = TRACK1_32.unpack_from(data, section_off + i * TRACK1_32.size)
        headers.append((typ, hdr2_off))

    tracks: List[Track32] = []
    for i, (typ, hdr2_off) in enumerate(headers):
        if hdr2_off < table_end or hdr2_off + TRACK2_32.size > len(data):
            raise ValueError(f'{label}[{i}] track header pointer 0x{hdr2_off:X} is invalid')
        count_frames, payload_off = TRACK2_32.unpack_from(data, hdr2_off)
        if payload_off < hdr2_off + TRACK2_32.size or payload_off > len(data):
            raise ValueError(f'{label}[{i}] payload pointer 0x{payload_off:X} is invalid')

        next_hdr = headers[i + 1][1] if i + 1 < len(headers) else section_end
        if next_hdr < payload_off or next_hdr > len(data):
            raise ValueError(f'{label}[{i}] inferred payload end 0x{next_hdr:X} is invalid')
        payload = bytes(data[payload_off:next_hdr])
        tracks.append(Track32(typ, count_frames, payload))

    return tracks


def parse_legacy32(data: bytes, storage: str, source_size: int) -> Anim32:
    h = H32.unpack_from(data, 0)
    (file_id, _legacy_size, _length,
     name_count, name_off,
     unknown_count, unknown_off,
     trigger_count, trigger_off,
     pos_count, pos_off,
     rot_count, rot_off) = h

    if file_id != FILE_ID:
        raise ValueError(f'unexpected file id 0x{file_id:X}')
    if unknown_count != 0:
        raise ValueError(
            f'unsupported legacy unknown-section count {unknown_count}; refusing unsafe conversion'
        )
    if pos_count > name_count or rot_count > name_count:
        raise ValueError(
            f'track count exceeds object-name count (names={name_count}, pos={pos_count}, rot={rot_count})'
        )

    # Object names. Bound strings by the next real section when possible.
    name_table_end = name_off + name_count * NAME32.size
    if name_table_end > len(data):
        raise ValueError('object-name pointer table is outside file')
    name_limit_candidates = [x for x in (unknown_off, trigger_off, pos_off, rot_off) if x > name_off]
    name_limit = min(name_limit_candidates) if name_limit_candidates else len(data)
    names: List[bytes] = []
    for i in range(name_count):
        p = NAME32.unpack_from(data, name_off + i * NAME32.size)[0]
        names.append(cstring_bytes(data, p, name_limit))

    # Triggers. Preserve the exact float32 bits.
    triggers: List[Trigger32] = []
    if trigger_count:
        trig_table_end = trigger_off + trigger_count * TRIG32.size
        if trig_table_end > len(data):
            raise ValueError('trigger table is outside file')
        trig_limit = pos_off if pos_off > trigger_off else len(data)
        for i in range(trigger_count):
            ent = trigger_off + i * TRIG32.size
            time_bits = bytes(data[ent:ent + 4])
            name_ptr = struct.unpack_from('<I', data, ent + 4)[0]
            triggers.append(Trigger32(time_bits, cstring_bytes(data, name_ptr, trig_limit)))

    positions = parse_track_section_32(data, pos_count, pos_off, rot_off, 'position')
    rotations = parse_track_section_32(data, rot_count, rot_off, len(data), 'rotation')

    return Anim32(
        source_storage=storage,
        source_size=source_size,
        uncompressed_size=len(data),
        file_id=file_id,
        length_bits=bytes(data[16:20]),
        names=names,
        triggers=triggers,
        positions=positions,
        rotations=rotations,
        unknown_count=unknown_count,
    )


def build_string_pool(strings: List[bytes], start: int) -> Tuple[List[int], bytes]:
    offsets: List[int] = []
    pool = bytearray()
    interned = {}
    for s in strings:
        if s in interned:
            offsets.append(interned[s])
            continue
        off = start + len(pool)
        interned[s] = off
        offsets.append(off)
        pool.extend(s)
        pool.append(0)
    return offsets, bytes(pool)


def build_native64(anim: Anim32) -> bytes:
    name_count = len(anim.names)
    trig_count = len(anim.triggers)
    pos_count = len(anim.positions)
    rot_count = len(anim.rotations)

    # ----- object names -----
    name_off = H64.size
    name_strings_start = name_off + name_count * NAME64.size
    name_ptrs, name_pool = build_string_pool(anim.names, name_strings_start)
    names_end = align8(name_strings_start + len(name_pool))

    # Native corpus points empty unknown/trigger sections at the current cursor,
    # instead of preserving the legacy zero offset.
    unknown_count = 0
    unknown_off = names_end
    trigger_off = names_end

    # ----- triggers -----
    trigger_strings_start = trigger_off + trig_count * TRIG64.size
    trig_names = [t.name for t in anim.triggers]
    trig_ptrs, trig_pool = build_string_pool(trig_names, trigger_strings_start)
    triggers_end = align8(trigger_strings_start + len(trig_pool))

    # ----- positions -----
    pos_off = triggers_end
    pos_table_end = pos_off + pos_count * TRACK1_64.size
    pos_hdr2_offsets: List[int] = []
    pos_data_offsets: List[int] = []
    cursor = pos_table_end
    for tr in anim.positions:
        cursor = align8(cursor)
        h2 = cursor
        data_off = h2 + TRACK2_64.size
        pos_hdr2_offsets.append(h2)
        pos_data_offsets.append(data_off)
        cursor = align8(data_off + len(tr.payload))
    rot_off = cursor

    # ----- rotations -----
    rot_table_end = rot_off + rot_count * TRACK1_64.size
    rot_hdr2_offsets: List[int] = []
    rot_data_offsets: List[int] = []
    cursor = rot_table_end
    for i, tr in enumerate(anim.rotations):
        cursor = align8(cursor)
        h2 = cursor
        data_off = h2 + TRACK2_64.size
        rot_hdr2_offsets.append(h2)
        rot_data_offsets.append(data_off)
        cursor = data_off + len(tr.payload)
        # Native samples align every intermediate track block, but do not add
        # unnecessary padding after the final rotation payload.
        if i + 1 < rot_count:
            cursor = align8(cursor)
    file_size = cursor

    out = bytearray(file_size)

    # Header. Pack length as a normal float, then overwrite its bits from the
    # legacy source to guarantee exact float32 preservation.
    length = struct.unpack('<f', anim.length_bits)[0]
    H64.pack_into(
        out, 0,
        anim.file_id,
        file_size,
        length,
        name_count, name_off,
        unknown_count, unknown_off,
        trig_count, trigger_off,
        pos_count, pos_off,
        rot_count, rot_off,
    )
    out[32:36] = anim.length_bits

    # Names.
    for i, p in enumerate(name_ptrs):
        NAME64.pack_into(out, name_off + i * NAME64.size, p)
    out[name_strings_start:name_strings_start + len(name_pool)] = name_pool

    # Triggers.
    for i, (t, p) in enumerate(zip(anim.triggers, trig_ptrs)):
        ent = trigger_off + i * TRIG64.size
        out[ent:ent + 4] = t.time_bits
        # ent+4..+7 remain zero padding
        struct.pack_into('<Q', out, ent + 8, p)
    out[trigger_strings_start:trigger_strings_start + len(trig_pool)] = trig_pool

    # Positions header1 + header2 + opaque keyframe payload.
    for i, tr in enumerate(anim.positions):
        TRACK1_64.pack_into(out, pos_off + i * TRACK1_64.size, tr.type_id, pos_hdr2_offsets[i])
        TRACK2_64.pack_into(out, pos_hdr2_offsets[i], tr.count, pos_data_offsets[i])
        p = pos_data_offsets[i]
        out[p:p + len(tr.payload)] = tr.payload

    # Rotations.
    for i, tr in enumerate(anim.rotations):
        TRACK1_64.pack_into(out, rot_off + i * TRACK1_64.size, tr.type_id, rot_hdr2_offsets[i])
        TRACK2_64.pack_into(out, rot_hdr2_offsets[i], tr.count, rot_data_offsets[i])
        p = rot_data_offsets[i]
        out[p:p + len(tr.payload)] = tr.payload

    return bytes(out)


def validate_native64(data: bytes, source: Anim32 | None = None) -> None:
    if not looks_native64(data):
        raise ValueError('generated file does not pass native 64-bit header validation')
    h = H64.unpack_from(data, 0)
    (_fid, file_size, _length,
     name_count, name_off,
     unknown_count, unknown_off,
     trig_count, trig_off,
     pos_count, pos_off,
     rot_count, rot_off) = h

    if file_size != len(data):
        raise ValueError('64-bit size field does not equal file length')
    if unknown_count != 0:
        raise ValueError('generated unknown_count is non-zero')
    for label, off in [('names', name_off), ('unknown', unknown_off), ('triggers', trig_off),
                       ('positions', pos_off), ('rotations', rot_off)]:
        if off % 8:
            raise ValueError(f'{label} section offset 0x{off:X} is not 8-byte aligned')
        if off > len(data):
            raise ValueError(f'{label} section offset is outside file')

    # Validate name pointers.
    for i in range(name_count):
        p = NAME64.unpack_from(data, name_off + i * 8)[0]
        cstring_bytes(data, p, unknown_off)

    # Trigger entries/string pointers.
    for i in range(trig_count):
        ent = trig_off + i * TRIG64.size
        p = struct.unpack_from('<Q', data, ent + 8)[0]
        cstring_bytes(data, p, pos_off)
        if data[ent + 4:ent + 8] != b'\0\0\0\0':
            raise ValueError(f'trigger[{i}] alignment padding is not zero')

    def validate_tracks(count: int, sec_off: int, sec_end: int, label: str,
                        source_tracks: List[Track32] | None):
        headers = []
        for i in range(count):
            typ, h2 = TRACK1_64.unpack_from(data, sec_off + i * TRACK1_64.size)
            if h2 % 8:
                raise ValueError(f'{label}[{i}] header is not 8-byte aligned')
            if h2 + TRACK2_64.size > len(data):
                raise ValueError(f'{label}[{i}] header outside file')
            cnt, p = TRACK2_64.unpack_from(data, h2)
            if p != h2 + TRACK2_64.size:
                raise ValueError(f'{label}[{i}] payload does not immediately follow 64-bit track header')
            headers.append((typ, h2, cnt, p))

        for i, (typ, h2, cnt, p) in enumerate(headers):
            nxt = headers[i + 1][1] if i + 1 < len(headers) else sec_end
            if p > nxt:
                raise ValueError(f'{label}[{i}] payload overlaps next track/section')
            if source_tracks is not None:
                src = source_tracks[i]
                if typ != src.type_id or cnt != src.count:
                    raise ValueError(f'{label}[{i}] type/count changed during conversion')
                actual = data[p:p + len(src.payload)]
                if actual != src.payload:
                    raise ValueError(f'{label}[{i}] keyframe payload bytes changed during conversion')
                padding = data[p + len(src.payload):nxt]
                if any(padding):
                    raise ValueError(f'{label}[{i}] alignment padding is non-zero')

    validate_tracks(pos_count, pos_off, rot_off, 'position', source.positions if source else None)
    validate_tracks(rot_count, rot_off, len(data), 'rotation', source.rotations if source else None)

    if source is not None:
        if name_count != len(source.names) or trig_count != len(source.triggers):
            raise ValueError('name/trigger count changed during conversion')
        # Semantic string equality after pointer widening/string interning.
        got_names = []
        for i in range(name_count):
            p = NAME64.unpack_from(data, name_off + i * 8)[0]
            got_names.append(cstring_bytes(data, p, unknown_off))
        if got_names != source.names:
            raise ValueError('object names/order changed during conversion')
        for i, src in enumerate(source.triggers):
            ent = trig_off + i * TRIG64.size
            if data[ent:ent + 4] != src.time_bits:
                raise ValueError(f'trigger[{i}] float bits changed')
            p = struct.unpack_from('<Q', data, ent + 8)[0]
            if cstring_bytes(data, p, pos_off) != src.name:
                raise ValueError(f'trigger[{i}] name changed')


def convert_bytes(blob: bytes) -> Tuple[str, bytes, str]:
    storage, decoded = decode_source(blob)
    if storage == 'native64-raw':
        validate_native64(decoded)
        return storage, decoded, 'already native 64-bit; copied unchanged'
    if storage == '64bit-zlib':
        raise ValueError(
            'input contains a zlib-wrapped 64-bit layout. The supplied native game files are raw; '
            'this unusual hybrid is not auto-normalized.'
        )

    legacy = parse_legacy32(decoded, storage, len(blob))
    out = build_native64(legacy)
    validate_native64(out, legacy)
    return storage, out, (
        f'converted {storage}: {legacy.uncompressed_size} legacy bytes -> {len(out)} native bytes; '
        f'{len(legacy.names)} objects, {len(legacy.triggers)} triggers'
    )


def default_output_for_file(src: Path) -> Path:
    return src.with_name(src.stem + '_64bit' + src.suffix)


def default_output_for_dir(src: Path) -> Path:
    return src.with_name(src.name + '_64bit')


def gather_inputs(src: Path, out_root: Path | None) -> List[Path]:
    if src.is_file():
        return [src]
    result = []
    out_resolved = out_root.resolve() if out_root else None
    for p in src.rglob('*.animation'):
        try:
            if out_resolved and out_resolved in p.resolve().parents:
                continue
        except OSError:
            pass
        result.append(p)
    return sorted(result)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(
        description='Bulk-convert legacy PAYDAY/Diesel 32-bit .animation binaries to native 64-bit layout.'
    )
    ap.add_argument('input', help='input .animation file or directory (directories are scanned recursively)')
    ap.add_argument('-o', '--output', help='output file/directory; default adds _64bit')
    ap.add_argument('--overwrite', action='store_true', help='overwrite existing output files')
    ap.add_argument('--dry-run', action='store_true', help='analyze/validate without writing output')
    args = ap.parse_args(argv)

    src = Path(args.input).expanduser()
    if not src.exists():
        print(f'ERROR: input does not exist: {src}', file=sys.stderr)
        return 2

    if src.is_file():
        out = Path(args.output).expanduser() if args.output else default_output_for_file(src)
        inputs = [src]
        root = src.parent
        out_root = out.parent
    else:
        out_root = Path(args.output).expanduser() if args.output else default_output_for_dir(src)
        root = src
        inputs = gather_inputs(src, out_root)
        out = out_root

    if not inputs:
        print('No .animation files found.')
        return 0

    ok = 0
    skipped = 0
    failed = 0
    print(f'Found {len(inputs)} .animation file(s).')

    for p in inputs:
        if src.is_file():
            dest = out
        else:
            dest = out_root / p.relative_to(root)
        try:
            blob = p.read_bytes()
            storage, converted, note = convert_bytes(blob)
            if args.dry_run:
                print(f'[OK] {p} :: {note}')
                ok += 1
                continue
            if dest.exists() and not args.overwrite:
                print(f'[SKIP] {dest} exists (use --overwrite)')
                skipped += 1
                continue
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_bytes(converted)
            print(f'[OK] {p} -> {dest} :: {note}')
            ok += 1
        except Exception as exc:
            print(f'[FAIL] {p} :: {exc}', file=sys.stderr)
            failed += 1

    print(f'\nDone. OK={ok}  skipped={skipped}  failed={failed}')
    return 1 if failed else 0


if __name__ == '__main__':
    raise SystemExit(main())
