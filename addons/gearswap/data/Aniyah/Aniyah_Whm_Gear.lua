-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','MEVA')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')

	-- Augmented Capes
	--{name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
	gear.fastcast_jse_back = {name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.Macc_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	
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
	
	send_command('alias fol ffo me')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	-- Nehetsan Clubs?
	sets.weapons.MeleeWeapons = {main="Maxentius", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Maxentius", sub="Kaja Rod"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- rear="Enchntr. Earring +1",
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Kishar Ring", rring="Lebeche Ring",
		-- feet="Regal Pumps +1" 
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", }

    sets.precast.FC.DT = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- rear="Enchntr. Earring +1",
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Kishar Ring", rring="Lebeche Ring",
		-- feet="Regal Pumps +1" 
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2",}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		head="Piety Cap +1", lear="Nourish. Earring", rear="Nourish. Earring +1",
		feet="Cure Clogs"})
	
	sets.precast.FC.Cure.DT = {ammo="Incantor Stone",
		-- rear="Enchntr. Earring +1",
		head="Piety Cap +1", neck="Voltsurge Torque", lear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Kishar Ring", rring="Lebeche Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Cure Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
	sets.precast.JA.Devotion = {head="Piety Cap +1"}
	sets.precast.JA.Martyr = {hands="Piety Mitts +1"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring1="Vocane Ring",ring2="Asklepian Ring",}
	sets.Cure_Received = {ring1="Vocane Ring",ring2="Asklepian Ring",}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {ammo="Clarus Stone",
		head="Telchine Cap", neck="Reti Pendant", rear="Gifted Earring",
		-- body="Hedera Cotehardie", 
		body="Witching Robe",
		waist="Austerity Belt", legs="Lengo Pants", feet="Umbani Boots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}--neck="Mizu. Kubikazari",
	
    sets.midcast.FastRecast = sets.precast.FC
		
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod", sub="Sors Shield",
		head="Gende. Caubeen +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",	
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}
	sets.midcast.CureSolace =  {main="Queller Rod", sub="Sors Shield", 
		head="Ebers Cap +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}
		
	sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Ebers Cap +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}
	sets.midcast.LightWeatherCureSolace = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Ebers Cap +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}	
	sets.midcast.LightDayCureSolace = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Ebers Cap +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring",rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}

	sets.midcast.LightDayCure =  {main="Queller Rod", sub="Sors Shield", 
		head="Ebers Cap +1", neck="Melic Torque", lear="Novia Earring", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}	
		
	sets.midcast.Curaga =  {main="Queller Rod", sub="Sors Shield", 
		head="Ebers Cap +1", neck="Melic Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		body="Heka's Kalasiris", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Ebers Cap +1", neck="Melic Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring",  rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}

	sets.midcast.LightDayCuraga = {main="Queller Rod", sub="Sors Shield", 
		head="Ebers Cap +1", neck="Melic Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}

	sets.midcast.Cure.DT = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Ebers Cap +1",  neck="Loricate Torque +1", ear1="Novia Earring",ear2="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Vocane Ring", rring="Defending Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}
		
	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		head="Ebers Cap +1", neck="Melic Torque", ear1="Novia Earring",ear2="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Ebers Pantaloons +1", feet="Piety Duckbills +1"}
		
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
		neck="Melic Torque",
		--head="Vanya Hood", neck="Debilis Medallion",
		-- rring="Haoma's Ring", rring="Haoma's Ring",
		body="Ebers Bliaud +1", hands="Fanatic Gloves", lring="Sirona's Ring",
		--waist="Bishop's Sash", 
		back=gear.fastcast_jse_back, legs="Theo. Pant. +1", feet="Gende. Galosh. +1"}

	-- -Na
	sets.midcast.StatusRemoval = {ammo="Hasty Pinion",
		--main=gear.grioavolr_fc_staff, sub="Clemency Grip", 
		head="Ebers Cap +1",
		-- body="Hedera Cotehardie", 
		body="Witching Robe", hands="Ebers Mitts +1",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Ebers Pantaloons +1", feet="Gende. Galosh. +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {main="Beneficus", sub="Ammurapi Shield", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club,
		-- neck="Incantor's Torque", 
		head=gear.telchine_head_Duration, neck="Melic Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		-- feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Cascade Belt", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.BarElement = {main="Beneficus", sub="Ammurapi Shield",
		-- neck="Incantor's Torque", 
		head="Ebers Cap +1", neck="Melic Torque",  lear="Andoaa Earring", 
		body="Ebers Bliaud +1", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--back="Merciful Cape", 
		back=gear.fastcast_jse_back, waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
	sets.midcast.BarElement['Light Arts'] = {main="Beneficus", sub="Ammurapi Shield",
		-- neck="Incantor's Torque", 
		head="Ebers Cap +1", neck="Melic Torque", lear="Andoaa Earring", 
		body="Ebers Bliaud +1", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.fastcast_jse_back, waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
		
	sets.midcast.BarStatus = {main="Beneficus", sub="Ammurapi Shield",
		--main=gear.gada_enhancing_club,
		-- neck="Incantor's Torque",
		head=gear.telchine_head_Duration, neck="Melic Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.BarStatus['Light Arts'] = {main="Beneficus", sub="Ammurapi Shield",
		--main=gear.gada_enhancing_club,
		-- neck="Incantor's Torque", 
		head=gear.telchine_head_Duration, neck="Melic Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		-- feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Cascade Belt", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- 500 Skill
	sets.midcast.BoostStat = {main="Beneficus", sub="Ammurapi Shield",
		--main=gear.gada_enhancing_club,
		-- neck="Incantor's Torque", 
		head=gear.telchine_head_Duration, neck="Melic Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.BoostStat['Light Arts'] = {main="Beneficus", sub="Ammurapi Shield",
		--main=gear.gada_enhancing_club,
		-- neck="Incantor's Torque", 
		head=gear.telchine_head_Duration, neck="Melic Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield"})--hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Bolelabunga", sub="Ammurapi Shield",
		head="Inyanga Tiara +2",
		body="Piety Briault +1", hands="Ebers Mitts +1",
		-- feet=gear.telchine_feet_Regen
		legs="Theo. Pant. +1",})
		
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +1"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +1"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +1"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +1"})

	sets.midcast.Impact = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	sets.midcast['Elemental Magic'] = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat neck="Sanctity Necklace",
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Friomisi Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		--  Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Elemental Magic'].Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Regal Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		--  Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Divine Magic'] = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Sanctity Necklace",  lear="Friomisi Earring", rear="Regal Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		--  Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Dark Magic'] = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.midcast.Drain = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.midcast.Drain.Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {-- Grioavolr  Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat Dign. Earring or  rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Voltsurge Torque",  lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

	sets.midcast.Stun.Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

	sets.midcast['Enfeebling Magic'] = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat Theo. Cap +2 lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", neck="Voltsurge Torque",   rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Enfeebling Magic'].Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat  rear="Enchntr. Earring +1", lear="Gwati Earring",
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Lifestorm Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
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
	sets.resting = {main="Boonwell Staff", sub="Mensch Strap",
		head="Inyanga Tiara +2",neck="Eidolon Pendant",ear1="Antivenom Earring",ear2="Relaxing Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Austerity Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Queller Rod", sub="Genbu's Shield",
		-- ammo="Homillary",
		head="Befouled Crown",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
	sets.idle.MEVA = {main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    -- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT ={main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shadow Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}			

    sets.defense.MEVA = {main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2",  neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {	
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.Acc = {	
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2",lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW.Acc = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2",lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {	
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.precast.WS['Hexa Strike'] = {	
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	 
    sets.precast.WS['Flash Nova'] = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.precast.WS['Mystic Boon'] = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Windbuffet Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
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