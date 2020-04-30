function TextTemplateBase:_stock_ticker()
	for i = 1, self._unit:text_gui().ROWS, 1 do
		self._unit:text_gui():set_row_gap(i, 20)
		self._unit:text_gui():clear_row_and_guis(i)
		self._unit:text_gui():set_row_speed(i, i * 100 + 40 + 120 * math.rand(1))
	end

	local companies = {
		"Common Carriers",
		"Avalon",
		"Kranich",
		"Gensec Industries",
		"Murkywater Solutions",
		"OMNIA Technologies",
		"Spine Network",
		"DECA Technologies",
		"Atlantic Traffic Inc",
		"Bero Watches",
		"iPear",
		"Falcogini",
		"Monarch",
		"Garnet Group",
		"White Mesa",
		"TimeOut!",
		"DC Menswear",
		"Shield Malls",
		"Harvest & Trustee",
		"Benevolent Conglomerate",
		"Sparkle and Spirit",
		"Triceraopt",
		"Rated T",
		"Bodhi's Pool Maintenance & Repair",
		"Kung Bo China",
		"Tasteful Club",
		"Omni Transport",
		"First World Bank",
		"Mercy Hospital",
		"OVERKILL Bombers",
		"Starbreeze Suns",
		"SRC Finance Consultants",
		"Green Air Foundation",
		"Zecchino",
		"Telescam",
		"Smithsonian Bike Rentals",
		"DC Bus",
		"Hector the Dog Daycare",
		"DJ D Enterprises",
		"Jan SWE Security Corps.",
		"Jules Baguettes",
		"Robert's Bank of Savings & Trust",
		"Sweet Relief",
		"Ultracoat",
		"Sanco Gas",
		"Cheese Toast Inc.",
		"Kenneth Cleaning Services",
		"ShasanBox",
		"Sentinel",
		"Omni Exports",
		"Hefty Shipping & Transport LTD",
		"Almendia Logistics",
		"Capitol Savings Bank",
		"Perfect Fits",
		"Shear Hairmony",
		"Cosmetics DermoProfessionnel",
		"Sweat Like A Maniac Gym",
		"Miss We Bags & Accessories",
		"Gioielli Di Famiglia",
		"Douglas Development Corporation",
		"Raw Deal Sushi",
		"Apartments 4 Rent",
		"Twenty Four Seven",
		"Solid Gold Rifles",
		"OVE Power Tools",
		"The Mask Makers Guild",
		"Berger Combat Gear",
		"Infamy Eyewear",
		"Bronco Firearms",
		"TITAN",
		"Frans Yaeger Safes",
		"Precious Things",
		"Tempfix",
		"Importante",
		"Buffler",
		"The TylE",
		"Wamplet Industries",
		"Alliance Towing",
		"Alpha Electric",
		"Ball Fortress",
		"Ballinger",
		"Beacon",
		"Biggs",
		"Binksi Logging",
		"Binski Paper Co",
		"BLU Builders League United",
		"BLU Blast Complex",
		"BLU Brewery",
		"BLU Co",
		"BLU Freight & Shipping",
		"BLU Industries Incorporated",
		"Blue Corn Co.",
		"BLU Steel",
		"Bonk!",
		"Brown Nugget Prospecting",
		"Captain Dan's",
		"Casali Shafting Co.",
		"Clem's",
		"Cliffe Rocks Inc.",
		"Co Op",
		"Conagher's Tool & Munitions",
		"Cornwell",
		"Cracky Pop!",
		"Crummy's Burgers",
		"Dalokohs",
		"Driller",
		"Farmers Elevator",
		"Farmers Feed & Seed Co.",
		"Ferguson System",
		"Freeman Airboat Tours",
		"General Industries Co.",
		"Gilded Gold",
		"Gold Medal",
		"Goldstream Fuel Co.",
		"Gray Gravel Co.",
		"Hampshire's Heavy Lifting Equipment",
		"Handy Hoe",
		"Happy Farmers Cooperative",
		"Holdingford Mill",
		"Husky Acres",
		"Icarus Airliners",
		"Imperial Mining",
		"Industrial",
		"Jenkin Coal Co.",
		"Jimi Jam",
		"Jobbs Orchards",
		"Lucky Plucker",
		"Mann Co.",
		"Newell and Sons",
		"Northern Express",
		"Old Geezer",
		"P.R.P.",
		"Piper & Piper Pipeworks Inc.",
		"Primaprime",
		"Projecto",
		"RED Reliable Excavation Demolition",
		"Red Bread",
		"RED Iron",
		"RED Iron Works",
		"Red Shed",
		"Red Valley Mining",
		"Redstone Cargo",
		"Regal Plumbing Supplies",
		"Rib Place",
		"Rio Grande Coal Co.",
		"Rolling Stone Mining Logistics",
		"Sanders BBQ",
		"Schucker & Sons",
		"Scoot's Canoe",
		"Shiny's Bullion",
		"Sunny Hay",
		"Superior Feeds",
		"Telemax",
		"Wright Shipping",
		"XXX",
		"Zippy Plow",
		"Mus Rattus",
		"D+B",
		"Tigre Punks",
		"Lapin Angelique",
		"Dragon Couture",
		"Hip Snake",
		"Pegaso",
		"Sheep Heavenly",
		"Jupiter of the Monkey",
		"Pavo Real",
		"Natural Puppy",
		"Wild Boar",
		"Gatito",
		"Mithril Scale",
		"AMX",
		"Towa Records",
		"Cyco Records",
		"CAT"
	}

	if not TextTemplateBase.STOCK_PERCENT then
		TextTemplateBase.STOCK_PERCENT = {}
		local bankruptcy_chance = math.rand(0.01)
		local bad_chance = math.rand(0.1)
		local good_chance = math.rand(0.1)
		local joker_chance = math.rand(0.01)
		local srand = nil

		for i, company in ipairs(companies) do
			srand = 0

			if math.rand(1) < bankruptcy_chance then
				srand = math.rand(-99, -45)
			elseif math.rand(1) < bad_chance then
				srand = math.rand(-55, -5)
			elseif math.rand(1) < good_chance then
				srand = math.rand(0, 40)
			elseif math.rand(1) < joker_chance then
				srand = math.rand(-100, 250)
			else
				srand = math.rand(-10, 10)
			end

			TextTemplateBase.STOCK_PERCENT[i] = srand
		end
	end

	for i, company in ipairs(companies) do
		local j = TextTemplateBase.STOCK_PERCENT[i]
		local row = math.mod(i, self._unit:text_gui().ROWS) + 1

		self._unit:text_gui():add_text(row, company, "white")
		self._unit:text_gui():add_text(row, "" .. (j < 0 and "" or "+") .. string.format("%.2f", j) .. "%", j < 0 and "light_red" or "light_green", self._unit:text_gui().FONT_SIZE / 1.5, "bottom", nil)
		self._unit:text_gui():add_text(row, "  ", "white")
	end
end