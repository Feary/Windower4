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
	state.Weapons:options('Normal','Relic','MagicWeapons','Sword','Omen','Throwing')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')
	
	gear.stp_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.da_jse_back =	 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.crit_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.wsd_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

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

	-- Alias 
	send_command('alias gear exec gearthf.txt')
	send_command('alias ungear gs equip naked;exec ungearthf.txt')
	
	send_command('alias store po store thf')
	send_command('alias unstore po unpack thf')
	
	send_command('alias fol ffo me')
	send_command('alias ufol ffo stopall')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plun. Armlets +3"})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Jute Boots +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Cessance Earring"}
	sets.DWEarrings = {ear1="Brutal Earring", ear2="Suppanomimi"}
	--  Ebani Earring?
	sets.DWMax = {body="Adhemar Jacket +1", hands="Floral Gauntlets", waist="Reiki Yotai", ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.Ambush = {body="Plunderer's Vest +3"}

	-- Weapons Sets
	sets.weapons.Normal = 		{main="Twashtar",sub="Kaja Knife"}
	sets.weapons.Relic = 		{main="Mandau",sub="Twashtar"}
	sets.weapons.Ambuscade = 	{main="Kaja Knife",sub="Twashtar"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Sword = 		{main="Naegling", sub="Twashtar"}
	sets.weapons.Omen = 		{main="Blitto Needle", sub="Ridill"}
	sets.weapons.Throwing = 	{main="Twashtar",sub="Kaja Knife", range="Raider's Bmrng."}
	
    -- Actions we want to use to tag TH.
    -- Acc
	sets.precast.Step = {ammo="Yamarang",
		head="Meghanada Visor +2", neck="Erudit. Necklace", lear="Sherida Earring", rear="Telos Earring",
		body="Pillager's Vest +3", hands="Adhemar Wrist. +1", lring="Regal Ring", rring="Ilabrat Ring",
		-- Herculean Boots 
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Pill. Culottes +3", feet="Mummu Gamash. +2"}
	-- Macc
    sets.precast.JA['Violent Flourish'] = {ammo="Yamarang",  
		head="Mummu Bonnet +2", neck="Erudit. Necklace", lear="Digni. Earring", rear="Sherida Earring",
		body="Pillager's Vest +3", hands="Adhemar Wrist. +1", lring="Regal Ring", rring="Stikini Ring",
		-- Herculean Boots 
		back=gear.stp_jse_back, waist="Grunfeld Rope", legs="Pill. Culottes +3", feet="Mummu Gamash. +2"}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] 		= {head="Skulker's Bonnet +1"}
    sets.precast.JA['Accomplice'] 			= {head="Skulker's Bonnet +1"}
    sets.precast.JA['Flee'] 				= {feet="Pill. Poulaines +2"} 
    sets.precast.JA['Hide'] 				= {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator']			= {body="Skulker's Vest +1"}
    sets.precast.JA['Steal']				= {head="Pill. Bonnet +2", legs="Pill. Culottes +3", feet="Pill. Poulaines +2"} --  hands="Pillager's Armlets",
	sets.precast.JA['Mug']					= {head="Plun. Bonnet +3"}
    sets.precast.JA['Despoil']				= {legs="Skulker's Culottes +1", feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge']	 	= {hands="Plun. Armlets +3"}
    sets.precast.JA['Feint'] 				= {legs="Plun. Culottes +3"}
	sets.precast.JA['Assassin\'s Charge'] 	= {feet="Plun. Poulaines +3"}
	sets.precast.JA['Bully'] 				= {}
	
    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Reti Pendant", lear="Odnowa Earring +1", ear2="Enchntr. Earring +1",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Asklepian Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Rawhide Boots"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"} -- body="Passion Jacket",
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head="Haruspex Hat +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
		body="Taeon Tabard",hands="Leyline Gloves", ring1="Lebeche Ring", ring2="Prolix Ring",
		--legs="Rawhide Trousers"
		}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"

    -- Ranged snapshot gear
    sets.precast.RA = {legs="Adhemar Kecks +1", feet="Meg. Jam. +2"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
		-- neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3", hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"}    
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		-- neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
       	-- neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring", 
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
       	-- neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
        head="Plun. Bonnet +3",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
    
	sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Seeth. Bomblet +1",
        head="Plun. Bonnet +3",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
    
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
        head="Plun. Bonnet +3",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})
	
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seeth. Bomblet +1",
        head="Plun. Bonnet +3",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})
    
	sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Seeth. Bomblet +1",
		-- head="Pill. Bonnet +3",
        head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		-- waist="Artful Belt +1" 
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        -- head="Pillager's Bonnet +3", neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        -- head="Pillager's Bonnet +3", neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",
        -- head="Pillager's Bonnet +3", neck="Assassin's Neck +2", 
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    
    sets.precast.WS["Mercy Stroke"] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
        -- Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
	sets.precast.WS["Mercy Stroke"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].Fodder = set_combine(sets.precast.WS["Mercy Stroke"], {ammo="Seeth. Bomblet +1",
		-- Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    
	sets.precast.WS["Mercy Stroke"].SA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].TA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Mercy Stroke"].SATA = set_combine(sets.precast.WS["Mercy Stroke"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})

	sets.precast.WS["Mandalic Stab"] = sets.precast.WS["Rudra's Storm"]	
    sets.precast.WS["Mandalic Stab"].SomeAcc = sets.precast.WS["Rudra's Storm"].SomeAcc	
    sets.precast.WS["Mandalic Stab"].Acc = sets.precast.WS["Rudra's Storm"].Acc
	sets.precast.WS["Mandalic Stab"].FullAcc = sets.precast.WS["Rudra's Storm"].FullAcc
    sets.precast.WS["Mandalic Stab"].Fodder = sets.precast.WS["Rudra's Storm"].Fodder
    sets.precast.WS["Mandalic Stab"].SA = sets.precast.WS["Rudra's Storm"].SA
    sets.precast.WS["Mandalic Stab"].TA = sets.precast.WS["Rudra's Storm"].TA
    sets.precast.WS["Mandalic Stab"].SATA = sets.precast.WS["Rudra's Storm"].SATA

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {ammo="Yamarang",
		--head="Lilitu Headpiece", 
        head="Adhemar Bonnet +1",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yamarang",
		--head="Lilitu Headpiece",
        head="Adhemar Bonnet +1",neck="Caro Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Meg. Jam. +2"})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Meg. Jam. +2"})
    
	sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Sherida Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Meg. Jam. +2"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring",
		--  feet=Adhemar Gamash +1" Path B
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila", 
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring",
		-- feet="Adhe. Gamashes +1" Path B
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring", 
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring",
		-- feet="Adhe. Gamashes +1" Path B
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Lustra. Leggings +1"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring", 
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring", rring="Begrudging Ring",
		-- feet="Adhe. Gamashes +1" Path B
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring",
		-- feet="Adhe. Gamashes +1" Path B
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Lustra. Leggings +1"})
		
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring",
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Plun. Poulaines +3"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet +1", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3", hands="Adhemar Wrist. +1", ring1="Regal Ring", rring="Begrudging Ring",
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
        body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",ring1="Regal Ring",rring="Begrudging Ring", 
        back=gear.crit_jse_back, waist="Fotia Belt",legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		-- rear="Tati Earring +1", 
		head="Plun. Bonnet +3", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"})
    sets.precast.WS['Exenterator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Seeth. Bomblet +1",
		-- rear="Tati Earring +1", 
		head="Plun. Bonnet +3", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
		-- rear="Tati Earring +1", 
		head="Plun. Bonnet +3", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"})
	sets.precast.WS['Exenterator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seeth. Bomblet +1",
		-- rear="Tati Earring +1", 
		head="Plun. Bonnet +3", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"})
	sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Evisceration'], {ammo="Seeth. Bomblet +1",
		-- rear="Tati Earring +1", 
		head="Plun. Bonnet +3", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"})
    
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
        head="Plun. Bonnet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
        head="Plun. Bonnet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Yetshila",
        head="Plun. Bonnet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back, waist="Fotia Belt",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})

    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head, neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Moonshade Earring",
		-- Herculean Gloves NT/DEX, WSD, MAB rring="Karieyh Ring +1"
        body="Samnuha Coat",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",rring="Dingir Ring",
        --  legs=gear.herculean_nuke_legs NT/DEX, WSD, MAB mab feet=gear.herculean_nuke_feet NT/DEX, WSD, MAB
		back=gear.wsd_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs,feet="Lustra. Leggings +1"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
	
	sets.precast.WS['Aeolian Edge'].Omen = {ammo="Yetshila",
        head="Plun. Bonnet +3",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Plunderer's Vest +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_jse_back, waist="Fotia Belt", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"}
	
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
        -- Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seeth. Bomblet +1",
		--  Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {ammo="Seeth. Bomblet +1",
		-- Lustr Cap +1 Path A
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    
	sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seeth. Bomblet +1",
		-- Pill. Bonnet +3
		head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Sherida Earring",ear2="Ishvara Earring",
        body="Lustr. Harness +1",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epaminondas's Ring",
        back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"})


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Sherida Earring",ear2="Cessance Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------
    sets.midcast.FastRecast = {
		-- Herculean Helm
        head="Haruspex Hat +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Tempus Fugit",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear
    sets.midcast.RA = {
        head="Mummu Bonnet +2",neck="Erudit. Necklace",ear1="Telos Earring",ear2="Sherida Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    sets.midcast.RA.Acc = {
        head="Mummu Bonnet +2",neck="Erudit. Necklace",ear1="Telos Earring",ear2="Sherida Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------
	sets.DayIdle = {}
	sets.NightIdle = {}
    -- Resting sets
    sets.resting = {}
	
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum",
        head="Meghanada Visor +2",neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}

    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Meghanada Visor +2",neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Genmei Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.defense.MDT = {ammo="Staunch Tathlum",
       	head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
		--head="Adhemar Bonnet", Path A neck="Assassin's Gorget +2", 
		head="Adhemar Bonnet +1",neck="Iskur Gorget",lear="Sherida Earring",rear="Dedition Earring",
        body="Pillager's Vest +3",hands="Adhemar Wrist. +1",ring1="Epona's Ring", rring="Hetairoi Ring", 
        back=gear.stp_jse_back,waist="Reiki Yotai", legs="Samnuha Tights", feet="Plun. Poulaines +3"}
		
    sets.engaged.SomeAcc = {ammo="Yamarang",
		--head="Adhemar Bonnet", Path A neck="Assassin's Gorget +2",
		head="Adhemar Bonnet +1",neck="Iskur Gorget",lear="Sherida Earring",ear2="Telos Earring",
        body="Pillager's Vest +3",hands="Adhemar Wrist. +1",ring1="Epona's Ring", rring="Hetairoi Ring", 
        back=gear.stp_jse_back,waist="Reiki Yotai", legs="Samnuha Tights", feet="Plun. Poulaines +3"}
		
	sets.engaged.Acc = {ammo="Yamarang",
		--neck="Assassin's Gorget +2",
		head="Adhemar Bonnet +1",neck="Iskur Gorget",lear="Sherida Earring",ear2="Telos Earring", 
        body="Pillager's Vest +3",hands="Adhemar Wristbands", ring1="Epona's Ring", rring="Hetairoi Ring", 
        back=gear.stp_jse_back, waist="Reiki Yotai", legs="Pill. Culottes +3",  feet="Plun. Poulaines +3"}
		
    sets.engaged.FullAcc = {ammo="Yamarang",
		--neck="Assassin's Gorget +2",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",lear="Sherida Earring",ear2="Telos Earring",
        body="Pillager's Vest +3",hands="Adhemar Wristbands",ring1="Epona's Ring", rring="Hetairoi Ring", 
        back=gear.stp_jse_back,waist="Reiki Yotai", legs="Pill. Culottes +3",  feet="Plun. Poulaines +3"}
	
	sets.engaged.Fodder = {ammo="Ginsen",
		-- neck="Assassin's Gorget +2", 
        head="Adhemar Bonnet +1",neck="Iskur Gorget",lear="Sherida Earring",rear="Dedition Earring",
        body="Pillager's Vest +3",hands="Adhemar Wrist. +1",ring1="Epona's Ring", rring="Hetairoi Ring", 
        back=gear.stp_jse_back,waist="Reiki Yotai", legs="Samnuha Tights", feet="Plun. Poulaines +3"}
	
    sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet", neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
        back=gear.stp_jse_back, waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"}

    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum", 
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2", hands="Adhemar Wrist. +1", ring1="Epona's Ring", ring2="Defending Ring",
        back=gear.stp_jse_back, waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"}

    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
        head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2", hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
        back=gear.stp_jse_back, waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"}

    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet", neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2", hands="Adhemar Wrist. +1", ring1="Epona's Ring",ring2="Defending Ring",
        back=gear.stp_jse_back, waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"}

    sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2", hands="Adhemar Wrist. +1", ring1="Epona's Ring",ring2="Defending Ring",
        back=gear.stp_jse_back, waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +3"}

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

-- Dynamis Trust Overwrite
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