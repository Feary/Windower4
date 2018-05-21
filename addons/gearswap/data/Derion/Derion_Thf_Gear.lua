-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MagicWeapons','Throwing')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
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

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plunderer's Armlets",feet="Skulk. Poulaines"})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Fajin Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	
    sets.buff['Sneak Attack'] = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Grounded Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
    sets.buff['Trick Attack'] = {
		head="Meghanada Visor +1", neck="Houyi's Gorget", lear="Dudgeon Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Garuda Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {back="Repulse Mantle"}
	sets.Suppa = {ear1="Brutal Earring", ear2="Suppanomimi"}	
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapon Sets
	sets.weapons = {}
	sets.weapons.None = {main="Ternion Dagger",sub="Jugo Kukri"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Throwing = {range="Raider's Bmrng."}
	
	-- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Meghanada Visor +1", neck="Peacock Amulet", lear="Brutal Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		--Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.JA['Violent Flourish'] = {ammo="Hasty Pinion +1",
		head="Meghanada Visor +1", neck="Peacock Amulet", lear="Brutal Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		--Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Accomplice'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
    sets.precast.JA['Hide'] = {} --body="Pillager's Vest"
    sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {}--hands="Pill. Armlets +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines"}--legs="Skulker's Culottes",
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet",}--body="Passion Jacket",ring1="Asklepian Ring"
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {
		-- neck=Voltsurge Torque rear="Enchntr. Earring +1
		head="Haruspex Hat", lear="Loquac. Earring", 
		-- body="Taeon Tabard", hands="Leyline Gloves",lring="Prolix Ring",
		-- legs="Enif Cosciales"
		waist="Twilight Belt",}


    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})--body="Passion Jacket"


    -- Ranged snapshot gear
    sets.precast.RA = {feet="Meg. Jam. +1"}
			
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Aug.Cape.THF.WS
		back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Aug.Cape.THF.WS
		back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Aug.Cape.THF.WS
		back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Hasty Pinion +1",
		head="Meghanada Visor +1",  neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
		
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {
		--
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {
		head="Meghanada Visor +1",  neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Hasty Pinion +1",
		head="Meghanada Visor +1",  neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle",waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS
		back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
		
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {
		--ammo="Ginsen",
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle",waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Ginsen",
		head="Mummu Bonnet", neck="Fotia Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring",
		-- Aug.Cape.THF.WS 
		back="Vespid Mantle", waist="Prosilio Belt", legs="Mummu Kecks", feet="Mummu Gamashes +1"})

    sets.precast.WS['Last Stand'] = {}

    sets.precast.WS['Aeolian Edge'] = {
		-- lear="Crematio Earring",
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Hecate's Earring", rear="Moldavite Earring",
		--
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Shiva Ring",
		--  back=Aug.Cape.THF.WS 
		back="Toro Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Mummu Bonnet", neck="Peacock Amulet",
        body="Mummu Jacket +1",hands="Mummu Wrists",
		waist="Chaac Belt",legs="Mummu Kecks",feet="Mummu Gamashes +1"}

    sets.midcast.RA.Acc = {
        head="Mummu Bonnet",
        body="Mummu Jacket +1",hands="Mummu Wrists",
		waist="Chaac Belt",legs="Mummu Kecks",feet="Mummu Gamashes +1"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.idle.Sphere = set_combine(sets.idle, {})--body="Mekosu. Harness"

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets
    sets.defense.PDT = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt  Mummu Kecks +2
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.defense.MDT = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  lring="Shadow Ring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Inyanga Ring", rring="Defending Ring",
		-- Mummu Kecks +2
		back="Engulfer Cape", legs="Mummu Kecks", feet="Meg. Jam. +1"}

	sets.defense.MEVA = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  lring="Shadow Ring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Inyanga Ring", rring="Defending Ring",
		back="Engulfer Cape", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ranged="Raider's Bmrng.",
		head="Mummu Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- Adhemar Jacket 
		body="Mummu Jacket +1", hands="Mummu Wrists +1", lring="Rajas Ring", rring="Epona's Ring",
		-- Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Mummu Gamash. +1"}

 	sets.engaged.Acc = {ranged="Raider's Bmrng.",
		head="Mummu Bonnet", neck="Peacock Amulet", lear="Brutal Earring", rear="Suppanomimi",
		body="Mummu Jacket +1", hands="Mummu Wrists +1", lring="Rajas Ring", rring="Epona's Ring",
		--Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.FullAcc = {ranged="Raider's Bmrng.",
		head="Mummu Bonnet", neck="Peacock Amulet", lear="Brutal Earring", rear="Suppanomimi",
		body="Mummu Jacket +1", hands="Mummu Wrists +1", lring="Rajas Ring", rring="Epona's Ring",
		--Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.Fodder = {ranged="Raider's Bmrng.",
		head="Mummu Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		body="Mummu Jacket +1", hands="Mummu Wrists +1", lring="Rajas Ring", rring="Epona's Ring",
		-- Aug.Cape.THF.STP
		back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Mummu Gamash. +1"}

    sets.engaged.PDT = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt Mummu Kecks +2
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.Acc.PDT = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt Mummu Kecks +2
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.FullAcc.PDT = {
        head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt Mummu Kecks +2
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.Fodder.PDT = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		-- Flume Belt Mummu Kecks +2
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

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
        set_macro_page(3, 5)
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