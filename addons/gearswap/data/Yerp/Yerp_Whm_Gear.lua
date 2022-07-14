-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None','Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')

	-- Augmented Capes
	--{name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
	gear.fastcast_jse_back = {name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back =	 {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.Macc_jse_back =	 {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}

	
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
	-- Nehetsan Clubs?
	sets.weapons.MeleeWeapons = {main="Maxentius", sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Maxentius", sub="Kaja Rod"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { ammo="Incantor Stone",
		-- main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque", rear="Malignance Earring", 
		head="Haruspex Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- hands="Gende. Gages +1", lring="Kishar Ring",
		body="Inyanga Jubbah +2", hands="Aya. Manopolas +1", lring="Prolix Ring", rring="Defending Ring",
		-- back=gear.fastcast_jse_back, feet="Regal Pumps +1" 
		back="Swith Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    sets.precast.FC.DT = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque",  rear="Malignance Earring", 
		head="Haruspex Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- hands="Gende. Gagenns +1", lring="Kishar Ring",
		body="Inyanga Jubbah +2", hands="Aya. Manopolas +1", lring="Prolix Ring", rring="Defending Ring",
		-- back=gear.fastcast_jse_back, feet="Regal Pumps +1" 
		back="Swith Cape", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})-- waist="Siegel Sash"
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {main="Vadose Rod", legs="Ebers Pantaloons"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		-- lear="Nourish. Earring", rear="Nourish. Earring +1",
		-- feet="Cure Clogs"
		head="Piety Cap",
		legs="Ebers Pantaloons",})
	
	sets.precast.FC.Cure.DT = set_combine(sets.precast.FC.Cure, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut"}
	sets.precast.JA.Devotion = {head="Piety Cap"}
	sets.precast.JA.Martyr = {hands="Piety Mitts"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Midcast Sets

    sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}--ring1="Vocane Ring",ring2="Asklepian Ring"
	sets.Cure_Received = {}--ring1="Vocane Ring",ring2="Asklepian Ring",
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {ammo="Clarus Stone",
		waist="Austerity Belt", legs="Lengo Pants"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}--neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"
	
    sets.midcast.FastRecast = sets.precast.FC
		
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Vadose Rod", sub="Sors Shield", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back, waist="Shinjutsu-no-obi +1"
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Piety Duckbills"}
	sets.midcast.CureSolace =  {main="Vadose Rod", sub="Sors Shield", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back,
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}
		
	sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}
		
	sets.midcast.LightWeatherCureSolace = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}
	
	sets.midcast.LightDayCure =  {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}	
	
	sets.midcast.LightDayCureSolace = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}
		
	sets.midcast.Curaga =  {main="Vadose Rod", sub="Sors Shield", ammo="Psilomene",
		--head="Kaykaus Mitra +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring",  lear="Novia Earring",rear="Orison Earring",
		-- body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1",
		body="Annoint. Kalaris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back, 
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Kaykaus Mitra +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring",  lear="Novia Earring",rear="Orison Earring",
		-- body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1",
		body="Annoint. Kalaris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back, 
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}

	sets.midcast.LightDayCuraga = {main="Vadose Rod", sub="Sors Shield", ammo="Psilomene",
		--head="Kaykaus Mitra +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring",  lear="Novia Earring",rear="Orison Earring",
		-- body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1",
		body="Annoint. Kalaris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back, 
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}

	sets.midcast.Cure.DT = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		--head="Kaykaus Mitra +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		head="Ebers Cap", lear="Beatific Earring",  lear="Novia Earring",rear="Orison Earring",
		-- body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1",
		body="Annoint. Kalaris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		--back=gear.Cure_jse_back, 
		back="Tempered Cape +1", waist="Austerity Belt", legs="Ebers Pantaloons", feet="Skaoi Boots"}
		
	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = set_combine(sets.midcast.Cure,{})
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.CureSolace, {})
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

	sets.midcast.Cursna = {}

	-- -Na
	sets.midcast.StatusRemoval = {
		head="Ebers Cap"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- , neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- feet="Theophany Duckbills +3" 
		back="Mending Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.BarElement = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		--  neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3"
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
	
	sets.midcast.BarElement['Light Arts'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3" 
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
		
	sets.midcast.BarStatus = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3" 
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.BarStatus['Light Arts'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3" 
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- 500 Skill
	sets.midcast.BoostStat = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3" 
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.BoostStat['Light Arts'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
	-- main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",  lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Mending Cape", feet="Theophany Duckbills +3" 
		waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield"})--sub="Ammurapi Shield" hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		--main="Bolelabunga", sub="Ammurapi Shield",
		head="Inyanga Tiara +1",
		body="Piety Briault", hands="Ebers Mitts",
		legs="Theo. Pantaloons", feet=gear.telchine_feet_Regen})
		
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaloons"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaloons"})

	sets.midcast.Impact = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
		
	sets.midcast['Elemental Magic'] = {--- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Elemental Magic'].Resistant = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Divine Magic'] = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", lear="Beatific Earring", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Dark Magic'] = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    sets.midcast.Drain = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    sets.midcast.Drain.Resistant = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast.Stun.Resistant = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Enfeebling Magic'] = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {-- Grioavolr Pemphredo Tathlum
		--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +1", rear="Enchntr. Earring +1",
		--body="Theo. Briault +3", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back=gear.Macc_jse_back, Luminary Sash waist="Ovate Rope", Chironic Hose Theo. Duckbills +3
		back="Felicitas Cape +1", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
	
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
	sets.resting = {main="Boonwell Staff",
		head="Inyanga Tiara +1",neck="Eidolon Pendant",
		body="Shamash Robe",hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		--back=gear.fastcast_jse_back,
		back="Felicitas Cape +1", waist="Austerity Belt",legs="Inyanga Shalwar +1",feet="Inyan. Crackows +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Mafic Cudgel", 
		-- sub="Genmei Shield", ammo="Homillary",
		-- neck="Loricate Torque +1", rear="Etiolation Earring",
		head="Befouled Crown",  lear="Ethereal Earring",
		body="Shamash Robe", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		--back=gear.fastcast_jse_back, legs="Assid. Pants +1",
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Inyan. Crackows +1"}

	sets.idle.PDT = {main="Mafic Cudgel", 
		-- sub="Genmei Shield", ammo="Homillary",
		-- neck="Loricate Torque +1", rear="Etiolation Earring",
		head="Aya. Zucchetto +1",  lear="Ethereal Earring",
		--body="Theo. Briault +3", 
		body="Shamash Robe", hands="Aya. Manopolas +1", lring="Inyanga Ring", rring="Defending Ring",
		--back=gear.fastcast_jse_back, legs="Assid. Pants +1",
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
	sets.idle.MEVA = {main="Mafic Cudgel", 
		-- main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		-- neck="Loricate Torque +1",rear="Etiolation Earring",
		head="Inyanga Tiara +1", lear="Ethereal Earring", 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		--back=gear.fastcast_jse_back, 
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    --sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = {main="Mafic Cudgel", 
		-- sub="Genmei Shield", ammo="Homillary",
		-- neck="Loricate Torque +1", rear="Etiolation Earring",
		head="Aya. Zucchetto +1", lear="Ethereal Earring", 
		--body="Theo. Briault +3", 
		body="Shamash Robe", hands="Aya. Manopolas +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		--back=gear.fastcast_jse_back, legs="Assid. Pants +1",
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    -- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", 
		-- sub="Genmei Shield", ammo="Homillary",
		-- neck="Loricate Torque +1",  rear="Etiolation Earring",
		head="Aya. Zucchetto +1", lear="Ethereal Earring",
		--body="Theo. Briault +3", 
		body="Shamash Robe", hands="Aya. Manopolas +1", lring="Inyanga Ring", rring="Defending Ring",
		--back=gear.fastcast_jse_back, legs="Assid. Pants +1",
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.defense.MDT ={main="Mafic Cudgel", 
		-- main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		-- neck="Loricate Torque +1", rear="Etiolation Earring",
		head="Inyanga Tiara +1",  lear="Ethereal Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		--back=gear.fastcast_jse_back, 
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}

    sets.defense.MEVA = {main="Mafic Cudgel", 
		-- main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		-- neck="Loricate Torque +1",  rear="Etiolation Earring",
		head="Inyanga Tiara +1", lear="Ethereal Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		--back=gear.fastcast_jse_back, 
		back="Felicitas Cape +1", waist="Austerity Belt", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
		
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {	
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.Acc = {	
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.DW = {
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.DW.Acc = {
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	-- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {	
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.precast.WS['Hexa Strike'] = {	
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	 
    sets.precast.WS['Flash Nova'] = {
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    sets.precast.WS['Mystic Boon'] = {
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", 
		legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts"}-- ,back="Mending Cape"
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'SCH' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end	
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end

function user_job_self_command(commandArgs, eventArgs)
	
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='Always'},
	},
	
	default = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		--{Name='Barthundra',	Buff='Barthunder',	SpellID=70,		Reapply=false},
		--{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	ramuh = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	shiva = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		{Name='Barblizzara',	Buff='Barblizzard',	SpellID=67,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
}