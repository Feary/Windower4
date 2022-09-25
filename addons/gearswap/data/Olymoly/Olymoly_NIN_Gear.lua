-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.CastingMode:options('Normal','Proc','Resistant')
	state.IdleMode:options('Normal','Sphere')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Katana','Kikoku','Sword','Dagger','MagicWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}

	gear.wsd_jse_back 		= {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	-- DEX+20, Accuracy/Attack +30, DA+10 TP and Blade: Shun
	gear.da_jse_back		= {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	-- INT+20, MAttkBonus +10, MAcc/MDmg +20, MAcc+10
	gear.Nuke_jse_back 		= {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.fc_jse_back 		=  "Andartia's Mantle"
	
	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c set WeaponskillMode Proc;gs c set CastingMode Proc;gs c update')
	--send_command('bind ^r gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')

	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {ammo="Paeapua",
        head="Dampening Tam",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Cryptic Earring",
        body="Emet Harness +1",hands="Macabre Gaunt. +1",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Moonbeam Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Amm Greaves"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochi. Hakama +1"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochi. Chainmail"}
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        --body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands ring2="Valseur's Ring",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", ring1="Metamor. Ring +1", ring2="Metamorph Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Dashing Subligar",feet="Rawhide Boots"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Yamarang",
		-- neck="Moonbeam Nodowa",
        head="Malignance Chapeau",neck="Sanctity Necklace", ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back="Andartia's Mantle",waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.Flourish1 = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Sanctity Necklace", ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.da_jse_back,waist="Kentarch Belt +1",legs="Hattori Hakama",feet="Malignance Boots"}

    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Sapience Orb",
		head=gear.herculean_fc_head, neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		-- Rahab Ring
		body=gear.taeon_body_Fastcast, hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		-- gear.herculean_fc_legs gear.herculean_fc_feet
		back=gear.fc_jse_back, legs="Gyve Trousers", feet="Mochi. Kyahan +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochi. Chainmail",feet="Hattori Kyahan +1"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum +1",ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {}
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
		-- Nyame Helm Moonshade Earring Odr Earring 
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
        -- Nyame Mail Nyame Gauntlets 
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        -- Nyame Flanchard Nyame Sollerets
		back=gear.wsd_jse_back,waist="Fotia Belt", legs="Mochi. Hakama +3", feet=gear.herculean_wsd_feet}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {ammo="Yetshila +1",
		-- neck="Ninja Nodowa +2", Lugra Earring +1 Odr Earring
		head="Adhemar Bonnet +1", neck="Caro Necklace",  ear1="Lugra Earring", ear2="Ishvara Earring",
		-- Ken. Samue +1 hands="Ryuo Tekko +1 ", Path D ring1="Gere Ring",
		body="Abnoba Kaftan", hands="Mummu Wrists +2", ring1="Rajas Ring", ring2="Regal Ring",
		-- Salifi Belt +1 Mochi. Hakama +3
		back=gear.wsd_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1", -- ammo="Aurgelmir Orb +1",
		-- path B
		head="Adhemar Bonnet +1", neck="Fotia Gorget", ear1="Lugra Earring",ear2="Lugra Earring +1",
		-- body="Agony Jerkin +1", ring1="Gere Ring", 
		body="Ashera Harness", hands="Adhemar Wrist. +1", ring1="Ilabrat Ring", rring="Regal Ring", 
		--legs="Ryou Haidate +1", 
		back=gear.da_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Mochi. Kyahan +3"})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS['Blade: Shun'], {})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS['Blade: Shun'], {})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS['Blade: Shun'], {})
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		-- head="Hachi. Hatsu. +3", neck="Ninja Nodowa +2",
		head="Malignance Chapeau", neck="Caro Necklace", ear1="Moonshade Earring",ear2="Lugra Earring +1",
		-- Nyame Mail lring="Gere Ring"
		body=gear.herculean_wsd_body, hands="Mochi. Tekko +3", lring="Epaminondas's Ring", rring="Regal Ring",
		-- Salifi Belt +1 legs="Mochi. Hakama +3", feet="Mochi. Kyahan +3"
		back=gear.wsd_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"})
    sets.precast.WS['Blade: Ten'].SomeAcc = set_combine(sets.precast.WS['Blade: Ten'], {})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'], {})
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS['Blade: Ten'], {})
    sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	
	sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1", -- ammo="Aurgelmir Orb +1",
		-- head="Hachi. Hatsu. +3", neck="Ninja Nodowa +2",
		head="Malignance Chapeau", neck="Caro Necklace", ear1="Moonshade Earring",ear2="Lugra Earring +1",
		-- Nyame Mail lring="Gere Ring"
		body=gear.herculean_wsd_body, hands="Mochi. Tekko +3", lring="Epaminondas's Ring", rring="Regal Ring",
		-- Salifi Belt +1 legs="Mochi. Hakama +3", feet="Mochi. Kyahan +3"
		back=gear.wsd_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"})
	
	sets.precast.WS['Blade: Teki'] = {ammo="Seeth. Bomblet +1",
		-- Nyame Helm neck="Ninja Nodowa +2", lear="Lugra Earring +1",
		head="Mochi. Hatsuburi +1", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets lring="Gere Ring",
		body="Gyve Doublet", hands="Volte Bracers", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- Nyame flanchard Nyame Sollerets 
		back=gear.wsd_jse_back, waist="Orpheus's Sash", legs="Gyve Trousers", feet="Malignance Boots"}
	
	sets.precast.WS['Blade: To'] =  sets.precast.WS['Blade: Teki']
	
	sets.precast.WS['Blade: Chi'] = sets.precast.WS['Blade: Teki']

	sets.precast.WS['Blade: Ku'] = {ammo="Seething Bomblet +1",
		-- neck="Ninja Nodowa +2", lear="Lugra Earring +1",
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Lugra Earring", rear="Mache Earring +1",
		-- Agony Jerkin +1  Mochi. Tekko +3 lring="Gere Ring",
		body="Adhemar Jacket +1", hands="Tatena. Gote +1", lring="Ilabrat Ring", rring="Regal Ring",
		--  Tatena. Haidate +1 Mochi. Kyahan +3
		back=gear.da_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet=gear.herculean_ta_feet}
	
	sets.precast.WS['Blade: Kamu'] = {ammo="Seething Bomblet +1",
		-- head="Hachi. Hatsu. +3", neck="Ninja Nodowa +2", lear="Lugra Earring +1" , rear="Balder Earring +1"
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Lugra Earring", rear="Cessance Earring",
		-- Tatena. Haramaki +1 lring="Gere Ring",
		body="Adhemar Jacket +1", hands="Tatena. Gote +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Salifi Belt +1 Tatena. Haidate +1 Tatena. Sune. +1
		back=gear.wsd_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}
	
	-- Sword
	sets.precast.WS['Savage Blade'] = {ammo="Seething Bomblet +1",
        -- neck="Rep. Plat. Medal" neck="Baetyl Pendant"
		head="Hachi. Hatsu. +1",neck="Caro Necklace",ear1="Lugra Earring",ear2="Moonshade Earring",
        -- body="Nyame Mail", hands="Nyame Gauntlets", lring="Sroda Ring",
		body="Ashera Harness",hands="Adhemar Wrist. +1",ring1="Regal Ring",ring2="Epaminondas's Ring",
        -- waist="Salifi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"
		back=gear.wsd_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Dagger
	sets.precast.WS['Evisceration'] = {ammo="Yetshila +1",
		-- head="Blistering Sallet +1", neck="Ninja Nodowa +2", lear="Odr Earring",
        head="Mummu Bonnet +2",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        -- Ken. Samue +1 body="Mpaca's Doublet", hands="Ryou Tekko +1", ring2="Gere Ring"
		body="Abnoba Kaftan", hands="Adhemar Wrist. +1",ring1="Regal Ring",ring2="Ilabrat Ring",
        -- legs="Mpaca's Hose", feet="Ken. Sune-Ate +1"
		back=gear.Nuke_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2",feet="Malignance Boots"}
	
    sets.precast.WS['Aeolian Edge'] = {--ammo="Ghastly Tathlum +1",
		-- neck="Sybil Scarf",
        head="Mochi. Hatsuburi +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        -- body="Nyame Mail", hands="Nyame Gauntlets",
		body="Gyve Doublet",hands="Volte Bracers",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
        -- legs="Nyame Flanchard", feet="Nyame Sollerets"
		back=gear.Nuke_jse_back, waist="Orpheus's Sash", legs="Gyve Trousers",feet="Malignance Boots"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

	 sets.midcast.NinjutsuDebuff = {ammo="Yamarang",
		-- lear="Hnoss Earring"
        head="Hachi. Hatsu. +1",neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Digni. Earring",
		-- Malignance Tabard Malignance Gloves 
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Mochi. Kyahan +1"}

    sets.midcast.ElementalNinjutsu = {--ammo="Ghastly Tathlum +1",
		-- neck="Baetyl Pendant", neck="Sybil Scarf",
        head="Mochi. Hatsuburi +1", neck="Sanctity Necklace", ear1="Crematio Earring",ear2="Friomisi Earring",
        -- hands="Nyame Gauntlets"
		body="Gyve Doublet",hands="Hattori Tekko +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- waist="Skrymir Cord +1" legs=gear.herculean_nuke_legs
        back=gear.Nuke_jse_back,waist="Orpheus's Sash",legs="Gyve Trousers",feet="Mochi. Kyahan +1"}
		
	sets.MagicBurst = {--ammo="Ghastly Tathlum +1",
		-- neck="Warden's Charm +1",
        head="Mochi. Hatsuburi +1", neck="Sanctity Necklace", ear1="Crematio Earring",ear2="Friomisi Earring",
        --   body="Nyame Mail", hands="Nyame Gauntlets"
		body="Gyve Doublet",hands="Hattori Tekko +1",ring1="Mujin Band",ring2="Metamor. Ring +1",
		-- waist="Skrymir Cord +1" legs="Nyame Flanchard"
        back=gear.Nuke_jse_back,waist="Orpheus's Sash",legs="Gyve Trousers",feet="Mochi. Kyahan +1"}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {}) -- body="Nyame Mail", legs="Nyame Flanchard"

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {}) --back="Mujin Mantle"

    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {ammo="Sapience Orb",
		head=gear.herculean_fc_head, neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		-- gear.herculean_fc_hands Rahab Ring
        body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Defending Ring",ring2="Kishar Ring",
		-- gear.herculean_fc_legs
		back=gear.fc_jse_back, legs="Rawhide Trousers", feet="Hattori Kyahan +1"})

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Telos Earring", ear2="Enervating Earring",
		-- Malignance Tabard Malignance Gloves 
        body="Mekosu. Harness",hands="Regal Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Sanctity Necklace", ear1="Telos Earring", ear2="Enervating Earring",
        body="Mekosu. Harness",hands="Regal Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        --body="Malignance Tabard",hands="Malignance Gloves",
        body="Ashera Harness", hands="Kurys Gloves" ,ring1="Defending Ring",ring2="Vengeful Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
		--ear2="Sanare Earring",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        --body="Malignance Tabard",hands="Malignance Gloves",
        body="Ashera Harness", hands="Kurys Gloves", ring1="Defending Ring",ring2="Vengeful Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        --body="Malignance Tabard",hands="Malignance Gloves",
        body="Ashera Harness", hands="Kurys Gloves" ,ring1="Defending Ring",ring2="Vengeful Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Sanare Earring",
        -- body="Malignance Tabard",hands="Malignance Gloves",
        body="Ashera Harness", hands="Kurys Gloves" ,ring1="Defending Ring",ring2="Vengeful Ring",
		back="Moonbeam Cape",waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet="Hachi. Kyahan +1"}
	sets.DuskIdle = {feet="Hachi. Kyahan +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    sets.engaged = {ammo="Yamarang",
        head="Hattori Zukin +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Suppanomimi",
        body="Mochi. Chainmail",hands="Adhemar Wrist. +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.SomeAcc = {ammo="Yamarang",
        head="Hattori Zukin +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Suppanomimi",
        body="Mochi. Chainmail",hands="Adhemar Wrist. +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.Acc = {ammo="Yamarang",
       head="Hattori Zukin +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Suppanomimi",
        body="Mochi. Chainmail",hands="Adhemar Wrist. +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.FullAcc = {ammo="Yamarang",
        head="Hattori Zukin +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Suppanomimi",
        body="Mochi. Chainmail",hands="Adhemar Wrist. +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.Fodder = {ammo="Yamarang",
        head="Hattori Zukin +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Suppanomimi",
        body="Mochi. Chainmail",hands="Adhemar Wrist. +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.Crit = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Iskur Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    sets.engaged.DT = {ammo="Yamarang",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--  body="Malignance Tabard",hands="Malignance Gloves",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.SomeAcc.DT = {ammo="Yamarang",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--  body="Malignance Tabard",hands="Malignance Gloves",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Epona's Ring",
		-- 
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Acc.DT = {ammo="Yamarang",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--  body="Malignance Tabard",hands="Malignance Gloves",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.FullAcc.DT = {ammo="Yamarang",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--  body="Malignance Tabard",hands="Malignance Gloves",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT = {ammo="Yamarang",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--  body="Malignance Tabard",hands="Malignance Gloves",
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Defending Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi"}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {hands="Hattori Tekko +1"}
    sets.buff.Yonin = {legs="Hattori Hakama"}
    sets.buff.Innin = {head="Hattori Zukin +1"} 

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}--legs="Ryuo Hakama"

	-- Weapons sets
	sets.weapons.Katana = {main="Ochu", sub="Ochu"}
	sets.weapons.Kikoku = {main="Kikoku", sub="Tauret"} -- Ternion Dagger +1
	sets.weapons.Gokotai = {main="Gotokai", sub=""}  -- Ternion Dagger +1
	sets.weapons.Sword = {main="Naegling",sub="Kaja Sword"}  -- Ternion Dagger +1
	sets.weapons.Dagger = {main="Tauret",sub="Kaja Knife"}  -- Ternion Dagger +1
	sets.weapons.MagicWeapons = {main="Ochu",sub="Ochu"}
	
	-- Proc
	sets.weapons.ProcDagger = {main="Aern Dagger II",sub="Aern Dagger"}
	sets.weapons.ProcSword = {main="Aern Sword II",sub="Aern Sword"}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Aern Spear",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	sets.weapons.ProcKatana = {main="Ochu",sub=empty}
	sets.weapons.ProcClub = {main="Rounsey Wand",sub=empty}
	sets.weapons.ProcStaff = {main="Aern Staff",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 020')
end

function job_setup()

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Migawari = buffactive.Migawari or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
	
	state.Stance = M{['description']='Stance','Innin','Yonin','None'}

	autows = "Blade: Shun"
	autofood = 'Soy Ramen'
	
	utsusemi_ni_cancel_delay = .1
	
	state.ElementalMode = M{['description'] = 'Elemental Mode','Fire','Water','Lightning','Earth','Wind','Ice','Light','Dark',}
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode","ElementalWheel",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
end