function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Karambit','Staff','Spharai','Vere','Godhands','Barehanded','ProcStaff','ProcClub','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Capes 
	gear.tp_jse_back = 			{name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.ws_jse_back = 			{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
	-- STR Acc CRIT
	gear.critws_jse_back =		{name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.FC_jse_back = 			{name="Segomo's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
    gear.charka_jse_back =		{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.chi_jse_back = 		{name="Segomo's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
	gear.counter_jse_back =		{name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
	user_job_lockstyle()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hes. Hose +3"}
	sets.precast.JA['Boost'] = {hands="Anchor. Gloves +3"}
	sets.precast.JA['Boost'].OutOfCombat = {hands="Anchor. Gloves +3"} 
	sets.precast.JA['Dodge'] = {feet="Anch. Gaiters +3"}
	sets.precast.JA['Focus'] = {head="Anch. Crown +3"}
	sets.precast.JA['Footwork'] = {}-- feet="Shukuyu Sune-Ate"
	sets.precast.JA['Counterstance'] = {feet="Hes. Gaiters +3"}
	sets.precast.JA['Formless Strikes'] = {body="Hes. Cyclas +3"}
	sets.precast.JA['Mantra'] = {feet="Hes. Gaiters +3"} 

	sets.precast.JA['Chi Blast'] = {}
	
	-- HP VIT
	sets.precast.JA['Chakra'] = {--ammo="Aurgelmir Orb +1",
		-- Genmei Kabuto rear="Tuisto Eaerring"
		head="Malignance Chapeau", neck="Unmoving Collar +1", lear="Handler's Earring +1", rear="Handler's Earring",
		-- lring="Gelatinous Ring +1",
		body="Anch. Cyclas +3", hands="Hes. Gloves +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		back=gear.chakra_jse_back, waist="Latria Sash", legs="Tatena. Haidate",feet="Tatena. Sune."}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {head="Mummu Bonnet +2", legs="Dashing Subligar"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Acc
	sets.precast.Step = {ammo="Ginsen", 
		-- Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
		-- Malignance Tabard  hands="Malignance Gloves",
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Macc	
	sets.precast.Flourish1 = {ammo="Ginsen",
		-- Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
		-- hands="Malignance Gloves",
		body="Ashera Harness",hands="Mummu Wrists +2", ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt 
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}


	-- Fast cast sets for spells	
	sets.precast.FC = {ammo="Sapience Orb",
		head=gear.herculean_fc_head, neck="Orunmila's Torque", ear1="Enchntr. Earring +1", ear2="Loquac. Earring",
		-- body="Adhemar Jacket +1", rring="Rabab Ring",
		body=gear.taeon_body_Fastcast, hands="Leyline Gloves", ring1="Defending Ring", ring2="Prolix Ring",
		-- gear.herculean_fc_legs gear.herculean_fc_feet
		back=gear.FC_jse_back, waist="Black Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2", hands="Anchor. Gloves +3", ring1="Niqmaddu Ring", ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Hiza. Hizayoroi +2", feet="Mummu Gamash. +2"}
		
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
		-- Mnk Nodowa +2
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- ring2="Gere Ring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonlight Belt Ken. Hakama +1 Mpaca Hose Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Mnk Nodowa +2
		head="Hes. Crown +3", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
		-- Ken. Samue +1  ring2="Gere Ring",
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", ring1="Niqmaddu Ring", ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1 
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Hiza. Hizayoroi +2", feet=gear.herculean_ta_feet})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 Ryou Tekko +1 ring2="Gere Ring", 
		body="Anch. Cyclas +3",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 Ryou Tekko +1 ring2="Gere Ring", 
		body="Anch. Cyclas +3",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Moonbow Belt +1 Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Mnk Nodowa +2 
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Anch. Gaiters +3
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Hes. Crown +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Ken. Samue +1 ring2="Gere Ring",
		body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shell Crusher'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Moonlight Necklace 
		head="Malignance Chapeau",neck="Sanctity Necklace", ear1="Digni. Earring", ear2="Ishvara Earring",
		-- Malignance Tabard hands="Malignance Gloves"
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.ws_jse_back,waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"})

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

	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum",
		-- Sybil Scarf
		head="Pixie Hairpin +1", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Samnuha Coat", hands="Leyline Gloves", ring1="Metamor. Ring +1", ring2="Archon Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.ws_jse_back, waist="Orpheus's Sash", legs="Hiza. Hizayoroi +2", feet="Malignance Boots"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring", ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1", ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head=gear.herculean_fc_head,neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	-- Specific spells	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"}
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Ashera Harness",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.Weak = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Ashera Harness",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Ashera Harness",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- Ken. Samue +1 Ken. Tekko +1
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.HP = {ammo="Staunch Tathlum +1",
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- Ken. Samue +1 Ken. Tekko +1 
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.defense.Counter = {ammo="Staunch Tathlum +1",
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- Ken. Samue +1 Ken. Tekko +1 
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Shadow Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Malignance Chapeau", neck="Warder's Charm +1", ear1="Etiolation Earring", ear2="Odnowa Earring +1",
		-- Ken. Samue +1 Ken. Tekko +1 
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2="Shadow Ring",
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Ginsen",
		-- Mnk Nodowa +2  
		head="Adhemar Bonnet +1", neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		--  Malignance Tabard Gere Ring
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1",
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Hes. Hose +3",feet="Anch. Gaiters +3"}
	sets.engaged.SomeAcc = {ammo="Ginsen",
		-- Moonlight Nodowa  
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1",
		back=gear.TP_jse_back,waist="Windbuffet Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"}
	sets.engaged.Acc = {ammo="Ginsen",
		-- Moonlight Nodowa  
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1",
		back=gear.TP_jse_back,waist="Windbuffet Belt +1", legs="Hes. Hose +3", feet="Anch. Gaiters +3"}
	sets.engaged.FullAcc = {ammo="Ginsen",
		--Moonlight Nodowa   
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", 
		back=gear.TP_jse_back,waist="Windbuffet Belt +1", legs="Hes. Hose +3", feet="Anch. Gaiters +3"}
	sets.engaged.Fodder = {ammo="Ginsen",
		-- Moonlight Nodowa
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1",
		back=gear.TP_jse_back,waist="Windbuffet Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		--  Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Malignance Tabard Malignance Gloves 
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt 
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.SomeAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Malignance Tabard 
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt   
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Acc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Mnk. Nodowa +2
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		--  Malignance Tabard 
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt 
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.FullAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		--  Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Malignance Tabard Malignance Gloves 
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt   
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Fodder.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		--  Mnk. Nodowa +2 
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		--  Malignance Tabard Malignance Gloves 
		body="Ashera Harness",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt
		back=gear.TP_jse_back,waist="Black Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Hundred Fists/Impetus melee set mods	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {}--feet="Shukuyu Sune-Ate"
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Anch. Gaiters +3"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}--legs="Ryuo Hakama"
	
	-- Weapons sets
	sets.weapons.Karambit = {main="Karambit"}
	sets.weapons.Spharai = {main="Spharai"}
	sets.weapons.Vere = {main="Spharai"}
	sets.weapons.Vere = {main="Spharai"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole", sub="Flanged Grip"}
	sets.weapons.Club = {main="Loxotic Mace", sub=empty}
	sets.weapons.ProcStaff = {main="Aern Staff"}
	sets.weapons.ProcClub = {main="Rounsey Wand"}
	sets.weapons.ProcDagger = {main="Aern Dagger"}
	sets.weapons.ProcSword = {main="Aern Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Aern Spear",sub=empty}
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

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 006')
end