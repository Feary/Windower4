function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.Weapons:options('None','Default','DualWeapons','Swords','NukeWeapons')
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = "Daurdabla"
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.weapons.Default = {main="Carnwenhan", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Carnwenhan", sub="Mandau"}
	sets.weapons.Swords = {main="Vampirism", sub="Vampirism"}
	sets.weapons.NukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {	
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Defending Ring",
		back="Intarabus's Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		rear="Mendi. Earring",
		back="Intarabus's Cape", feet="Kaykaus Boots"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.BardSong = {
		main="Kali", sub="Genbu Shield", ranged="Gjallarhorn", ammo=empty,
		head="Fili Calot +1", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Defending Ring",
        back="Intarabus's Cape", waist="Witful Belt", legs="Gende. Spats +1", feet=gear_telchine_feet_Song}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
	
	-- Precast sets to enhance JAs	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps +3",hands="Aya. Manopolas +2",ring1="Ilabrat Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.precast.WS.Acc = {
		head="Aya. Zucchetto +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"})
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Ginsen",
			-- Lustratio Cap +1
			head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
			-- Lustratio Gloves +1
			body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Rancerous Mantle
			back="Ground. Mantle +1", waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustratio Leggings +1"})
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"})
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
			-- Lustratio Cap +1
			head="Aya. Zucchetto +2", neck="Love Torque", lear="Moonshade Earring", rear="Brutal Earring",
			-- Lustratio Gloves +1
			body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
			--Vespid Mantle
			back="Ground. Mantle +1", waist="Wanion Belt", legs="Lustr. Subligar +1", feet="Lustratio Leggings +1"})
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +2", neck="Moonbow Whistle +1", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Bihu Jstcorps. +2  Carb. Ring +1
			body="Bihu Jstcorps +3", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
			-- Vespid Mantle
			back="Ground. Mantle +1", waist="Windbuffet Belt +1", legs="Bihu Cannions +1", feet="Aya. Gambieras +2"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Cessance Earring", rear="Brutal Earring",}
	sets.AccMaxTP = {lear="Cessance Earring", rear="Brutal Earring",}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring",
		back="Intarabus's Cape", waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast['Foe Lullaby'] = {body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs",
	sets.midcast['Foe Lullaby II'] = {body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs",
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp +1", body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs",
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp +1", body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs",
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet"}
	sets.midcast.Etude = {} -- head="Mousai Turban"
	sets.midcast.Mambo = {}	-- feet="Mousai Crackows"
	sets.midcast.Minne = {} -- legs="Mousai Seraweels"
	sets.midcast.Threnody = {} -- body="Mousai Manteel"
	sets.midcast.Mazurka = {range="Blurred Harp +1"}	
	sets.midcast.March = {hands="Fili Manchettes +1"}	
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {range="Marsyas"})	
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Carol = {} -- hands="Mousai Gages"
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {}
	
	-- Merited Songs
	sets.midcast.Dirge = {}
	sets.midcast.Sirvente = {}
	
	-- For song buffs (Full Duration, AF3 set bonus, DT)
	sets.midcast.SongEffect = {
		-- Ammurapi Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Genmei Earring
		head="Fili Calot +1", neck="Moonbow Whistle +1", lear="Musical Earring", rear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Stikini Ring", rring="Defending Ring",
		back="Intarabus's Cape", legs="Inyanga Shalwar +2", feet="Brioso Slippers +1"}

	-- For song debuffs (duration primary, accuracy secondary)
	-- Lullaby
	sets.midcast.SongDebuff = {
		-- Ammurapi Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Genmei Earring
		head="Fili Calot +1", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Brioso Slippers +1"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Genmei Earring
		-- Incanter's Torque
		head="Bihu Roundlet +1", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Fili Rhingrave +1", feet="Inyan. Crackows +2"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring",
		back="Intarabus's Cape", waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main={name="Chatoyant Staff", priority=2}, sub={name=empty, priority=1},
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--
		back="Tempered Cape +1", waist="Bishop's Sash", legs="Gyve Trousers", feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"
	
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Marin Staff +1",sub="Clemency Grip"})
	
	sets.midcast['Enfeebling Magic'] = {
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		head="Inyanga Tiara +2", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		head="Inyanga Tiara +2", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	sets.midcast['Enhancing Magic'] = {ammo="Hasty Pinion +1",
		--main="Serenity",sub="Fulcio Grip",
		--,neck="Voltsurge Torque",
		head=gear_telchine_head_Duration, ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		--body="Telchine Chas.",
		hands=gear_telchine_hands_Duration, lring="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		--neck="Nodens Gorget",ear2="Earthcry Earring",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash",})
		
	sets.midcast['Elemental Magic'] = {
		head="Inyanga Tiara +2", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	sets.midcast['Elemental Magic'].Resistant = {
		head="Inyanga Tiara +2", neck="Moonbow Whistle +1", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	-- Gear for specific elemental nukes.
	sets.WindNuke = {}--main="Marin Staff +1"
	sets.IceNuke = {}--main="Ngqoqwanb"
	
	-- Sets to return to when not performing an action.
	sets.Sheltered = {ring2="Sheltered Ring"}
	sets.Capacity = {back={name="Mecisto. Mantle", augments={'Cap. Point+40%','HP+18','Rng.Atk.+4','DEF+13',}}}
	sets.Warp = {ring2="Warp Ring"}
	sets.RREar = {ear2="Reraise Earring"}
	
	-- Resting sets
	sets.resting = {main={name="Chatoyant Staff", priority=2}, sub={name=empty, priority=1}, range="Gjallarhorn",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Assiduity Pants +1", feet="Fili Cothurnes +1"}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Assiduity Pants +1", feet="Fili Cothurnes +1"}

	sets.idle.Weak = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Assiduity Pants +1", feet="Aya. Gambieras +2"}
	
	sets.idle.PDT = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1",  lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Defense sets
	sets.defense.PDT = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.defense.MDT = {main="Mafic Cudgel", sub="Genbu's Shield", range="Gjallarhorn",
		head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},ammo="Ginsen",
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.engaged.DW = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},ammo="Ginsen",
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 4)
end