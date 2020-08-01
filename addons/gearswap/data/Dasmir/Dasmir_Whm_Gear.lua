-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')
	
	-- Augmented Capes
	gear.fastcast_jse_back 	=	{name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back 		= 	{name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Damage taken-5%',}}
	gear.Macc_jse_back 		= 	{name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Damage taken-5%',}}
	gear.TP_jse_back 		= 	{name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.WS_jse_back 		= 	{name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	
	gear.obi_cure_waist = "Bishop's Sash"
	gear.obi_cure_back = gear.Cure_jse_back 

	gear.obi_nuke_waist = "Acuity Belt"
	gear.obi_nuke_back = gear.Macc_jse_back

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
	sets.weapons.MeleeWeapons = {main="Kaja Rod", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = 	{main="Kaja Rod", sub="Kaja Rod"}
	
    -- Precast Sets
    -- Fast cast sets for spells
	-- Current: 74
    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", ammo="Incantor Stone",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Lebeche Ring", rring="Kishar Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Regal Pumps"}
		
    sets.precast.FC.DT = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",	
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Lebeche Ring", rring="Kishar Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Regal Pumps"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		head="Piety Cap +1", legs="Ebers Pant. +1", feet="Theo. Duckbills +1"})

	sets.precast.FC.Cure.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", ammo="Incantor Stone",
		head="Piety Cap +1", neck="Loricate Torque +1",lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.Cure_jse_back,waist="Witful Belt",legs="Ebers Pant. +1", feet="Regal Pumps"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
	sets.precast.JA.Devotion = {head="Piety Cap +1"}
	sets.precast.JA.Martyr = {hands="Piety Mitts"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.precast.WS['Hexa Strike'] = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		-- Begrudging Ring
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.precast.WS['Black Helo'] = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}	
		
    sets.precast.WS['Flash Nova'] = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.precast.WS['Mystic Boon'] = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Regal Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Ilabrat Ring", rring="Rufescent Ring",
		back=gear.Cure_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}	
		

    -- Midcast Sets
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {back=gear.Cure_jse_back}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket"}-- ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket"}-- ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}-- back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"

	-- leave Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {
		-- Reti Pendant
		head="Telchine Cap", lear="Gwati Earring", rear="Calamitous Earring",
		-- hands="Skrieker's Cuffs", 
		body="Witching Robe", hands="Fanatic Gloves",
		--  legs="Vanya Slops",
        back="Aurist's Cape", waist="Austerity Belt", legs="Lengo Pants", feet="Umbani Boots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", ring2="Locus Ring", ring1="Mujin Band"}
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main=gear.gada_healing_club, sub="Sors Shield", 
		-- JP: Cure Pot 50-23 = 27   
		-- Queller Rod Path D
		-- lear="Glorious Earring"
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		-- kaykaus boots
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.CureSolace = {main=gear.gada_healing_club, sub="Sors Shield", 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring",rring="Lebeche Ring",
		-- kaykaus boots
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}
	
	-- Weather/Day
	sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.LightWeatherCureSolace = {main="Iridal Staff", sub="Clerisy Strap +1",
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1",feet="Piety Duckbills +1"}
		
	sets.midcast.LightDayCureSolace = {main=gear.gada_healing_club, sub="Sors Shield",
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.LightDayCure = {main=gear.gada_healing_club, sub="Sors Shield",
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1",feet="Piety Duckbills +1"}

	sets.midcast.Curaga = {main=gear.gada_healing_club, sub="Sors Shield", 
		head="Ebers Cap +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Theo. Briault +3", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", sub="Clerisy Strap +1", 
		head="Ebers Cap +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Theo. Briault +3", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.LightDayCuraga = {main=gear.gada_healing_club, sub="Sors Shield", 
		-- neck="Nuna Gorget +1", lear="Glorious Earring", 
		head="Ebers Cap +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Novia Earring",
		body="Theo. Briault +3", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	sets.midcast.Cure.DT = {main=gear.gada_healing_club, sub="Sors Shield", 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Defending Ring", rring="Lebeche Ring",
		-- kaykaus boots
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Ephedra Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pant. +1", feet="Piety Duckbills +1"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		--neck="Debilis Medallion",
		neck="Colossus's Torque",
		body="Ebers Bliaud +1", hands="Fanatic Gloves", lring="Ephedra Ring", rring="Ephedra Ring",
		-- Haoma Ring
		-- Theo. Pants +3
		back=gear.fastcast_jse_back, legs="Theo. Pant. +1", feet="Gende. Galosh. +1"}

	sets.midcast.StatusRemoval = {main=gear.grioavolr_fc_staff, sub="Clemency Grip", ammo="Hasty Pinion +1",
		head="Ebers Cap +1",
		--body="Hedera Cotehardie", 
		hands="Ebers Mitts +1",
		waist="Witful Belt", legs="Ebers Pant. +1", feet="Gende. Galosh. +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		-- neck="Incantor's Torque",
		head=gear.telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		-- feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- Set bonus
	-- 500 Skill	
	sets.midcast.BarElement = {main="Beneficus", sub="Ammurapi Shield",
		-- neck="Incantor's Torque",
		head="Ebers Cap +1", neck="Colossus's Torque", lear="Andoaa Earring",  rear="Augment. Earring",
		body="Ebers Bliaud +1", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
	sets.midcast.BarElement['Light Arts'] = {main="Beneficus", sub={name="Ammurapi Shield", priority=1},
		-- neck="Incantor's Torque", 
		head="Ebers Cap +1", neck="Colossus's Torque", lear="Andoaa Earring", 
		body="Ebers Bliaud +1", hands="Ebers Mitts +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.BarStatus = {main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",
		head=gear.telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring",  rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1",}
	sets.midcast.BarStatus['Light Arts'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque",
		head=gear.telchine_head_Duration, neck="Colossus's Torque",  lear="Andoaa Earring",  rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		-- feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- 500 Skill
	sets.midcast.BoostStat = {main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque"
		head=gear.telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring",  
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.BoostStat['Light Arts'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		-- neck="Incantor's Torque", 
		head=gear.telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",})--hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
		head="Inyanga Tiara +2",
		body="Piety Briault +1", hands="Ebers Mitts +1",
		legs="Theo. Pant. +1", feet=gear.telchine_feet_Regen})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring"})
	
	sets.midcast.Impact = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Grioavolr 	
		head=empty, neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Twilight Cloak", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",		
		--  Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Elemental Magic'] = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat Digni. Earring 
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Novio Earring", rear="Regal Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Elemental Magic'].Resistant = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat   Digni. Earring 
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Novio Earring", rear="Regal Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Divine Magic'] = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat Digni. Earring
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Novio Earring", rear="Regal Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Dark Magic'] = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",	
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",		 
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

    sets.midcast.Drain.Resistant = {main="Rubicundity", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat  
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- Chironic Hat  
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

	sets.midcast.Stun.Resistant = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- Chironic Hat  
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",	
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Inyan. Crackows +2"}

	sets.midcast['Enfeebling Magic'] = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat  lear="Digni. Earring", 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Gwati Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat Digni. Earring 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Gwati Earring", rear="Regal Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.Macc_jse_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Macc_jse_back,ring1="Stikini Ring"})

    -- Sets to return to when not performing an action.
    -- Resting sets
	sets.resting = {main=gear.grioavolr_refresh_staff, sub="Irenic Strap +1",
		head="Befouled Crown", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Bolelabunga", sub="Genbu's Shield",		
		head="Befouled Crown", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Theo. Briault +3", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
	
	sets.idle.MDT = {main=gear.grioavolr_refresh_staff, sub="Irenic Strap +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
	sets.idle.MEVA = {main=gear.grioavolr_refresh_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}	
		
	sets.idle.Weak = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    -- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genbu's Shield",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main=gear.grioavolr_refresh_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Austerity Belt", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}			

    sets.defense.MEVA = {main=gear.grioavolr_refresh_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}	
		
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.Acc = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW.Acc = {
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.fastcast_jse_back, waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1", back="Mending Cape"}
	
	sets.buff['Light Arts'] = {} 
	
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
		--{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
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