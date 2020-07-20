-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.PhysicalDefenseMode:options('PDT')
	state.IdleMode:options('Normal','PDT','Refresh')
	state.Weapons:options('None','Godhands','PetWeapons')

	-- Capes
	gear.TP_jse_back = {name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.WS_jse_back = {name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.Crit_jse_back = {name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.Pet_TP_jse_back = {name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.FC_jse_back = {name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','Pet: Damage taken -5%',}}
    
	-- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=1},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=0},
		},
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=3},
			{Name='Fire Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}

	deactivatehpp = 85
	
    select_default_macro_book()
	
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f8 gs c toggle AutoPuppetMode')
	send_command('bind @f7 gs c toggle AutoRepairMode')
end

-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Haruspex Hat +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.taeon_body_Fastcast,hands="Volte Bracers", ring1="Lebeche Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back ,waist="Goading Belt",legs="Pitre Churidars",feet="Regal Pumps +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe"}
	sets.precast.JA['Ventriloquy'] = {legs="Pitre Churidars"}
	sets.precast.JA['Role Reversal'] = {feet="Pitre Babouches"}
    sets.precast.JA['Repair'] = {ammo="Automat. Oil +3",
		-- Nibiru Sainti
		-- gear.herculean_Repair_head  rear="Guignol Earring",
		lear="Pratik Earring",
		-- gear.herculean_Repair_body gear.herculean_Repair_hands lring="Overbearing Ring",
		-- Desultor Tassets
		feet="Foire Babouches"}
	sets.precast.JA['Maintenance'] = {ammo="Automat. Oil +3"}

    sets.precast.JA.Maneuver = {main="Midnights",--Animator P +1
		neck="Bfn. Collar +1",
		body="Karagoz Farsetto",hands="Foire Dastanas",
		back="Visucius's Mantle"} 

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    sets.precast.Waltz['Healing Waltz'] = {}
       
   sets.precast.WS = {
        head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Foire Tobe +3 Pitre Dastanas +3
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"}
	sets.precast.WS.Acc = {
        head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Foire Tobe +3 Pitre Dastanas +3
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"}
	sets.precast.WS.FullAcc = {
        head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Foire Tobe +3 Pitre Dastanas +3
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"}
	sets.precast.WS.Fodder = {
        head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Foire Tobe +3 Pitre Dastanas +3
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
	sets.precast.WS['Victory Smite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {	
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
	sets.precast.WS['Victory Smite'].Fodder = set_combine(sets.precast.WS.Fodder, {
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
	
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
	sets.precast.WS['Stringing Pummel'].FullAcc = set_combine(sets.precast.WS.FullAcc, {	
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
	sets.precast.WS['Stringing Pummel'].Fodder = set_combine(sets.precast.WS.Fodder, {	
		-- Rao Kabuto +1 B
		head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Abnoba Kaftan Ryuo Tekko +1 A
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- Ryuo Sune-Ate +1 D
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
        head="Hiza. Somen　+2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Foire Tobe +3 Pitre Dastanas +3
        body="Hiza. Haramaki +2",hands="Hizamaru Kote +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-Ate +2"})
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shijin Spiral'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shijin Spiral'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Dragon Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Dragon Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Tornado Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Tornado Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Howling Fist'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Howling Fist'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Backhand Blow'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Backhand Blow'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Spinning Attack'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Spinning Attack'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shoulder Tackle'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shoulder Tackle'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    -- Midcast Sets

    sets.midcast.FastRecast = {}
		
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
     -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {
		neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		 --hands="Regimen Mittens",
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", ring1="Varar Ring +1",ring2="Varar Ring +1",
		waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
    sets.midcast.Pet['Elemental Magic'] = {
		neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		-- hands="Regimen Mittens"
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", ring1="Varar Ring +1",ring2="Varar Ring +1", 
		waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
		
	-- The following sets are predictive and are equipped before we even know the ability will happen, as a workaround due to
	-- the fact that start of ability packets are too late in the case of Pup abilities, WS, and certain spells.
	sets.midcast.Pet.PetEnmityGear = {}
	sets.midcast.Pet.PetWSGear = {
		neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		-- ,hands="Regimen Mittens",
		body="Taeon Tabard",ring1="Varar Ring +1",ring2="Varar Ring +1",
		back="Dispersal Mantle",waist="Incarnation Sash",legs="Tali'ah Sera. +2"}
		
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {})--ring2="C. Palug Ring"
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear, {})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
    
	-- Currently broken, preserved in case of future functionality.
	--sets.midcast.Pet.WeaponSkill = {}

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {
        head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Hiza. Haramaki +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2=gear.DarkRing,
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
		
	sets.idle.Refresh = {
        head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Hiza. Haramaki +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2=gear.DarkRing,
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
		
    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {
        head="Pitre Taj",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
        body="Hiza. Haramaki +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2=gear.DarkRing,
		back="Moonbeam Cape",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
		-- gear.herculean_PUP_head
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
        -- Pitre Tobe +3 gear.herculean_PUP_hands
		body="Pitre Tobe",hands="Tali'ah Gages +2",ring1="Varar Ring +1",ring2="Varar Ring +1",
        -- Klouskap Sash gear.herculean_PUP_legs gear.herculean_PUP_feet
		back=gear.Pet_TP_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {waist="Isa Belt",ear2="Handler's Earring +1"})
	sets.idle.Pet.Engaged.LightTank = set_combine(sets.idle.Pet.Engaged, {waist="Isa Belt",ear2="Handler's Earring +1"})
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic


    -- Defense sets
    sets.defense.PDT = {
		-- Malignance Chapeau
        head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        -- Malignance Tabard Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2=gear.DarkRing,
        -- Maliganance Tights  Maliganance Boots 
		back="Moonbeam Cape",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

    sets.defense.MDT = {
        	-- Malignance Chapeau
        head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        -- Malignance Tabard Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2=gear.DarkRing,
        -- Maliganance Tights  Maliganance Boots 
		back="Moonbeam Cape",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
		
    sets.defense.MEVA = {
      	-- Malignance Chapeau
        head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        -- Malignance Tabard Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Volte Bracers",ring1="Defending Ring",ring2="Purity Ring",
        -- Maliganance Tights  Maliganance Boots 
		back="Moonbeam Cape",waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		-- Ryuo Somen +1 Mache Earring +1 
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.Acc = {
      -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.FullAcc = {
       -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
	sets.engaged.Fodder = {
       -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    
	sets.engaged.DT = {
        -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.Acc.DT = {
        -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.FullAcc.DT = {
      -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.Fodder.DT = {
       -- Ryuo Somen +1 Mache Earring +1 ear2="Telos Earring",
        head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Cessance Earring",ear2="Telos Earring",
		-- gear.herculean_ta_hands Gere Ring
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Epona's Ring",
        -- Moonlight Belt +1 Ryuo Hakama +1 gear.herculean_ta_feet
		back=gear.TP_jse_back,waist="Windbuffet Belt +1",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
		
    sets.engaged.Pet = {
        -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Brutal Earring",
		-- Pitre Tobe +3 He. Mittens +1
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Varar Ring +1",
        -- Moonlight Belt +1 Heyoka Subligar +1 He. Leggings +1
		back=gear.Pet_TP_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.Acc.Pet = {
        -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Brutal Earring",
		-- Pitre Tobe +3 He. Mittens +1
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Varar Ring +1",
        -- Moonlight Belt +1 Heyoka Subligar +1 He. Leggings +1
		back=gear.Pet_TP_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.FullAcc.Pet = {
         -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Brutal Earring",
		-- Pitre Tobe +3 He. Mittens +1
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Varar Ring +1",
        -- Moonlight Belt +1 Heyoka Subligar +1 He. Leggings +1
		back=gear.Pet_TP_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
    sets.engaged.Fodder.Pet = {
          -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Brutal Earring",
		-- Pitre Tobe +3 He. Mittens +1
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Niqmaddu Ring",ring2="Varar Ring +1",
        -- Moonlight Belt +1 Heyoka Subligar +1 He. Leggings +1
		back=gear.Pet_TP_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}
		
	-- Weapons sets
	sets.weapons.PetWeapons = {main="Ohtas",range="Divinator II"}
	sets.weapons.Godhands = {main="Kaja Knuckles",range="Divinator II"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 19)
    else
        set_macro_page(1, 19)
    end
end