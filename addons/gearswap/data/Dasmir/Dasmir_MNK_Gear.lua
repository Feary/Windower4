function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Kaja','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Capes 
	gear.tp_jse_back = 			{name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.ws_jse_back = 			{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	-- STR Acc CRIT
	gear.critws_jse_back =		{name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
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
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
	sets.precast.JA['Footwork'] = {}-- feet="Shukuyu Sune-Ate"
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +1"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +1"} 

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {
		head="Dampening Tam",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",
		legs="Hes. Hose +1",feet="Anch. Gaiters +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.TP_jse_back,waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}


	-- Fast cast sets for spells	
	sets.precast.FC = {mmo="Hasty Pinion +1",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves"ring2="Lebeche Ring",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_ta_feet}
	sets.precast.WSSomeAcc = {ammo="Falcon Eye",head="Dampening Tam",legs="Hiza. Hizayoroi +2"}
	sets.precast.WSAcc = {ammo="Falcon Eye",head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",body="Malignance Tabard",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFullAcc = {ammo="Falcon Eye",head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",body="Malignance Tabard",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {head="Lilitu Headpiece",body=gear.herculean_wsd_body})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {neck="Caro Necklace",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {head="Dampening Tam"})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {head="Adhemar Bonnet +1",neck="Caro Necklace",body="Abnoba Kaftan",ring1="Begrudging Ring",waist="Grunfeld Rope"})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {ear1="Moonshade Earring",body="Abnoba Kaftan",ring1="Begrudging Ring"})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
		body="Samnuha Coat", hands="Leyline Gloves",ring1="Shiva Ring", ring2="Regal Ring",
		-- Eschan Stone
		back=gear.ws_jse_back,waist="Wanion Belt", legs="Hiza. Hizayoroi +2", feet="Mummu Gamash. +2"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring2="Defending Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	-- Specific spells	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.idle.Weak = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.idle.PDT = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		head="Mummu Bonnet +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	-- Defense sets
	sets.defense.PDT = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.HP = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

	sets.defense.MDT = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
		-- Ken. Hakama +1 Ken. Sune-Ate +1
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
		
	sets.defense.MEVA = {ammo="Hasty Pinion +1",-- Staunch Tathlum +1
		-- Ken. Jinpachi +1 Sanare Earring Ebani Earring 
		head="Mummu Bonnet +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Ken. Samue +1 Ken. Tekko +1 ring2="Shadow Ring",
		body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Defending Ring",ring2=gear.DarkRing,
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
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.SomeAcc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.FullAcc = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}
	sets.engaged.Fodder = {ammo="Ginsen",
		-- Adhemar Bonnet +1 Moonlight Nodowa Telos Earring 
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		--  Gere Ring
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		-- waist="Moonlight Belt +1", legs="Hes. Hose +3",feet="Anch. Gaiters +3"
		back=gear.TP_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.SomeAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.Acc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.FullAcc.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
		-- Moonlight Belt  Malignance Tights Malignance Boots 
		back=gear.TP_jse_back,waist="Black Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}
	sets.engaged.Fodder.PDT = {ammo="Ginsen", -- Staunch Tahtlum +1
		-- Malignance Chapeau Mnk. Nodowa +2 Telos Earring
		head="Hiza. Somen +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Ashera Harness Malignance Tabard Malignance Gloves 
		body="Mummu Jacket +2",hands="Mummu Wrist. +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
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
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
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
	sets.weapons.Staff = {main="Malignance Pole",sub="Bloodrain Strap"}
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