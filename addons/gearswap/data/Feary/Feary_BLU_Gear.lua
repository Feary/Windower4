function user_setup()
	-- Options: Override default values
	-- F9
    state.OffenseMode:options('Fodder','Normal','MinAcc','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Default','MagicWeapons','MaccWeapons','HybridWeapons')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'MP','SuppaBrutal', 'DWEarrings','DWMax'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	--{'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}} 
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.mab_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = {name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	gear.cure_jse_back = {name="Rosmerta's Cape",augments={'MND+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Chuq'aba Belt"
	gear.obi_nuke_waist = "Salire Belt"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	update_combat_form()
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashishin Basmak"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs"}
	sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- used for omen objectives
	-- //curecheat
	sets.HPDown = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Odnowa Earring +1",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Dynamic Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.Flourish1 = {ammo="Hasty Pinion +1",
		--neck="Sanctity Necklace"
	   head="Jhakri Coronal +1",ear1="Gifted Earring",ear2="Enchntr. Earring +1",
	   body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Stikini Ring",ring2="Stikini Ring",
	   back="Cornflower Cape",waist="Dynamic Belt +1",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	-- Fast cast sets for spells

	sets.precast.FC = {--main="Vampirism",sub="Vampirism",ammo="Impatiens",
		--neck="Voltsurge Torque",
		head="Carmine Mask +1", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		--ring2="Kishar Ring",
		body="Luhlaza Jubbah",hands="Leyline Gloves",ring1="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})--body="Passion Jacket"

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Jhakri Coronal +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.precast.WS.SomeAcc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Apate Ring
		body="Ayanmo Corazza +2",hands="Jhakri Cuffs +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.precast.WS.Acc = {ammo="Mantoptera Eye",
		head="Carmine Mask +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.WS.HighAcc = {ammo="Mantoptera Eye",
		head="Carmine Mask +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands", ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.WS.FullAcc = {ammo="Mantoptera Eye",
		head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Jhakri Cuffs +1",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.WS.Fodder = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Jhakri Cuffs +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring",})
	sets.precast.WS['Requiescat'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.precast.WS['Requiescat'].HighAcc = set_combine(sets.precast.WS.HighAcc, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring"})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ear1="Moonshade Earring",ring1="Stikini Ring",ring2="Stikini Ring",})
	sets.precast.WS['Realmrazer'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].HighAcc = set_combine(sets.precast.WS.HighAcc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {ear1="Moonshade Earring",})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet",ear1="Moonshade Earring",hands="Adhemar Wristbands",back=gear.crit_jse_back,})
	sets.precast.WS['Chant du Cygne'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Moonshade Earring",hands="Adhemar Wristbands",back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",legs="Carmine Cuisses +1",back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].HighAcc = set_combine(sets.precast.WS.HighAcc, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet",back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet",back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
	sets.precast.WS['Vorpal Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ear2="Moonshade Earring",body="Ayanmo Corazza +2",hands="Jhakri Cuffs +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",back=gear.wsd_jse_back,waist="Grunfeld Rope"})
	sets.precast.WS['Expiacion'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear2="Moonshade Earring",body="Ayanmo Corazza +2",hands="Jhakri Cuffs +1",ring1="Ifrit Ring +1",ring2="Ifrit Ring +1",back=gear.wsd_jse_back,waist="Grunfeld Rope"})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring", hands="Jhakri Cuffs +1",back=gear.wsd_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Expiacion'].HighAcc = set_combine(sets.precast.WS.HighAcc, {ear2="Moonshade Earring",hands="Jhakri Cuffs +1",back=gear.wsd_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {hands="Jhakri Cuffs +1"})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})


	sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
			         head="Jhakri Coronal +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Shiva Ring +1",ring2="Archon Ring",
			         back=gear.mab_jse_back,waist="Fotia Belt", legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"} -- test

	sets.precast.WS['Flash Nova'] = {ammo="Dosis Tathlum",
			         head="Jhakri Coronal +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
		             body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
			         back=gear.mab_jse_back,waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		-- neck="Voltsurge Torque",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--ring1="Kishar Ring"
		body="Luhlaza Jubbah",hands="Leyline Gloves",ring1="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --
	sets.midcast['Blue Magic'].Physical = {--ammo="Mavi Tathlum",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +1", neck="Lacono Necklace +1", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
		-- Shukuyu Ring 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Hasty Pinion +1",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +1", neck="Lacono Necklace +1", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
		-- Shukuyu Ring 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Physical.Fodder = {--ammo="Mavi Tathlum",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +1", neck="Lacono Necklace +1", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
		-- Shukuyu Ring 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +1", feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Heartseeker Earring", rear="Steelflash Earring",
		-- Acc Body
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
		back=gear.wsd_jse_back, waist="Grunfeld Rope", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +1"}		

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})


	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Dosis Tathlum", --main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Yamabuki-no-Obi
		back=gear.mab_jse_back, waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{
		--neck="Sanctity Necklace",
		hands="Jhakri Cuffs +1",ring1="Stikini Ring", ring2="Stikini Ring",
		legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})

	sets.midcast['Blue Magic'].Magical.Fodder = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Yamabuki-no-Obi
		back=gear.mab_jse_back, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring1="Stikini Ring",ring2="Stikini Ring",waist="Ovate Rope"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Dosis Tathlum",--main="Iris",sub="Iris",
		-- Assim +3 Sanctity Necklace Dignitary Earring Hermetic Earring
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
		-- Carm. Sc. Mail +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone assim legs
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}


	sets.midcast['Enfeebling Magic'] = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		-- Assim +3 Sanctity Necklace Dignitary Earring Hermetic Earring
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
		-- Carm. Sc. Mail +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone assim legs
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Dark Magic'] = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		-- Assim +3 Sanctity Necklace Dignitary Earring Hermetic Earring
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
		-- Carm. Sc. Mail +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone assim legs
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Enhancing Magic'] = {--main="Vampirism", sub="Vampirism",
		ammo="Hasty Pinion +1",
		--head="Telchine Cap",neck="Incanter's Torque",
		ear1="Andoaa Earring",ear2="Gifted Earring",
		--body="Telchine Chas.",hands="Telchine Gloves",
		ring1="Stikini Ring",ring2="Stikini Ring",
		--back="Perimede Cape",legs="Telchine Braconi",feet="Telchine Pigaches"
		waist="Olympus Sash",}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif"

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--ear2="Earthcry Earring", ,legs="Shedir Seraweels"

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})-- legs="Shedir Seraweels"
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"

	sets.midcast['Divine Magic'] = {ammo="Dosis Tathlum",
		--neck="Incanter's Torque",
		head="Jhakri Coronal +1",lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.mab_jse_back,waist="Wanion Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	sets.midcast['Elemental Magic'] = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Yamabuki-no-Obi
		back=gear.mab_jse_back, waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Yamabuki-no-Obi
		back=gear.mab_jse_back, waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.element.Dark = {} -- head="Pixie Hairpin +1",ring2="Archon Ring"
	sets.element.Earth = {} -- neck="Quanpur Necklace"
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {ammo="Dosis Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Lifestorm Earring", rear="Enchntr. Earring +1",
		-- Vrikodata Jupon body="Telchine Chas.",
		 hands="Telchine Gloves", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash feet="Medium Sabots"
		back=gear.cure_jse_back, waist=gear.ElementalObi, legs="Gyve Trousers"}

	-- Breath Spells --
	sets.midcast['Blue Magic'].Breath = {--ammo="Mavi Tathlum",
		-- Assim +3 Sanctity Necklace Dignitary Earring Hermetic Earring
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
		-- Carm. Sc. Mail +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone assim legs
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {ammo="Dosis Tathlum",
		-- Erra Pendant Sanctity Necklace Regal Earring Diginitary
		head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Jhakri Cuffs +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash/Eschan Stone Jhakri Slops +1 Jhakri Pigaches +1
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Hasty Pinion +1",--main="Iris",sub="Iris",
	  -- Erra Pendant Sanctity Necklace Regal Earring Dignitary Earring
		head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash/Eschan Stone 
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}


	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {--ammo="Mavi Tathlum",
		-- Despair Helm Dualism Collar +1 Odnowa Earring +1 
		head="Carmine Mask +1", neck="Dualism Collar", lear="Odnowa Earring +1", rear="Enchntr. Earring +1",
		-- Despair Mail body="Telchine Chas.",
		hands="Telchine Gloves", lring="K'ayres Ring", rring="Meridian Ring",
		-- Oneiros Belt  feet="Medium Sabots"
		back=gear.cure_jse_back, waist=gear.ElementalObi, legs="Gyve Trousers", }

	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Staunch Tathlum", -- main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Lifestorm Earring", rear="Enchntr. Earring +1",
		-- Vrikodata Jupon body="Telchine Chas.",
		hands="Telchine Gloves", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash feet="Medium Sabots"
		back=gear.cure_jse_back, waist=gear.ElementalObi, legs="Gyve Trousers", }

	--Overwrite certain spells with these pieces even if the day matches, because of resource inconsistencies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Chuq'aba Belt"}

	---
	-- Occulation: Resulting in 12 shadows at 600 skill.
	sets.midcast['Blue Magic'].SkillBasedBuff = {--main="Iris",sub="Iris",ammo="Mavi Tathlum",
		-- Incanter's Torque 
		head="Luhlaza Keffiyeh", lear="Gifted Earring", rear="Loquac. Earring",
		-- Rawhide Gloves
		body="Assimilator's Jubbah", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt", feet="Luhlaza Charuqs"}
	
	-- Duration Gear?
	sets.midcast['Blue Magic'].Buff = {--main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		-- Incanter's Torque 
		head="Luhlaza Keffiyeh", lear="Gifted Earring", rear="Loquac. Earring",
		-- Rawhide Gloves
		body="Assimilator's Jubbah", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt", feet="Luhlaza Charuqs"}
	
	-- Refresh Received Gear
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {})--head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar Sash"
	
	-- Aquaveil Gear
	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {})--head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu."}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",ammo="Hasty Pinion +1",
		--head="Rawhide Mask",
		head="Aya. Zucchetto +2", neck="Loricate Torque",ear1="Ethereal Earring", ear2="Etiolation Earring",
		body="Jhakri Robe +2", hands="Aya. Manopolas +1", ring1="Defending Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	-- Idle sets
	-- Refresh
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Rawhide Mask
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		body="Jhakri Robe +2", hands="Aya. Manopolas +1", lring="Dark Ring", rring="Defending Ring",
		-- 
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}		
		
	sets.idle.Sphere = set_combine(sets.idle, {})--body="Mekosu. Harness"

	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}			

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"

	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield", ammo="Staunch Tathlum",
		-- Genmei Shield Genmei Earring
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Dark Ring", rring="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}			

	sets.defense.MEVA = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
      	head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}			

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Ethereal Earring", ear2="Suppanomimi"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	-- body="Adhemar Jacket +1",waist="Grunfeld Rope",
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapon Set
	sets.weapons.None = {main="Tanmogayi +1",sub="Nibiru Blade"}
	sets.weapons.Default = {main="Tanmogayi +1",sub="Nibiru Blade"}
	--sets.weapons.Almace = {main="Almace",sub="Tanmogayi +1"}
	--sets.weapons.Sequence = {main="Sequence",sub="Almace"}		
	sets.weapons.MagicWeapons = {main="Nibiru Cudgel", sub="Nibiru Cudgel"}
	sets.weapons.MaccWeapons = {main="Iris", sub="Iris"}
	sets.weapons.HybridWeapons = {main="Vampirism", sub="Vampirism"}

	-- Engaged sets
	sets.engaged = {main="Tanmogayi +1", sub="Nibiru Blade", ammo="Ginsen",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		-- Adhemar Jacket +1 ring2="Petrov Ring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		-- Herc Boots
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.MinAcc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.MinAcc.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		-- STP Cape
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.SomeAcc = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.SomeAcc.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.Acc = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.Acc.AM = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Iqabi Necklace", ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.HighAcc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.HighAcc.AM = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Iqabi Necklace", ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.FullAcc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Iqabi Necklace",ear1="SteelFlash Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Dynamic Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.FullAcc.AM = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Iqabi Necklace",ear1="SteelFlash Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Dynamic Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.Fodder = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.Fodder.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		-- waist="Grunfeld Rope",
		back=gear.da_jse_back,waist="Windbuffet Belt +1", legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.DTLite.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Cessance Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Brutal Earring",ear2="Suppanomimi", 
		-- 
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.MinAcc.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.MinAcc.PDT = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.SomeAcc.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.Acc.DTLite = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.Acc.PDT = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.HighAcc.DTLite = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.HighAcc.PDT = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.FullAcc.DTLite = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.FullAcc.PDT = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.Fodder.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.Fodder.DTLite.AM = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.MDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.engaged.MinAcc.MDT = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.SomeAcc.MDT = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi", ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.Acc.MDT = {ammo="Hasty Pinion +1",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi", ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.engaged.HighAcc.MDT = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Suppanomimi", ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.FullAcc.MDT = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Loricate Torque",ear1="Suppanomimi", ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.Fodder.MDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Loricate Torque",ear1="Suppanomimi", ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Healing_Club = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Healing_DWClub = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Healing_Club = {}
	sets.Healing_DWClub = {}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 8)
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] == 0 and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[952] == 0 and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[967] == 0 and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[914] == 0 and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[979] == 0 and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = 250
					return true
				else
					return false
				end
			end
		end
	end
	return false
end
