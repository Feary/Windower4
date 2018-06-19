-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Default','MagicWeapons','Throwing')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')
	
	gear.stp_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	--name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.crit_jse_back = {name="Toutalis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
    send_command('bind !- gs c cycle targetmode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace gs c weapons Throwing;gs c update')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plunderer's Armlets +1",feet="Skulk. Poulaines"})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Jute Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Cessance Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	-- {body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}
	sets.Ambush = {} --body="Plunderer's Vest +1"

	-- Weapons Sets
	sets.weapons.Default = {main="Mandau",sub="Taming Sari"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Throwing = {range="Raider's Bmrng."}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Ginsen",
		-- Skulker's Bonnet +1 Erudit. Necklace  Telos Earring Sherida Earring
		head="Mummu Bonnet +1", neck="Erudit. Necklace", lear="Steelflash Earring", rear="Cessance Earring",
		-- Pillager Vest +3 Adhemar Wristbands +1 Regal Ring 
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		-- Windbuffet Belt +1 Pillager Culottes +3 Herculean Boots 
		back=gear.stp_jse_back, waist="Grunfeld Rope", legs="Meg. Chausses +1", feet="Mummu Gamash. +1"}

    sets.precast.JA['Violent Flourish'] = {ammo="Falcon Eye",
        -- Skulker's Bonnet +1 Erudit. Necklace  Telos Earring Sherida Earring
		head="Mummu Bonnet +1", neck="Erudit. Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Pillager Vest +3 Adhemar Wristbands +1 Regal Ring 
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Windbuffet Belt +1 Pillager Culottes +3 Herculean Boots 
		back=gear.stp_jse_back, waist="Grunfeld Rope", legs="Meg. Chausses +1", feet="Mummu Gamash. +1"}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"} 
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {hands="Pillager's Armlets"}
	sets.precast.JA['Mug'] = {}--head="Plun. Bonnet"
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines"}--legs="Skulker's Culottes"
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {legs="Plun. Culottes"}
	sets.precast.JA['Assassin\'s Charge'] = {feet="Plunderer's Poulaines"}
	sets.precast.JA['Bully'] = {}
	
    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Raider's Bmrng.",
        head="Mummu Bonnet +1",neck="Unmoving Collar +1",ear1="",ear2="Enchntr. Earring +1",
        body="Mummu Jacket +1",hands="Meg. Gloves +2",ring1="Asklepian Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Meg. Jam. +2"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +1",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head="Haruspex Hat +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
		body="Taeon Tabard",hands="Leyline Gloves", ring2="Prolix Ring",
		legs="Rawhide Trousers"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

    -- Ranged snapshot gear
    sets.precast.RA = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	-- body="Meg. Cuirie +2",
    sets.precast.WS = {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2",})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- body=gear.herculean_wsd_body
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- body=gear.herculean_wsd_body
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- body=gear.herculean_wsd_body
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- body=gear.herculean_wsd_body
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	
    sets.precast.WS["Mercy Stroke"] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- body="Lustra. Harness +1", ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Mantoptera Eye",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- body="Lustra. Harness +1", ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Mantoptera Eye",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- body="Lustra. Harness +1", ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS["Mercy Stroke"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Mantoptera Eye",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- body="Lustra. Harness +1", ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].Fodder = set_combine(sets.precast.WS["Mercy Stroke"], {ammo="Yetshila",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- body="Lustra. Harness +1", ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].SA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Yetshila",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].TA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Yetshila",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].SATA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Yetshila",
		--Lustr. Cap +1 Pill.Bonnet +3 Caro Necklace Sherida Earring Seething Bomblet +1
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- ring1="Shukuryu Ring"
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})

	sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear1="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
		--head="Lilitu Headpiece", neck="Caro Necklace",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Mantoptera Eye",
		--head="Lilitu Headpiece", neck="Caro Necklace", 
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="Mantoptera Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
		-- Sherida Earring
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		-- Abnoba Kaftan Begruding Ring
        body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Ramuh Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})

    sets.precast.WS['Last Stand'] = {
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Mummu Jacket +1",hands="Mummu Wrists +2",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Mummu Kecks +1",feet="Mummu Gamash. +1"}

    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Haruspex Hat +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Taeon Tabard",hands="Leyline Gloves",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Tempus Fugit",legs="Mummu Kecks +1",feet="Mummu Gamash. +1"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Mummu Bonnet +1",neck="Erudit. Necklace",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Mummu Jacket +1",hands="Mummu Wrists +2",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +1",feet="Mummu Gamash. +1"}

    sets.midcast.RA.Acc = {
        head="Mummu Bonnet +1",neck="Erudit. Necklace",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Mummu Jacket +1",hands="Mummu Wrists +2",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +1",feet="Mummu Gamash. +1"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum",
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}

    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}

    sets.defense.MDT = {ammo="Staunch Tathlum",
       	head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Engulfer Cape +1", waist="Flume Belt", legs="Mummu Kecks +1", feet="Meg. Jam. +2"}

	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Engulfer Cape +1", waist="Flume Belt", legs="Mummu Kecks +1", feet="Meg. Jam. +2"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Raider's Bmrng.",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Meg. Cuirie +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Meg. Jam. +2"}
		
    sets.engaged.SomeAcc = {ammo="Raider's Bmrng.",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Meg. Cuirie +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Meg. Jam. +2"}
    
	sets.engaged.Acc = {ammo="Raider's Bmrng.",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Suppanomimi", ear2="Cessance Earring",
        body="Mummu Jacket +1",hands="Floral Gauntlets",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
    sets.engaged.FullAcc = {ammo="Falcon Eye",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +1",hands="Adhemar Wristbands",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Grunfeld Rope",legs="Mummu Kecks +1",feet="Meg. Jam. +2"}

    sets.engaged.Fodder = {ammo="Raider's Bmrng.",
        head="Adhemar Bonnet",neck="Erudit. Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Meg. Jam. +2"}

    sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}

    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}

    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Grunfeld Rope",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
    sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet=gear.herculean_dt_feet}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 5)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 5)
    else
        set_macro_page(2, 5)
    end
end

--Dynamis Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[936] == 0 and not have_trust("Karaha-Baruha") then
					windower.send_command('input /ma "Karaha-Baruha" <me>')
					return true
				elseif spell_recasts[952] == 0 and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					return true
				elseif spell_recasts[914] == 0 and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					return true
				elseif spell_recasts[989] == 0 and not have_trust("KingofHearts") then
					windower.send_command('input /ma "King of Hearts" <me>')
					return true
				elseif spell_recasts[968] == 0 and not have_trust("Adelheid") then
					windower.send_command('input /ma "Adelheid" <me>')
					return true
				else
					return false
				end
			end
		end
	end
	return false
end