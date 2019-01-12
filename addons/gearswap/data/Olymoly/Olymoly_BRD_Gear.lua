function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.Weapons:options('None','Default','DualWeapons')
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = "Daurdabla"
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` gs c cycle ExtraSongsMode')
	send_command('bind @` gs c cycle ExtraSongsMode')
	send_command('bind @!^` input /pcmd leave')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoBuffMode')
	
	send_command('alias azz input /pcmd leave;wait 1;input /tell Azzriel invite;')
	send_command('alias big input /pcmd leave;wait 1;input /tell Bigtymer invite;')
	send_command('alias bt input /pcmd leave;wait 1;input /tell Bigtymer invite;')
	send_command('alias p1 input /pcmd leave;wait 1;input /tell Azzriel invite;')
	send_command('alias p2 input /pcmd leave;wait 1;input /tell Bigtymer invite;')
	
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.weapons.Default = {main="Carnwenhan", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Carnwenhan", sub="Twashtar"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = { 
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back="Intarabus's Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		rear="Mendi. Earring",
		back="Intarabus's Cape", feet="Kaykaus Boots"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.BardSong = {
		main="Kali", sub="Genbu's Shield", 
		head="Fili Calot +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
        back="Intarabus's Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet=gear_telchine_feet_Song}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
	
	-- Precast sets to enhance JAs	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",hands="Aya. Manopolas +2",ring1="Ilabrat Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Bihu Slippers +3"}
	sets.precast.WS.Acc = {
		head="Aya. Zucchetto +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"})
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lustratio Cap +1
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		-- Lustratio Gloves +1
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		-- Rancerous Mantle
		back="Ground. Mantle +1", waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustratio Leggings +1"})
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +2", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"})
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		-- Lustratio Cap +1
		head="Aya. Zucchetto +2", neck="Love Torque", lear="Moonshade Earring", rear="Brutal Earring",
		-- Lustratio Gloves +1
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Rajas Ring", rring="Ramuh Ring +1",
		--Vespid Mantle
		back="Ground. Mantle +1", waist="Wanion Belt", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {
		head="Bihu Roundlet +3", neck="Moonbow Whistle +1", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Carb. Ring +1
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Windbuffet Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Cessance Earring", rear="Brutal Earring",}
	sets.AccMaxTP = {lear="Cessance Earring", rear="Brutal Earring",}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back="Intarabus's Cape", waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast['Foe Lullaby'] = {body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs +3",
	sets.midcast['Foe Lullaby II'] = {body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs +3",
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp +1", body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs +3",
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp +1", body="Fili Hongreline +1", legs="Inyanga Shalwar +2"} --hands="Brioso Cuffs +3",
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet +1"}
	sets.midcast.Etude = {} -- head="Mousai Turban"
	sets.midcast.Mambo = {}	-- feet="Mousai Crackows"
	sets.midcast.Minne = {} -- legs="Mousai Seraweels"
	sets.midcast.Threnody = {} -- body="Mousai Manteel"
	sets.midcast.Mazurka = {range="Daurdabla"}	
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
		-- Genmei's Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Genmei Earring
		head="Fili Calot +1", neck="Moonbow Whistle +1", lear="Musical Earring", rear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Stikini Ring", rring="Defending Ring",
		back="Intarabus's Cape", waist="Flume Belt", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}

	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		-- Ammurapi Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		--Brioso Roundlet +3
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Brioso Cuffs +3 Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Brioso Roundlet +3 
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		--Brioso Cuffs +3 Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
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
		back="Tempered Cape +1", waist="Bishop's Sash", legs="Gyve Trousers", feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"
	
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Marin Staff +1",sub="Clemency Grip"
	
	sets.midcast['Enfeebling Magic'] = {
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		--Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
		
	sets.midcast['Enhancing Magic'] = {
		--main="Carnwenhan",sub="Ammurapi Shield",
		head=gear_telchine_head_Duration, neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		--neck="Nodens Gorget",ear2="Earthcry Earring",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash",})
		
	sets.midcast['Elemental Magic'] = {
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
	sets.midcast['Elemental Magic'].Resistant = {
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back="Intarabus's Cape", waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
		
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
	
	sets.defense.MDT = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.engaged.DW = {main={name="Carnwenhan", priority=2}, sub={name="Mandau", priority=1},
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if world.area:contains("Dynamis") then
		set_macro_page(8, 4)
	else
		set_macro_page(1, 4)
	end
end

function calculate_duration(spellName, spellMap)
    local mult = 1
    if player.equipment.range == "Daurdabla" then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
	if player.equipment.range == "Marsyas" then mult = mult + 0.5 end
	if spellMap == "Lullaby" and player.equipment.range == "Blurred Harp" then mult = mult + 0.2 end
	if spellMap == "Lullaby" and player.equipment.range == "Blurred Harp +1" then mult = mult + 0.4 end

    if player.equipment.main == "Carnwenhan" then mult = mult + 0.5 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
	if player.equipment.main == "Kali" then mult = mult + 0.05 end
	if player.equipment.sub == "Kali" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
	if player.equipment.neck == "Moonbow Whistle" then mult = mult + 0.2 end
	if player.equipment.neck == "Mnbw. Whistle +1" then mult = mult + 0.3 end
    if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if player.equipment.body == "Fili Hongreline" then mult = mult + 0.11 end
	if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.12 end
    if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
	if player.equipment.legs == "Inyanga Shalwar" then mult = mult + 0.12 end
	if player.equipment.legs == "Inyanga Shalwar +1" then mult = mult + 0.15 end
	if player.equipment.legs == "Inyanga Shalwar +2" then mult = mult + 0.17 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
	if player.equipment.feet == "Brioso Slippers +2" then mult = mult + 0.13 end
	if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.15 end

	if spellMap == 'Etude' and player.equipment.head == "Mousai Turban" then mult = mult + 0.1 end
	if spellMap == 'Etude' and player.equipment.head == "Mousai Turban +1" then mult = mult + 0.2 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 end
	if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +2" then mult = mult + 0.1 end
	if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +3" then mult = mult + 0.2 end
    if spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 end
	if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot" then mult = mult + 0.1 end
	if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1" then mult = mult + 0.1 end
	if spellMap == 'Threnody' and player.equipment.body == "Mousai Manteel" then mult = mult + 0.1 end
	if spellMap == 'Threnody' and player.equipment.body == "Mou. Manteel +1" then mult = mult + 0.2 end
	if spellMap == 'Minuet' and player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline" then mult = mult + 0.1 end
	if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if spellMap == 'Carol' and player.equipment.hands == "Mousai Gages" then mult = mult + 0.1 end
	if spellMap == 'Carol' and player.equipment.hands == "Mousai Gages +1" then mult = mult + 0.2 end
	if spellMap == 'March' and player.equipment.hands == "Ad. Mnchtte. +2" then mult = mult + 0.1 end
	if spellMap == 'March' and player.equipment.hands == "Fili Manchettes" then mult = mult + 0.1 end
	if spellMap == 'March' and player.equipment.hands == "Fili Manchettes +1" then mult = mult + 0.1 end
    if spellMap == 'Minne' and player.equipment.feet == "Mousai Seraweel" then mult = mult + 0.1 end
	if spellMap == 'Minne' and player.equipment.feet == "Mou. Seraweel +1" then mult = mult + 0.2 end
	if spellMap == 'Ballad' and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 end
	if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave" then mult = mult + 0.1 end
	if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1" then mult = mult + 0.1 end
    if spellMap == 'Mambo' and player.equipment.feet == "Mousai Crackows" then mult = mult + 0.1 end
	if spellMap == 'Mambo' and player.equipment.feet == "Mou. Crackows +1" then mult = mult + 0.2 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes" then mult = mult + 0.1 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1" then mult = mult + 0.1 end

	if JP_1200 == true then
		mult = mult + 0.05  --1200 Job Points 5% Duration 
	end
	
    if buffactive.Troubadour then
        mult = mult*2
    end
	
    if spellName == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end

    local generalClass = get_song_class(spell)
   
    --add_to_chat(8,'Info: Spell Name'..spell.name..' Spell Map:'..spellMap..' General Class:'..generalClass..' Multiplier:'..mult)
   
    if spell.name == "Foe Lullaby II" or spell.name == "Horde Lullaby II" then
        base = 60
    elseif spell.name == "Foe Lullaby" or spell.name == "Horde Lullaby" then
        base = 30
    elseif spell.name == "Carnage Elegy" then
        base = 180
    elseif spell.name == "Battlefield Elegy" then
        base = 120
    elseif spell.name == "Pining Nocturne" then
        base = 120
    elseif spell.name == "Maiden's Virelai" then
        base = 20
    end
   
    if generalClass == 'SongEffect' then
        base = 120
        totalDuration = math.floor(mult*base)      
    end
   
    totalDuration = math.floor(mult*base)      
   
    if string.find(spell.name,'Lullaby') then
        -- add_to_chat(8,'Adding 20 seconds to Timer for Lullaby Job Points')
        totalDuration = totalDuration + JP_Lullaby
    end
   
    if buffactive['Clarion Call'] then
        if buffactive.Troubadour then
            -- Troubadour Doubles Clarion Call
            totalDuration = totalDuration + (JP_Clarion * 2 * 2)
        else
            -- add_to_chat(8,'Adding 20 seconds to Timer for Clarion Call Job Points')
            totalDuration = totalDuration + JP_Clarion * 2
        end
    end
   
    if buffactive['Tenuto'] then
        -- add_to_chat(8,'Adding 40 seconds to Timer for Tenuto Job Points')
        totalDuration = totalDuration + JP_Tenuto * 2
    end
   
    if buffactive['Marcato'] then
        -- add_to_chat(8,'Adding 20 seconds to Timer for Marcato Job Points')
        totalDuration = totalDuration + JP_Marcato
    end
   
  
	--if buffactive.Troubadour then
		-- Assuming 20 seconds for capped Troubadour and you actually pre-cast with a Bihu Justaucorps.
      --  totalDuration = totalDuration + 20  
    --end
  
    add_to_chat(8,spell.name..' duration: '..totalDuration..' seconds')
   
    return totalDuration
	
end
