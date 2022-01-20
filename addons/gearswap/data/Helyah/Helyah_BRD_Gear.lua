function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.Weapons:options('None','Sword')--'Aeneas', Carn','Twashtar','Mandau', 'DualDaggers','DualSwords'
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = "Blurred Harp +1"
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Capes 
	gear.tp_jse_back = { 	name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = { 	name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = {	name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-1%',}}
	
	-- Snowdim Acc leafslit double atk  dusktip quad attack
	gear.Instrument_TP = {name="Linos", augments={'Attack+20','"Store TP"+4','Quadruple Attack +3',}}
	-- Snowslit atk/acc leaftip wsd Dusksslit Save TP
	gear.Instrument_WSD = {name="Linos", augments={'Accuracy+14 Attack+14','Weapon skill damage +1%','Quadruple Attack +3',}}
	
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
	send_command('alias p1 input /pcmd leave;wait 1;input /tell Azzriel invite;')
	send_command('alias p2 input /pcmd leave;wait 1;input /tell Bigtymer invite;')
		
	-- Songs Scrits 
	-- nt = Nitro
	-- H = March  
	-- A = Minuet
	-- B = Ballad
	-- M = Madrigal
	-- P = Prelude
	-- D = Minne
	
	send_command('bind home send @brd input /ma "Horde\'s Lullaby" <tid>"')
	send_command('bind !home send @brd input /ma "Nightingale" <me>"')
	send_command('bind ^home send @brd input /ma "Troubadour" <me>"')
	send_command('bind @home send @brd input /ma "Marcato" <me>"')
	send_command('bind ~home send @brd input /ma "Pianissimo" <p1>"')
	
	-- dummy songs
	send_command('alias dum exec songs/dummy.txt')
	-- Dummy 5 Songs
	send_command('alias dumm exec songs/dummy2.txt')
	send_command('alias dum5 exec songs/dummy2.txt')
	send_command('alias ccdum exec songs/dummy2.txt')
	
	-- NT 5 Songs
	
	-- NT 4 Songs
	send_command('alias ntHHMM exec songs/ntHHMM')
	send_command('alias ntHMMA exec songs/ntHMMA')
	send_command('alias ntHHAA exec songs/ntHHAA')
	send_command('alias ntHHMA exec songs/ntHHMA')
	send_command('alias ntPPAA exec songs/ntPPAA')
	
	-- 4 Songs
	send_command('alias HHBB exec songs/HHBB')
	send_command('alias HHMA exec songs/HHMA')
	send_command('alias HHAA exec songs/HHAA')	
	
	send_command('alias p2 input /pcmd leave;wait 1;input /tell Bigtymer invite;')
	
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Single 
	sets.weapons.Default = {main="Sangoma", sub="Genmei Shield"}
	--sets.weapons.Aeneas = {main="Aeneas", sub="Genmei Shield"}
	sets.weapons.Carn = {main="Legato Dagger", sub="Genmei Shield"}
	sets.weapons.Twashtar = {main="Twashtar", sub="Genmei Shield"}
	sets.weapons.Mandau = {main="Mandau", sub="Genmei Shield"}
	--sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Sword = {main="Naegling", sub="Genmei Shield"}
	-- Dualwield
	sets.weapons.DualDaggers = {main="Twashtar", sub="Mandau"}
	sets.weapons.DualSwords = {main="Naegling", sub="Blurred Knife +1"}
	sets.weapons.DualNukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Sangoma",
		--main="Oranyan", sub="Clerisy Strap +1",
		--head="Nahtirah Hat", neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		lear="Loquac. Earring",
		--hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		body="Inyanga Jubbah +2",  
		-- feet="Bihu Slippers +3"
		back=gear.FC_jse_back, wai0st="Witful Belt", legs="Aya. Cosciales +2", feet=gear.telchine_feet_FC}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		--rear="Mendi. Earring",
		--feet="Kaykaus Boots"
		back=gear.FC_jse_back, })

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})--waist="Siegel Sash"
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {}) --head="Umuthi Hat"

	sets.precast.FC.BardSong = {main="Sangoma",
		-- main="Oranyan", sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque",  rear="Enchntr. Earring +1",
		head="Aoidos' Calot +1",  lear="Loquac. Earring",
		--  hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		body="Inyanga Jubbah +2",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet=gear.telchine_feet_Song}
	
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
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ranged=gear.Instrument_WSD,
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",hands="Lustr. Mittens +1",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}
		
	sets.precast.WS.Acc = {ranged=gear.Instrument_WSD,
		head="Aya. Zucchetto +1", neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3", hands="Aya. Manopolas +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		head="Bihu Roundlet +3", neck="Fotia Gorget", lear="Brutal Earring", rear="Ishvara Earring",
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		body="Ayanmo Corazza +2", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- Rancerous Mantle
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
	
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		head="Lustratio Cap +1", neck="Caro Necklace", lear="Brutal Earring", rear="Ishvara Earring",
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
		
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Bard's Charm A 
		head="Lustratio Cap +1", neck="Caro Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Kariyeh ring +1 
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
		
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Bard's Charm +3
		head="Bihu Roundlet +3", neck="Moonbow Whistle +1", lear="Ishvara Earring", rear="Regal Earring",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
		
	-- Sword
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		head="Lustratio Cap +1", neck="Caro Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Bihu Jstcorps. +3", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Cessance Earring", rear="Brutal Earring"}
	sets.AccMaxTP = {lear="Cessance Earring", rear="Brutal Earring"}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Oranyan", sub="Clerisy Strap +1",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast['Foe Lullaby'] = {legs="Inyanga Shalwar +2"} -- body="Fili Hongreline +1", hands="Brioso Cuffs +3",
	sets.midcast['Foe Lullaby II'] = {legs="Inyanga Shalwar +2"} -- body="Fili Hongreline +1", hands="Brioso Cuffs +3",
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp +1", legs="Inyanga Shalwar +2"} --  body="Fili Hongreline +1", hands="Brioso Cuffs +3",
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp +1",  legs="Inyanga Shalwar +2"} --body="Fili Hongreline +1", hands="Brioso Cuffs +3",
	sets.midcast.Madrigal = {}--head="Fili Calot +1"
	sets.midcast.Paeon = {}-- head="Brioso Roundlet +3"
	sets.midcast.Etude = {} -- head="Mousai Turban"
	sets.midcast.Mambo = {range="Blurred Harp +1"} -- feet="Mousai Crackows"
	sets.midcast.Minne = {} -- legs="Mousai Seraweels"
	sets.midcast.Threnody = {} -- body="Mousai Manteel"
	sets.midcast.Mazurka = {range="Blurred Harp +1"}-- range="Daurdabla"
	sets.midcast.March = {}	--hands="Fili Manchettes +1"
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {range="Marsyas"})	
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Carol = {} -- hands="Mousai Gages"
	sets.midcast["Sentinel's Scherzo"] = {}--feet="Fili Cothurnes +1"
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	
	-- Merited Songs
	sets.midcast.Dirge = {}
	sets.midcast.Sirvente = {}
	
	-- For song buffs (Full Duration, AF3 set bonus, DT)
	sets.midcast.SongEffect = {range="Gjallarhorn",
		main="Legato Dagger", sub="Genmei Shield",
		--head="Fili Calot +1", lear="Genmei Earring", rear="Etiolation Earring",
		head="Aoidos' Calot +1", neck="Moonbow Whistle +1",
		-- body="Fili Hongreline +1",  hands="Fili Manchettes +1", lring="Dark Ring",
		body="Aoidos' Hngrln. +1", hands="Ad. Mnchtte +1", rring="Defending Ring",
		--feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Flume Belt", legs="Inyanga Shalwar +2"}

	sets.midcast.SongEffect.DW = {}

	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {range="Gjallarhorn",		
		main="Legato Dagger", 
		-- head="Brioso Roundlet +3", sub="Ammurapi Shield", lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {range="Gjallarhorn",		
		main="Legato Dagger", 
		-- head="Brioso Roundlet +3", sub="Ammurapi Shield", lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}

	sets.midcast.SongDebuff.DW = {range="Gjallarhorn",		
		main="Legato Dagger", 
		-- head="Brioso Roundlet +3", sub="Ammurapi Shield", lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- Leyline
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Aya. Cosciales +2", feet=gear.telchine_feet_Song}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}
		
	-- Weather/Day
	sets.midcast.LightWeatherCure = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}
	sets.midcast.LightDayCure = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}
	sets.midcast.Curaga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}

	sets.midcast.LightDayCuraga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}
	
	sets.midcast.Cure.DT = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		--back="Tempered Cape +1", waist="Bishop's Sash",  feet="Kaykaus Boots"
		legs="Gyve Trousers",}
		
	sets.Self_Healing = {}--waist="Gishdubar Sash"
	sets.Cure_Received = {}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape", waist="Gishdubar Sash"
	
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Marin Staff +1",sub="Clemency Grip"
	
	sets.midcast['Enfeebling Magic'] = {main="Naegling",
		--main="Oranyan", sub="Enki Strap",
		--head="Brioso Roundlet +3",  lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"} 
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Naegling",
		--main="Oranyan", sub="Enki Strap",
		--head="Brioso Roundlet +3",  lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"} 
		
	sets.midcast['Enhancing Magic'] = {main="Sangoma",
		-- sub="Ammurapi Shield",
		--  ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		head=gear.telchine_head_Duration, neck="Melic Torque", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		--ear2="Earthcry Earring",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash",})
		
	sets.midcast['Elemental Magic'] = {main="Naegling",
		--main="Oranyan", sub="Enki Strap",
		--head="Brioso Roundlet +3",  lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"} 
	sets.midcast['Elemental Magic'].Resistant = {main="Naegling",
		--main="Oranyan", sub="Enki Strap",
		--head="Brioso Roundlet +3",  lear="Digni. Earring", rear="Regal Earring",
		head="Inyanga Tiara +1", neck="Moonbow Whistle +1",
		-- body="Brioso Justau. +3", hands="Brioso Cuffs +3", Stikini Ring +1 Stikini Ring +1
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +1", lring="Stikini ring", rring="Stikini ring",
		--  waist="Luminary Sash", legs="Brioso Cannions +3", feet="Brioso Slippers +3"
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"} 
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	-- Sets to return to when not performing an action.
	sets.Sheltered = {ring2="Sheltered Ring"}
	sets.RREar = {ear2="Reraise Earring"}
	
	-- Resting sets
	sets.resting = {main="Sangoma", sub="Genmei Shield", range="Gjallarhorn",
		head="Inyanga Tiara +1", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		-- legs="Assiduity Pants +1", feet="Fili Cothurnes +1"
		back=gear.FC_jse_back, waist="Flume Belt", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +1"}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Sangoma", sub="Genmei Shield", range="Gjallarhorn",
		head="Inyanga Tiara +1", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Aya. Cosciales +2", feet="Fili Cothurnes +1"}

	sets.idle.Weak = {main="Mafic Cudgel", sub="Genmei Shield", range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Dark Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.idle.PDT = {main="Mafic Cudgel", sub="Genmei Shield", range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque +1",  lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.idle.MDT = {main="Mafic Cudgel", sub="Genmei Shield", range="Gjallarhorn",
		head="Inyanga Tiara +1",neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genmei Shield", range="Gjallarhorn",
		head="Aya. Zucchetto +1", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.defense.MDT = {main="Mafic Cudgel", sub="Genmei Shield", range="Gjallarhorn",
		head="Inyanga Tiara +1", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Naegling", sub="Genmei Shield", ranged=gear.Instrument_TP,
		head="Aya. Zucchetto +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.engaged.Acc = {main="Naegling",sub="Genmei Shield", ranged=gear.Instrument_TP,
		head="Aya. Zucchetto +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.engaged.DW = {main="Naegling", sub="Legato Dagger", ranged=gear.Instrument_TP,
		head="Aya. Zucchetto +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
	sets.engaged.DW.Acc = {main="Naegling",sub="Legato Dagger",ranged=gear.Instrument_TP,
		head="Aya. Zucchetto +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if world.area:contains("Dynamis") then
		set_macro_page(8, 4)
	else
		set_macro_page(1, 4)
	end
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.ExtraSongsMode = M{['description']='Extra Songs','None','Dummy','DummyLock','FullLength','FullLengthLock'}

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
	state.Buff['Nightingale'] = buffactive['Nightingale'] or false
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')

	autows = "Rudra's Storm"
	autofood = 'Pear Crepe'
	
	state.AutoSongMode = M(false, 'Auto Song Mode')

	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoSongMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ExtraSongsMode","CastingMode","TreasureMode",})
end


