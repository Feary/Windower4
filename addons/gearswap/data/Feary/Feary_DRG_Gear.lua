-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Default','Trishula')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	
    gear.da_jse_back = {name="Brigantia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.stp_jse_back = {name="Brigantia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.wsd_jse_back = {name="Brigantia's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	--augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}} 
	gear.crit_jse_back = {name="Brigantia's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.breathe_back = {name="Brigantia's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
	
	update_combat_form()
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais"}
	sets.precast.JA['Angon'] = {ammo="Angon",hands="Ptero. Fin. Gaunt."} 
	
	sets.precast.JA['Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Tripudio Earring",
		body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Tripudio Earring",
		body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Tripudio Earring",
		body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back=gear.stp_jse_back,wjaist="Windbuffet Belt +1",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Tripudio Earring",
		body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		-- Peltast's schynbalds
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {
		head="Vishap Armet", lear="Pratik Earring",
		hands="Lnc. Vmbrc. +2",
		feet="Ptero. Greaves"}
	sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail"} 
	sets.precast.JA['Deep Breathing'] = {head="Ptero. Armet"}
	sets.precast.JA['Spirit Surge'] = {body="Pteroslaver Mail"}

	-- Fast cast sets for spells	
	sets.precast.FC = {ammo="Impatiens",
		--neck="Voltsurge Torque",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--ring1="Lebeche Ring",
		body="Taeon Tabard",hands="Leyline Gloves",ring2="Prolix Ring",
		--legs="Founder's Greaves",
		back="Moonbeam Cape",waist="Flume Belt",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		--neck="Voltsurge Torque",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--ring1="Lebeche Ring",
		body="Taeon Tabard",hands="Leyline Gloves",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Tempus Fugit",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet"})
	
	-- Breath sets
	sets.HealingBreath = {
		head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="Anastasi Earring",
		body="Acro Surcoat", hands="Acro Gauntlets",		
		back="Updraft Mantle", waist="Glassblower's Belt", legs="Vishap Brais", feet="Ptero Greaves"}
		
	sets.SmitingBreath = {	
		head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="Anastasi Earring",
		body="Acro Surcoat", hands="Acro Gauntlets",		
		back="Updraft Mantle", waist="Glassblower's Belt", legs="Acro Breeches", feet="Acro Leggings"}
	
	sets.SteadyWing = {
		neck="Chanoix's Gorget", lear="Lancer's Earring",rear="Anastasi Earring",
		body="Emicho Haubert", hands="Despair Fin. Gauntlets",
		back="Updraft Mantle", legs="Vishap Brais", feet="Ptero. Greaves"}
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Flamma Korazin +1",hands="Sulev. Gauntlets +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- ammo="Knobkierrie"
		head="Flam. Zucchetto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +1",hands="Sulev. Gauntlets +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"})
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- ammo="Knobkierrie"
		head="Flam. Zucchetto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +1",hands="Sulev. Gauntlets +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- ammo="Knobkierrie"
		head="Flam. Zucchetto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +1",hands="Sulev. Gauntlets +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"})
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {ammo="Ginsen",
		-- ammo="Knobkierrie"
		head="Flam. Zucchetto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		-- Valorous Mail STR ACC DA
		body="Flamma Korazin +1",hands="Sulev. Gauntlets +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Geirskogul'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Geirskogul'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Geirskogul'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Camlann's Torment"].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Camlann's Torment"].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Sonic Thrust'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Leg Sweep'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Leg Sweep'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Leg Sweep'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--head="Frenzy Sallet"
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Default = {main="Upukirex", sub="Bloodrain Strap"}
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Acro Hands STP 20/20 STR/DEX hands=gear.valorous_acc_hands,
		body="Peltast's Plackart", hands="Flam. Manopolas +1", ring1="Rajas Ring",ring2="K'ayres Ring",
		--waist="Ioskeha Belt",
		back="Brigantia's Mantle",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		-- neck="Combatant Torque
		head="Flam. Zucchetto +1",neck="Love Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Regal Ring",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Shulmanu Collar",ear1="Zennaroi Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	
	sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
    
	sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
	sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
	
	-- Trishula
	sets.engaged.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Acro Hands STP 20/20 STR/DEX ring1="Rajas Ring",ring2="K'ayres Ring",
		body="Peltast's Plackart",hands="Sulevia's Gauntlets +2", lring="Rajas Ring", rring="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.SomeAcc.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Regal Ring",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
	sets.engaged.Acc.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.FullAcc.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Shulmanu Collar",ear1="Zennaroi Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}
    sets.engaged.Fodder.Trishula = {ammo="Ginsen",
		head="Flam. Zucchetto +1",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +1",feet="Flam. Gambieras +1"}

    sets.engaged.AM.Trishula = {}
    sets.engaged.AM.SomeAcc.Trishula = {}
	sets.engaged.AM.Acc.Trishula = {}
    sets.engaged.AM.FullAcc.Trishula = {}
    sets.engaged.AM.Fodder.Trishula = {}
	
    sets.engaged.PDT.Trishula= {}
    sets.engaged.SomeAcc.PDT.Trishula = {}
	sets.engaged.Acc.PDT.Trishula = {}
    sets.engaged.FullAcc.PDT.Trishula = {}
    sets.engaged.Fodder.PDT.Trishula = {}
	
    sets.engaged.AM.PDT.Trishula = {}
    sets.engaged.AM.SomeAcc.PDT.Trishula = {}
	sets.engaged.AM.Acc.PDT.Trishula = {}
    sets.engaged.AM.FullAcc.PDT.Trishula = {}
    sets.engaged.AM.Fodder.PDT.Trishula = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(4, 12)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'BLU' then
        set_macro_page(5, 12)
	elseif player.sub_job == 'NIN' then
        set_macro_page(2, 12)
	elseif player.sub_job == 'DNC' then
        set_macro_page(3, 12)
    else
        set_macro_page(1, 12)
    end
end