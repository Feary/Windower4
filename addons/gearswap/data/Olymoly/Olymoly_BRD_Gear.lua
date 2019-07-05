function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.Weapons:options('None','Default','Twashtar','DualWeapons','DualSwords')--'Aeneas',
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = "Daurdabla"
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Capes 
	gear.tp_jse_back = { 	name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = { 	name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}} 
	gear.FC_jse_back = {	name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
	
	-- Snowdim acc leafslit wsd  dusk quad attack
	gear.Instrument_tp = {	name="Linos"}
	-- Snowdim acc leafslit wsd
	gear.Instrument_wsd = {	name="Linos"}
	
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
	
	send_command('alias dum exec songs/dummy.txt')
	send_command('alias ntmmmm exec songs/ntmmmm')
	send_command('alias p2 input /pcmd leave;wait 1;input /tell Bigtymer invite;')
	
	
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Single 
	sets.weapons.Default = {main="Carnwenhan", sub="Genbu's Shield"}
	sets.weapons.Twashtar = {main="Twashtar", sub="Genbu's Shield"}
	sets.weapons.Mandau = {main="Mandau", sub="Genbu's Shield"}
	--sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Sword = {main="Naegling", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Twashtar",sub="Mandau"}
	sets.weapons.DualSwords = {main="Naegling",sub="Vampirism"}
	sets.weapons.DualNukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Oranyan", sub=none,
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		rear="Mendi. Earring",
		back=gear.FC_jse_back, feet="Kaykaus Boots"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.BardSong = {main="Oranyan", sub=none, -- Clericy Strap +1
		head="Fili Calot +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet=gear_telchine_feet_Song}
	
	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})	
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
	sets.precast.WS = {ranged=gear.Instrument_wsd,
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",hands="Lustr. Mittens +1",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}
	sets.precast.WS.Acc = {ranged=gear.Instrument_wsd,
		head="Aya. Zucchetto +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +2", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_wsd,
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Dynamic Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"})
	
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- Rancerous Mantle
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
	
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_wsd,
		head="Lustratio Cap +1", neck="Caro Necklace", lear="Sherida Earring", rear="Ishvara Earring",
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
		
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_wsd,
		-- Bard's Charm A  Linos ws acc dex attack
		head="Lustratio Cap +1", neck="Caro Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Kariyeh ring +1 
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
		
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_wsd,
		-- Bard's Charm +3
		head="Bihu Roundlet +3", neck="Moonbow Whistle +1", lear="Cessance Earring", rear="Regal Earring",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
		
	-- Sword
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_wsd,
		-- Bard's Charm +3
		head="Bihu Roundlet +3", neck="Moonbow Whistle +1", lear="Cessance Earring", rear="Regal Earring",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Cessance Earring", rear="Brutal Earring",}
	sets.AccMaxTP = {lear="Cessance Earring", rear="Brutal Earring",}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Oranyan", sub=none,
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast['Foe Lullaby'] = {body="Fili Hongreline +1", legs="Inyanga Shalwar +2", hands="Brioso Cuffs +2"}
	sets.midcast['Foe Lullaby II'] = {body="Fili Hongreline +1", hands="Brioso Cuffs +2", legs="Inyanga Shalwar +2"} 
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp +1", body="Fili Hongreline +1", hands="Brioso Cuffs +2", legs="Inyanga Shalwar +2"}
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp +1", body="Fili Hongreline +1", hands="Brioso Cuffs +2", legs="Inyanga Shalwar +2"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet +2"}
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
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	
	-- Merited Songs
	sets.midcast.Dirge = {}
	sets.midcast.Sirvente = {}
	
	-- For song buffs (Full Duration, AF3 set bonus, DT)
	sets.midcast.SongEffect = {
		-- Genmei's Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		-- Genmei Earring
		head="Fili Calot +1", neck="Moonbow Whistle +1", lear="Genmei Earring", rear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Dark Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}

	sets.midcast.SongEffect.DW = {}

	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {range="Gjallarhorn",
		-- Ammurapi Shield
		main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		--Brioso Roundlet +3
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Brioso Cuffs +3 Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Brioso Roundlet +3 
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		--Brioso Cuffs +3 Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Inyan. Dastanas +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}

	sets.midcast.SongDebuff.DW = {}
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main={name="Chatoyant Staff", priority=2}, sub={name=empty, priority=1},
		head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		back="Tempered Cape +1", waist="Bishop's Sash", legs="Gyve Trousers", feet="Kaykaus Boots"}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {back="Grapevine Cape"}--,waist="Gishdubar Sash"
	
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Marin Staff +1",sub="Clemency Grip"
	
	sets.midcast['Enfeebling Magic'] = {main="Oranyan Staff", sub="Enki Strap",
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan Staff", sub="Enki Strap",
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		--Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
		
	sets.midcast['Enhancing Magic'] = {main="Oranyan Staff", sub="Enki Strap",
		--main="Carnwenhan",sub="Ammurapi Shield",
		head=gear_telchine_head_Duration, neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash",})
		
	sets.midcast['Elemental Magic'] = {main="Oranyan Staff", sub="Enki Strap",
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
	sets.midcast['Elemental Magic'].Resistant = {main="Oranyan Staff", sub="Enki Strap",
		head="Brioso Roundlet +2", neck="Moonbow Whistle +1", lear="Digni. Earring", rear="Regal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Brioso Justau. +2", hands="Brioso Cuffs +2", lring="Stikini ring", rring="Stikini ring",
		-- Brioso Cannions +3 
		back=gear.FC_jse_back, waist="Luminary Sash", legs="Brioso Cannions +2", feet="Brioso Slippers +3"}
		
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
		back=gear.FC_jse_back, waist="Flume Belt", legs="Assiduity Pants +1", feet="Fili Cothurnes +1"}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Sangoma", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Assiduity Pants +1", feet="Fili Cothurnes +1"}

	sets.idle.Weak = {main={name="Mafic Cudgel", priority=2}, sub={name="Genbu's Shield", priority=1}, range="Gjallarhorn",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Dark Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Assiduity Pants +1", feet="Aya. Gambieras +2"}
	
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
		back=gear.FC_jse_back,waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main={name="Carnwenhan", priority=2}, sub={name="Genbu's Sheild", priority=1}, ranged=gear.Instrument_tp,
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.engaged.Acc = {main="Carnwenhan",sub="Genbu's Shield", ranged=gear.Instrument_tp,
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.engaged.DW = {main={name="Carnwenhan", priority=2}, sub={name="Twashtar", priority=1}, ranged=gear.Instrument_tp,
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.engaged.DW.Acc = {main="Carnwenhan",sub="Twashtar",ranged=gear.Instrument_tp,
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if world.area:contains("Dynamis") then
		set_macro_page(8, 4)
	else
		set_macro_page(1, 4)
	end
end


function user_job_self_command(commandArgs, eventArgs)
	--if commandArgs[1]:lower() == 'ntmmmm' then
	
--	end
	--if commandArgs[1]:lower() == 'p2' then
		--windower.chat.input('/pcmd leave;wait 1;input /tell Bigtymer invite;'')
	--end	
end

