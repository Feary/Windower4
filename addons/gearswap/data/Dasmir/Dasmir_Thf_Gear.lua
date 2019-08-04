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

	gear.stp_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
	gear.da_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.dw_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}}
	gear.crit_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

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

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plun. Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines +1"})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Fajin Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	
    sets.buff['Sneak Attack'] = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.stp_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
    sets.buff['Trick Attack'] = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Dudgeon Earring", rear="Bladeborn Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Garuda Ring",
		back=gear.stp_jse_back, waist="Twilight Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {back="Repulse Mantle"}
	sets.Suppa = {ear1="Brutal Earring", ear2="Suppanomimi"}	
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {hands="Floral Gauntlets", ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",waist="Reiki Yotai"
	sets.Ambush = {body="Plunderer's Vest +1"}
	
	-- Weapon Sets
	sets.weapons.None = {main="Kaja Knife",sub="Kaja Sword"}
	sets.weapons.MagicWeapons = {main="Kaja Knife",sub="Kaja Sword"}
	sets.weapons.Throwing = {main="Kaja Knife",sub="Kaja Sword", range="Raider's Bmrng."}
	
	-- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Hasty Pinion +1",
		-- rear="Telos Earring",
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Mummu Ring", rring="Ramuh Ring",
		back=gear.stp_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet="Mummu Gamash. +2"}

    sets.precast.JA['Violent Flourish'] = {ammo="Hasty Pinion +1",
		--  rear="Telos Earring",
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Mummu Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Kentarch Belt +1", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] 	=	{head="Skulker's Bonnet +1"}
    sets.precast.JA['Accomplice'] 		= 	{head="Skulker's Bonnet +1"}
    sets.precast.JA['Flee'] 			=	{feet="Pill. Poulaines +1"}
    sets.precast.JA['Hide'] 			= 	{body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] 		= 	{body="Skulker's Vest"}
    sets.precast.JA['Steal'] 			= 	{}--hands="Pill. Armlets +1"
	sets.precast.JA['Mug'] 				= 	{}
    sets.precast.JA['Despoil'] 			= 	{legs="Skulk. Culottes +1", feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] 	=	{hands="Plun. Armlets +1"}
    sets.precast.JA['Feint']		 	= 	{legs="Plun. Culottes +1"} 

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",}--body="Passion Jacket",ring1="Asklepian Ring"
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body=gear_taeon_body_Fastcast, hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		-- back=gear.FC_jse_back,  waist="Tempus Fugit", legs="Enif Cosciales", feet="Herculean Boots"
		waist="Sarissapho. Belt",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})--body="Passion Jacket"

    -- Ranged snapshot gear
    sets.precast.RA = {feet="Meg. Jam. +2"}
			
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
		--head="Pill. Bonnet +2",neck="Caro Necklace",
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Sherida Earring", rear="Moonshade Earring",
		-- body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
		-- waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Lustra. Leggings +1"}
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		--head="Pill. Bonnet +2",neck="Caro Necklace",
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Sherida Earring", rear="Moonshade Earring",
		-- body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
		-- waist="Grunfeld Rope",legs="Plun. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
	
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
		--head="Pill. Bonnet +2", neck="Caro Necklace",
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Sherida Earring", rear="Moonshade Earring",
		-- body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
		-- waist="Grunfeld Rope", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
		
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})

	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
	
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Plun. Culottes +3", feet="Plun. Poulaines +3"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
	
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3", neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
	
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
		
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seeth. Bomblet +1",
		--head="Plun. Bonnet +3",neck="Caro Necklace",
		head="Meghanada Visor +2",  neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		--body="Plunderer's Vest +3",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		--waist="Grunfeld Rope", legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})
	
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
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {--ammo="Yetshila",
		--head="Adhemar Bonnet +1",
		head="Mummu Bonnet +2", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		-- body="Plunderer's Vest +3",hands="Adhemar Wrist. +1",rring="Begrudging Ring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Regal Ring", rring="Ilabrat Ring",
		--  legs="Pill. Culottes +3",feet="Plun. Poulaines +3"})
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"})

    sets.precast.WS['Last Stand'] = {}

    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
		-- lear="Crematio Earring",
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
		--
		body="Samnuha Coat", hands="Meg. Gloves +2", lring="Dingir Ring", rring="Shiva Ring",
		--waist="Eschan Stone",
		back=gear.wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
		
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {neck="Magoraga Beads"})--back="Mujin Mantle"

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear
    sets.midcast.RA = {
        head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Enervating Earring", rear="Neritic Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2", lring="Regal Ring", rring="Dingir Ring",
		back=gear.stp_jse_back, waist="Yemaya Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    sets.midcast.RA.Acc = {
        head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Enervating Earring", rear="Neritic Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2", lring="Regal Ring", rring="Dingir Ring",
		back=gear.stp_jse_back, waist="Yemaya Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.idle.Sphere = set_combine(sets.idle, {})--body="Mekosu. Harness"

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets
    sets.defense.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.defense.MDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		--  lring="Shadow Ring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

	sets.defense.MEVA = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		--  lring="Shadow Ring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.stp_jse_back,  waist="Flume Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
		--  rear="Dedition Earring",
		head="Mummu Bonnet +2", neck="Iskur Gorget", lear="Sherida Earring", rear="Suppanomimi",
		-- body="Pillager's Vest +3", hands="Adhemar Wrist. +1", lring="Epona's Ring", rring="Hetairoi Ring",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Regal Ring", rring="Epona's Ring",
		-- waist="Reiki Yotai", feet="Plun. Poulaines +3"
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Samnuha Tights", feet="Mummu Gamash. +2"}

 	sets.engaged.Acc = {
		head="Mummu Bonnet +2", neck="Lissome Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.FullAcc = {
		head="Mummu Bonnet +2", neck="Lissome Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.Fodder = {
		head="Mummu Bonnet +2", neck="Iskur Gorget", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Meg. Chausses +2", feet="Mummu Gamash. +2"}

    sets.engaged.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.Acc.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.FullAcc.PDT = {
        head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.Fodder.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}
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