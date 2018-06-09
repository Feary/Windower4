-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')

	-- Augmented Capes
	--{name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
	gear.fastcast_jse_back = {name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
	gear.Cure_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.Macc_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Austerity Belt"
	gear.obi_cure_back = gear.Macc_jse_back

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_nuke_back = gear.Macc_jse_back
	
	--[[Global binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
	]]

	-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {}
	sets.weapons.DualWeapons = {}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Incantor Stone",
		head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
		-- lring="Prolix Ring",
		body="Inyanga Jubbah +2", hands="Gendewitha Gages", lring="Vocane Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots"}

    sets.precast.FC.DT = {ammo="Incantor Stone",
		head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
		-- lring="Prolix Ring",
		body="Inyanga Jubbah +2", hands="Gendewitha Gages", lring="Vocane Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {feet="Cure Clogs"})
	
	sets.precast.FC.Cure.DT = {ammo="Incantor Stone",
		head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
		-- lring="Prolix Ring",
		body="Inyanga Jubbah +2", hands="Gendewitha Gages", lring="Vocane Ring", rring="Defending Ring",
		back="Swith Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Cure Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {})--head=empty,body="Twilight Cloak"

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Cleric's Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring1="Vocane Ring",ring2="Asklepian Ring",}
	sets.Cure_Received = {ring1="Vocane Ring",ring2="Asklepian Ring",}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {ammo="Clarus Stone",
		--lear="Magnetic Earring", 
		head="Orvail Corona +1", neck="Reti Pendant", rear="Gifted Earring",
		-- body="Hedera Cotehardie", 
		-- legs="Nares Trews", feet="Umbani Boots"
		waist="Austerity Belt", legs="Lengo Pants"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}--neck="Mizu. Kubikazari",
	
    sets.midcast.FastRecast = sets.precast.FC
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
	sets.midcast.CureSolace = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
	sets.midcast.LightWeatherCure = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		-- Theophany Duckbills
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}
	sets.midcast.LightWeatherCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		-- Theophany Duckbills
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}	
	sets.midcast.LightDayCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		-- Theophany Duckbills
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightDayCure = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		-- Theophany Duckbills
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}	
		
	sets.midcast.Curaga = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		-- lring="Stikini Ring", rring="Stikini Ring",
		body="Heka's Kalasiris", hands="Theophany Mitts", lring="Sirona's Ring", 
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightWeatherCuraga = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		-- lring="Stikini Ring", rring="Stikini Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightDayCuraga = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		-- lring="Stikini Ring", rring="Stikini Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.Cure.DT = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip",priority=1},
		head="Ebers Cap", neck="Colossus's Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		-- lring="Stikini Ring", rring="Stikini Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		
	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		head="Ebers Cap", neck="Colossus's Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		-- rring="Levia. Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.Cursna = {	
		--neck="Debilis Medallion",
		neck="Colossus's Torque",
		-- rring="Haoma's Ring", rring="Haoma's Ring",
		body="Ebers Bliaud", hands="Fanatic Gloves", lring="Sirona's Ring",
		--legs="Theophany Pantaloons",
		back=gear.fastcast_jse_back, feet="Gende. Galoshes"}

	sets.midcast.StatusRemoval = {ammo="Hasty Pinion",
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, 
		head="Ebers Cap",
		--body="Hedera Cotehardie", 
		hands="Orison Mitts +2",
		waist="Witful Belt", legs="Ebers Pantaloons", feet="Gende. Galoshes"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {feet="Cleric Duckbills"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {feet="Cleric Duckbills"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {legs="Clr. Pantaln. +2"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {legs="Clr. Pantaln. +2"})
	
	sets.midcast.BarElement = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--lear="Andoaa Earring",
		head="Ebers Cap", neck="Colossus's Torque",  
		body="Ebers Bliaud", hands="Orison Mitts +2",
		--back="Merciful Cape", 
		waist="Cascade Belt", legs="Ebers Pantaloons", feet="Ebers Duckbills"}
	sets.midcast.BarStatus = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- head="", lear="Andoaa Earring", 
		neck="Colossus's Torque", 
		--body="Anhur Robe", lring="Stikini Ring", rring="Stikini Ring",
		hands="Inyan. Dastanas +2",
		--back="Merciful Cape", 
		waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Ebers Duckbills"}

	sets.midcast.Impact = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
		
	sets.midcast['Elemental Magic'] = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara +1",  lear="Friomisi Earring", rear="hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- waist="Ovate Rope", Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}


	sets.midcast['Elemental Magic'].Resistant = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara +1",  lear="Friomisi Earring", rear="hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- waist="Ovate Rope", Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Divine Magic'] = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara +1",  lear="Friomisi Earring", rear="hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- waist="Ovate Rope", Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}


	sets.midcast['Dark Magic'] = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}


    sets.midcast.Drain = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}


    sets.midcast.Drain.Resistant = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast.Stun.Resistant = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Enfeebling Magic'] = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="Niobid Strap", priority=1},
		-- Chironic Hat neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +1", 
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", 
		-- waist="Ovate Rope", Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main={name="Iridal Staff", priority=2}, sub={name="GNiobid Strap", priority=1},
		head="Orvail Corona +1",neck="Eidolon Pendant",ear1="Antivenom Earring",ear2="Relaxing Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Inyanga Ring",ring2="Defending Ring",
		back="Felicitas Cape",waist="Austerity Belt",legs="Assid. Pants +1",feet="Inyan. Crackows +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- head="Aya. Zucchetto +2",
		head="Inyanga Tiara +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back="Umbra Cape", waist="Austerity Belt", legs="Assid. Pants +1", feet="Inyan. Crackows +1"}

	sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
		head="Aya. Zucchetto +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Vocane Ring", rring="Defending Ring",
		back="Umbra Cape", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
		head="Aya. Zucchetto +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Vocane Ring", rring="Defending Ring",
		back="Umbra Cape", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    -- Defense sets
	sets.defense.PDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
		head="Aya. Zucchetto +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Vocane Ring", rring="Defending Ring",
		back="Umbra Cape", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.defense.MDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
		head="Inyanga Tiara +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shadow Ring", rring="Defending Ring",
		back="Felicitas Cape", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Inyan. Crackows +1"}			

    sets.defense.MEVA = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
		head="Inyanga Tiara +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shadow Ring", rring="Defending Ring",
		back="Felicitas Cape", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Inyan. Crackows +1"}			

		
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}
		
    sets.engaged.Acc = {}
		
    sets.engaged.DW = {}
		
    sets.engaged.DW.Acc = {}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end