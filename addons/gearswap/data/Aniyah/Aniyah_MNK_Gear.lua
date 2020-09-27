function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Kaja','Club','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana') --'Staff',

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Capes 
	gear.TP_jse_back = 			{name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.WS_jse_back = 			{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	gear.crit_jse_back =		{name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.FC_jse_back = 			{name="Segomo's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
    gear.charka_jse_back =		{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	gear.chi_jse_back = 		{name="Segomo's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
	gear.counter_jse_back =		{name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +1"}
	sets.precast.JA['Boost'].OutOfCombat = {hands="Anchorite's Gloves +1"} 
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown"}
	sets.precast.JA['Footwork'] = {}-- feet="Shukuyu Sune-Ate"
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +1"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +1"} 

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {
		-- Genmei Kabuto Unmoving Collar +1 Handler's Earring +1 Tuisto Eaerring
		head="Hiza. Somen　+2", neck="Loricate Torque +1",
		-- Anch. Cyclas +3 Hes. Gloves +3
		body="Anchorite's Cyclas", hands="Hesychast's Gloves +1", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- waist="Latria Sash",
		back=gear.charka_jse_back,  legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"}
		
	sets.precast.Flourish1 = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"}


	-- Fast cast sets for spells	
	sets.precast.FC = {mmo="Hasty Pinion",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		--body="Taeon Tabard",
		hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		-- Hes. Crown +3
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Anchor. Gloves +3", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"}
	sets.precast.WSSomeAcc = {}
	sets.precast.WSAcc = {}
	sets.precast.WSFullAcc = {}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.
	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Adhemar Bonnet +1 Mnk Nodowa +2
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Adhemar Jacket +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +2 Mnk Nodowa +2
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1",gear.herculean_ta_hands ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1 gear.herculean_ta_feet
		back=gear.charka_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +3
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Adhemar Bonnet +1
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Anch. Cyclas +3  Or Ken. Samue +1 Ryou Tekko +1 ring2="Gere Ring", 
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.crit_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Adhemar Bonnet +1
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Anch. Cyclas +3  Or Ken. Samue +1 Ryou Tekko +1 ring2="Gere Ring", 
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.crit_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +3
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +3
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +3 Mnk Nodowa +2 
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Anch. Gaiters +3
		back=gear.charka_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Hes. Crown +3
		head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 hands="Adhemar Wrist. +1", ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shell Crusher'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Malignance Chapeau Moonlight Necklace Digni. Earring ear1="Enchntr. Earring +1", ear2="Gwati Earring",
		head="Mummu Bonnet +2",neck="Sanctity Necklace",
		-- Malignance Tabard Malignance Gloves
		body="Mummu Jacket +2",hands="Adhemar Wristbands",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Malignance Tights Malignance Boots
		back=gear.WS_jse_back,waist="Ovate Rope",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Knobkierrie",
		head="Pixie Hairpin +1", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Samnuha Coat", hands="Leyline Gloves",ring1="Shiva Ring", ring2="Regal Ring",
		-- Eschan Stone waist="Wanion Belt",
		back=gear.WS_jse_back, legs="Hiza. Hizayoroi +2", feet="Mummu Gamash. +2"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {}--ear1="Mache Earring +1",ear2="Telos Earring"
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		--body="Taeon Tabard",
		hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	-- Specific spells	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"}
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.idle.Weak = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.idle.PDT = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	-- Defense sets
	sets.defense.PDT = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.HP = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.defense.MDT = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.MEVA = {ammo="Hasty Pinion",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Vocane Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.SomeAcc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.FullAcc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.Fodder = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.SomeAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.Acc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.FullAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.Fodder.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen　+2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	-- Hundred Fists/Impetus melee set mods	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	sets.buff.Impetus = {body="Bhikku Cyclas"}
	sets.buff.Footwork = {}--feet="Shukuyu Sune-Ate"
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {}--feet="Shukuyu Sune-Ate"
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}--legs="Ryuo Hakama"
	
	-- Weapons sets
	sets.weapons.Kaja = {main="Kaja Knuckles"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {}
	sets.weapons.Club = {main="Mafic Cudgel",sub=empty}
	sets.weapons.ProcStaff = {main="Earth Staff"}
	sets.weapons.ProcClub = {main="Rounsey Wand"}
	sets.weapons.ProcSword = {main="Ibushi Shinai",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 6)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 6)
	elseif player.sub_job == 'THF' then
		set_macro_page(4, 6)
	elseif player.sub_job == 'RUN' then
		set_macro_page(5, 6)
	else
		set_macro_page(1, 6)
	end
end