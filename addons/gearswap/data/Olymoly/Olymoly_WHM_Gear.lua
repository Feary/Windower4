-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')
	
	-- Augmented Capes
	gear.fastcast_jse_back = {name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.Cure_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.Macc_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Austerity Belt"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Luminary Sash"
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
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Sors Shield"}
	sets.weapons.DualWeapons = {main="Maxentius",sub="Kaja Rod"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="Oranyan", sub="Clerisy Strap +1", ammo="Incantor Stone",
		--main=gear.grioavolr_fc_staff, ammo="Impatiens",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Regal Pumps +1"}

    sets.precast.FC.DT = set_combine(sets.precast.FC, {main="Oranyan", sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- ammo="Impatiens",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Prolix Ring", rring="Kishar Ring",
		-- Kaykaus Tights
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Regal Pumps +1"})
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

	-- Healing
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		head="Piety Cap +1", legs="Ebers Pant. +1", feet="Theo. Duckbills +1"})

	sets.precast.FC.Cure.DT =  set_combine(sets.precast.FC.Cure, {
		main="Oranyan", sub="Clerisy Strap +1",
		head="Piety Cap +1", neck="Loricate Torque +1",lear="Nourish. Earring +1", rear="Novia Earring",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.Cure_jse_back, waist="Witful Belt", legs="Ebers Pant. +1", feet="Cure Clogs"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Cessance Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.precast.WS.Dagan = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Brutal Earring", rear="Cessance Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}
	
    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}-- neck="Phalaina Locket",
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring"} -- neck="Phalaina Locket",
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {ammo="Incantor Stone",
		main="Rubicundity", sub="Thuellaic Ecu +1",
		head="Vanya Hood", neck="Reti Pendant", neck="Incanter's Torque", ear1="Gifted Earring", ear2="Mendi. Earring",
		body="Vedic Coat", hands="Fanatic Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back="Fi Follet Cape +1", waist="Austerity Belt",legs="Lengo Pants",feet="Kaykaus Boots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.fastcast_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
		
	sets.midcast['Esuna'] =  sets.precast.FC['Healing Magic']
	
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		-- Queller Rod D
		main="Tamaxchi", sub="Sors Shield", ammo="Esper Stone +1",
		-- Kaykaus Mitra B   
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		-- 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.CureSolace = {
		-- Queller Rod D
		main="Tamaxchi", sub="Sors Shield", ammo="Esper Stone +1",
		-- Kaykaus Mitra B 
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCure = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Kaykaus Mitra B 
		head="Vanya Hood", neck="Incanter's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCureSolace = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Kaykaus Mitra B 
		head="Vanya Hood", neck="Incanter's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.LightDayCureSolace = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Kaykaus Mitra B 
		head="Vanya Hood", neck="Incanter's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		--  Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.LightDayCure = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Kaykaus Mitra B
		head="Vanya Hood", neck="Incanter's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		--  Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.Curaga = {	
		-- Queller Rod D
		main="Tamaxchi", sub="Sors Shield", ammo="Esper Stone +1",		
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Bliault +3 Theophany Mitts +3
		body="Theo. Briault +2", hands=gear.telchine_Hands_Cure, lring="Stikini Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCuraga = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Nuna Gorget +1 
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Briault +3 Kaykaus Cuffs A
		body="Theo. Briault +2", hands=gear.telchine_Hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi",  legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}
		
	sets.midcast.LightDayCuraga = {
		main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Esper Stone +1",
		-- Nuna Gorget +1 
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Briault +3 Kaykaus Cuffs A
		body="Theo. Briault +2", hands=gear.telchine_Hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi",  legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}
		
	sets.midcast.Cure.DT = {
		-- Queller Rod D
		main="Tamaxchi", sub="Sors Shield", ammo="Esper Stone +1",
		-- Kaykaus Mitra B 
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		-- Queller Rod D
		main="Tamaxchi", sub="Sors Shield", ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque  
		head="Vanya Hood", neck="Incanter's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theophany Mitts +3 
		body="Ebers Bliaud +1", hands="Theophany Mitts +2", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons +1", feet="Kaykaus Boots"}

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
		-- main={name="Gada", priority=2}, sub={name="Sors Shield", priority=1},
		--  Healing skill neck="Debilis Medallion", rear="Healing Earring",
		head="Vanya Hood", neck="Incanter's Torque", lear="Beatific Earring", 
		-- lring="Haoma's Ring", rring="Haoma's Ring",
		body="Ebers Bliaud +1", hands="Fanatic Gloves", lring="Ephedra's Ring", rring="Ephedra's Ring",
		-- Theo. Pant. +3
		back=gear.fastcast_jse_back, waist="Bishop's Sash", legs="Theo. Pant. +1", feet="Gende. Galosh. +1"}

	sets.midcast.StatusRemoval = {main="Oranyan", sub="Clerisy Strap +1", 
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, 
		ammo="Hasty Pinion +1",
		head="Ebers Cap +1",
		hands="Ebers Mitts +1",
		waist="Witful Belt", legs="Ebers Pantaloons +1", feet="Gende. Galosh. +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {
		--main={name="Gada", priority=2}, sub={name="Ammurapi Shield", priority=1},
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration,
		-- Theo. Duckbills +3
		legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
		head="Inyanga Tiara +2", 
		hands="Ebers Mitts +1", 
		legs="Theo. Pant. +1",})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1"})
	
	-- 438 Cap
	sets.midcast.BarElement = {
		--main={name="Beneficus",priority=2}, sub={name="Ammurapi Shield",priority=1},
		head="Ebers Cap +1", neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Ebers Bliaud +1", hands="Ebers Mitts +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Mending Cape", waist="Olympus Sash", legs="Ebers Pantaloons +1", feet="Ebers Duckbills +1"}

	-- Caps 500 /sch  need 106 blm/rdm
	sets.midcast.BarStatus = {
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  feet="Theophany Duckbills +3"
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
	
	--sets.midcast.BarStatus['Light Arts'] = {main={name="Beneficus", priority=2}, sub={name="Genmei Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		--head=gear.telchine_head_Duration, neck="Incanter's Torque",  lear="Andoaa Earring", 
		--body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		-- feet="Theophany Duckbills +3"
		--back="Mending Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- Caps 500 to Cap - need 106 blm/rdm
	-- Duration
	sets.midcast.BoostStat = {
		-- main={name="Gada", priority=2},
		head="Befouled Crown", neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Anhur Robe", hands="Inyanga Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Theo. Duckbills +3
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
			
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}
		
	sets.midcast['Elemental Magic'] = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	sets.midcast['Elemental Magic'].Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	sets.midcast['Divine Magic'] = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	sets.midcast['Dark Magic'] = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

    sets.midcast.Drain = {main="Rubicundity", sub="Sors Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Appetence Crown", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

    sets.midcast.Drain.Resistant = {main="Rubicundity", sub="Sors Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat
		head="Appetence Crown", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	sets.midcast.Stun.Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat  
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	sets.midcast['Enfeebling Magic'] = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Theo. Briault +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Inyanga Crackows +2"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Theo. Briault +3
		body="Theo. Briault +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Inyanga Crackows +2"}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.Macc_jse_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Macc_jse_back})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff", sub="Enki Strap", ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Bolelabunga",sub="Genmei Shield", ammo="Homiliary",
		head="Befouled Crown", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Theo. Briault +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Malignance Pole", sub="Irenic Strap +1", ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Genmei Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Chironic Slippers DT
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.idle.Weak = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Chironic Slippers DT
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Aya. Gambieras +2"}

    -- Defense sets
	sets.defense.PDT = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Genmei Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Chironic Slippers DT
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    sets.defense.MEVA = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	sets.engaged = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.fastcast_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1", back="Mending Cape"}
	
	--sets.buff['Light Arts'] = {} 
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 1)
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='Always'},
	},
	
	Default = {
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
	Melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Ramuh = {
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
	Shiva = {
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
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
}