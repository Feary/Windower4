function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

	gear.mabstaff = {name="Serenity",augments={"DMG:+18", "CHR+1", "Mag.Atk.Bns+27"}}
	gear.maccstaff = {name="Serenity",augments={"DMG:+12", "MND+2", "Mag. Acc.+22"}}
	
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

function init_gear.sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.weapons = {main="Mandau",sub="Kali"}
	sets.Swords = {main="Vampirism",sub="Vampirism"}
	sets.NukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {	
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat",  lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", rring="Prolix Ring",
		back="Intarabus's Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		body="Heka's Kalasiris", 
		back="Pahtli Cape", feet="Kaykaus Boots"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.BardSong = {
		-- Kali
		main={name="Felibre's Dague", priority=1},
		head="Fili Calot +1", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Defending Ring",
        back="Intarabus's Cape", waist="Witful Belt", legs="Gende. Spats +1", feet="Telchine Pigaches"}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
		
	-- Precast sets to enhance JAs	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Aya. Zucchetto +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Ilabrat Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	sets.precast.WS.Acc = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Patricius Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"})
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Patricius Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"})
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
			head="Aya. Zucchetto +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Patricius Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", rring="Prolix Ring",
		back="Intarabus's Cape", waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {body="Fili Hongreline +1", hands="Brioso Cuffs", legs="Inyanga Shalwar +2"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Etude = {}
	sets.midcast.Mambo = {}	
	sets.midcast.Minne = {}
	sets.midcast.Threnody = {}
	sets.midcast.Mazurka = {range="Daurdabla"}
	
	-- Merited Songs
	sets.midcast.Dirge = {}
	sets.midcast.Sirvente = {}
	
	-- For song buffs (Full Duration, AF3 set bonus, DT)
	-- 
	sets.midcast.SongEffect = {
		-- Kali Ammurapi Shield
		main={name="Legato Dagger", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Genmei Earringn
		head="Fili Calot +1", neck="Moonbow Whistle", lear="Musical Earring", rear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Stikini Ring", rring="Defending Ring",
		back="Harmony Cape", waist="Corvax Sash", legs="Inyanga Shalwar +2", feet="Brioso Slippers +1"}

	-- For song debuffs (duration primary, accuracy secondary)
	-- Lullaby
	sets.midcast.SongDebuff = {
		-- Carn Ammurapi Shield
		main={name="Legato Dagger", priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Fili Calot +1", neck="Aoidos' Matinee", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Brioso Slippers +1"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Incanter's Torque
		head="Bihu Roundlet +1", neck="Moonbow Whistle", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Fili Rhingrave +1", feet="Inyan. Crackows +1"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Kisar Ring
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", rring="Prolix Ring",
		back="Intarabus's Cape", waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main={name="Arka IV", priority=2}, sub={name="", priority=1},
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Gifted Earring", rear="Novia Earring",
		body="Heka's Kalasiris", hands="Telchine Gloves", lring="Sirona's Ring", rring="Stikini Ring",
		--
		back="Tempered Cape +1", waist="Bishop's Sash", legs="Aya. Cosciales +2", feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Marin Staff +1",sub="Clemency Grip"})
	
	sets.midcast['Enfeebling Magic'] = {
		main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		head="Inyanga Tiara +1", neck="Moonbow Whistle", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {
		main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		head="Inyanga Tiara +1", neck="Moonbow Whistle", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
		
	sets.midcast['Enhancing Magic'] = {
		--main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		--head="Telchine Cap",neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Telchine Chas.",hands="Telchine Gloves",
		ring1="Prolix Ring",
		--legs="Telchine Braconi",feet="Telchine Pigaches"
		back="Swith Cape +1",waist="Witful Belt",}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		--neck="Nodens Gorget",ear2="Earthcry Earring",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash",})
		
	sets.midcast['Elemental Magic'] = {
		head="Inyanga Tiara +1", neck="Moonbow Whistle", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
		
	sets.midcast['Elemental Magic'].Resistant = {
		head="Inyanga Tiara +1", neck="Moonbow Whistle", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
	-- Sets to return to when not performing an action.
	
	sets.Capacity = {back="Aptitude Mantle +1"}
	sets.Warp = {ring2="Warp Ring"}
	sets.RREar = {ear2="Reraise Earring"}
	
	-- Resting sets
	sets.resting = {legs="Assid. Pants +1",feet="Chelona Boots +1"}
	
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Assiduity Pants +1", feet="Fili Cothurnes +1"}

	sets.idle.Weak = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Assiduity Pants +1", feet="Aya. Gambieras +1"}
	
	sets.idle.PDT = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque",  lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	
	-- Defense sets
	sets.defense.PDT = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",range="Gjallarhorn",
		head="Inyanga Tiara +1",neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +1"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},ammo="Ginsen",
		head="Aya. Zucchetto +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.engaged.DW = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},ammo="Ginsen",
		head="Aya. Zucchetto +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Patricius Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 4)
end