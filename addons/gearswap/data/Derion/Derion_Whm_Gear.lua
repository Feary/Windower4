-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')
	
	gear.obi_cure_waist = "Austerity Belt"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_nuke_back = "Toro Cape"

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
	sets.weapons.MeleeWeapons = {main="Nehushtan",sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Nehushtan",sub="Nehushtan"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Incantor Stone",
		head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
		--lring="Prolix Ring",
		body="Inyanga Jubbah", hands="Gendewitha Gages", 
		-- waist="Witful Belt",
		back="Swith Cape", legs="Orvail Pants +1", feet="Regal Pumps"}
    sets.precast.FC.DT = {ammo="Incantor Stone",
		head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
		--lring="Prolix Ring",
		body="Inyanga Jubbah", hands="Gendewitha Gages", 
		-- waist="Witful Belt",
		back="Swith Cape", legs="Orvail Pants +1", feet="Regal Pumps"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main={name="Beneficus", priority=2}, sub={name="Sors Shield", priority=1}, 	
		lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- body="Heka's Kalairis",
		-- back="Pahtli Cape", 
		legs="Ebers Pantaloons", feet="Hygieia Clogs"})

	sets.precast.FC.Cure.DT = {main={name="Beneficus", priority=2}, sub={name="Sors Shield", priority=1}, 	
		head="Haruspex Hat",neck="Twilight Torque",lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Inyanga Jubbah",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Witful Belt",legs="Ebers Pantaloons",feet="Hygieia Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

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
	sets.NightIdle = {back="Cheviot Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {ammo="Clarus Stone",
        back="Aurist's Cape", waist="Austerity Belt"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- Theo Mitts +1
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Alaunus Cape Bishop Sash kaykaus boots
		back="Tempered Cape +1", waist="Salire Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.CureSolace = {main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- Theo Mitts +1
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Alaunus Cape Bishop Sash kaykaus boots
		back="Tempered Cape +1", waist="Salire Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightWeatherCure = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightWeatherCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		
	sets.midcast.LightDayCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightDayCure = {main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.Curaga = {main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Tempered Cape +1", waist="Salire Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightWeatherCuraga = {main={name="Ababinili", priority=2}, sub={name="", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.LightDayCuraga = {main={name="Ababinili", priority=2}, sub={name="", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	sets.midcast.Cure.DT = {main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- Theo Mitts +1
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Alaunus Cape Bishop Sash kaykaus boots
		back="Tempered Cape +1", waist="Salire Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- Theo Mitts +1
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Alaunus Cape Bishop Sash kaykaus boots
		back="Tempered Cape +1", waist="Salire Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		--neck="Debilis Medallion",
		neck="Colossus's Torque",
		--hands="Fanatic Gloves", lring="Ephedra Ring",
		body="Ebers Bliaud", hands="Theophany Mitts", rring="Sirona's Ring", rring="Ephedra Ring",
		--  legs="Theophany Pantaloons",
		back="Alaunus's Cape", feet="Gende. Galoshes"}

	sets.midcast.StatusRemoval = {
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, ammo="Hasty Pinion +1",
		head="Ebers Cap",
		--body="Hedera Cotehardie", 
		hands="Orison Mitts +2",
		waist="Witful Belt", legs="Ebers Pantaloons", feet="Gende. Galoshes"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {--main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		-- lear="Andoaa Earring", 
		neck="Colossus's Torque", 
		-- body="Anhur Robe", 
		hands="Inyanga Dastanas",
		--back="Merciful Cape", waist="Cascade Belt", 
		legs="Cleric's Pantaln.", feet="Orsn. Duckbills +2"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Orsn. Duckbills +2"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Orison Mitts +2",legs="Theo. Pantaloons",})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Cleric's Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Cleric's Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Cleric's Pantaln.",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Cleric's Pantaln.",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.BarElement = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--  lear="Andoaa Earring", 
		head="Ebers Cap", neck="Colossus's Torque",
		body="Ebers Bliaud", hands="Orison Mitts +2", 
		-- back="Merciful Cape", waist="Cascade Belt",
		legs="Ebers Pantaloons", feet="Orsn. Duckbills +2"}

	sets.midcast.BarStatus = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- lear="Andoaa Earring", 
		neck="Colossus's Torque", 
		-- body="Anhur Robe", 
		hands="Inyanga Dastanas",
		--back="Merciful Cape", waist="Cascade Belt", 
		legs="Cleric's Pantaln.", feet="Orsn. Duckbills +2"}

	sets.midcast.BoostStat = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- lear="Andoaa Earring", 
		neck="Colossus's Torque", 
		-- body="Anhur Robe", 
		hands="Inyanga Dastanas",
		--back="Merciful Cape", waist="Cascade Belt", 
		legs="Cleric's Pantaln.", feet="Orsn. Duckbills +2"}

	sets.midcast.Impact = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Elemental Magic'] = {	
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara", lear="Moldavite Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Elemental Magic'].Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara", lear="Moldavite Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Divine Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat neck="Eddy Necklace",
		head="Inyanga Tiara", lear="Moldavite Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Dark Magic'] = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

    sets.midcast.Drain = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

    sets.midcast.Drain.Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast.Stun.Resistant = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Eminent Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 lring="Stikini Ring", rring="Stikini Ring",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception Ring", rring="Mediator's Ring",
		-- Aug.Cape.WHM.Macc Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Alaunus's Cape",ring1="Stikini Ring"})

    -- Sets to return to when not performing an action.
    -- Resting sets
	sets.resting = {main="Boonwell Staff",
		-- head="Aya. Zucchetto +1",
		head="Inyanga Tiara", neck="Eidolon Pendant", lear="Merman's Earring", rear="Merman's Earring",
		-- body="Ayanmo Corazza +1", hands="Aya. Gambieras +1",,
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		-- waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"
		back="Felicitas Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		-- head="Aya. Zucchetto +1",
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- body="Ayanmo Corazza +1", hands="Aya. Gambieras +1",,
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		-- waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"
		back="Cheviot Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		-- head="Aya. Zucchetto +1",
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- body="Ayanmo Corazza +1", hands="Aya. Gambieras +1",
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		-- waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"
		back="Cheviot Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.idle.Weak = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		-- head="Aya. Zucchetto +1",
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- body="Ayanmo Corazza +1", hands="Aya. Gambieras +1",,
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		-- waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"
		back="Cheviot Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

    -- Defense sets
	sets.defense.PDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		-- head="Aya. Zucchetto +1",
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- body="Ayanmo Corazza +1", hands="Aya. Gambieras +1",,
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		-- waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"
		back="Cheviot Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

	sets.defense.MDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		--
		back="Engulfer Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}			

    sets.defense.MEVA = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  
		body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Dark Ring", rring="Defending Ring",
		--
		back="Engulfer Cape", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}	
		
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