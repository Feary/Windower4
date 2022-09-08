-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','Low','Mid','Max')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT','Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	
    gear.RAbullet = "Bullet" -- Eminent Bullet
    gear.WSbullet = "Bullet"
    gear.MAbullet = "Bullet" -- For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15

	-- Snapshot
	gear.snapshot_jse_back = 	{name="Camulus's Mantle", augments={'"Snapshot"+10',}}	
	-- Ranged TP
	gear.tp_ranger_jse_back =	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
	-- Crit RA TP
	gear.crit_ranger_jse_back= 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}}
	-- Last Stand
	gear.ranger_wsd_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	-- Leaden/Wildfire
	gear.magic_wsd_jse_back = 	{name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}	
	-- Melee TP
	gear.tp_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	-- DW
	gear.DW_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
	-- Savage Blade
	gear.str_wsd_jse_back = 	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	-- - Quick Draw
	gear.magic_QD_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
	-- Fast Cast
	gear.FC_jse_back = 			{name="Camulus's Mantle", augments={'MP+60','"Fast Cast"+10',}}
	
    -- Additional local binds
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons SingleWeapoterB1n;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons DualRangedWeapons;gs c update')
	send_command('bind !q gs c weapons SavageWeapons;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs	
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac", hands="Lanun Gants"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}
    
    sets.precast.CorsairRoll = {--ammo="Compensator",
		-- Rostam Path C
		--  lear="Etiolation Earring", rear="Odndowa Earring +1",
		head="Lanun Tricorne", neck="Regal Necklace",
		-- Malignance Tabard ring1=Luzaf Ring",
		body="Meg. Cuirie", hands="Chasseur's Gants", ring2="Defending Ring",
		--  legs="Desultor Tassets"
		back=gear.tp_jse_back, waist="Flume Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chass. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		--head="Nyame Helm", Baetyl Necklace rear="Crematio Earring"
		head="Laksa. Tricorne", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Hecate's Earring",
		-- Lanun Frac +3 hands="Carmine Fin. Ga. +1", ring1="Dingir Ring", ring2="Fenrir Ring +1"
		body="Lanun Frac", hands="Purser's Cuffs", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Skymir Cord +1 Nyame Flanchard Lanun Boots +3
		back=gear.magic_QD_jse_back, waist="Aquline Belt", legs="Laksa. Trews", feet="Malignance Boots"}
	
	-- STP 
    sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		-- head="Malignance Chapeau", neck="Iskur Gorget" lear="Dedition Earring", 
		head="Laksa. Tricorne",neck="Combatant's Torque", lear="Volley Earring", rear="Telos Earring",
		-- body="Malignance Tabard", hands="Malignance Gloves",
		body="Lanun Frac", hands="Purser's Cuffs", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Sweordfaetels +1", legs="Malignance Tights"
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Laksa. Trews", feet="Malignance Boots"}
	
	-- Acc 
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- neck="Comm. Charm +2", lear="Digni. Earring", 
		head="Laksa. Tricorne", neck="Combatant's Torque", lear="Telos Earring", rear="Gwati Earring",
		-- Malignance Tabard Laksa. Gants +3 rring="Regal Ring",
		body="Meghanada Cuirie", hands="Purser's Cuffs", lring="Stikini Ring", rring="Stikini Ring",
		-- waist="Kwahu Kachina Belt", Malignance Tights feet="Laksa. Bottes +3"
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Laksa. Trews", feet="Malignance Boots"}

	-- for ws bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
	
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
			
	-- to Prevent Damage overkill
	sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
		head="Laksa. Tricorne +2", neck="Sanctity Necklace", lear="Telos Earring", rear="Gwati Earring",
		body="Lanun Frac", hands="Meg. Gloves", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {} -- head="Mummu Bonnet +2",ring1="Asklepian Ring"
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells    
    sets.precast.FC = {
		-- head="Carmine Mask +1", neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		  lear="Loquac. Earring",  
		--body=gear.taeon_body_Fastcast, hands="Leyline Gloves", lring="Kishar Ring", rring="Prolix Ring",
		-- legs="Taeon Tights", feet="Carmine Greaves +1"
		back=gear.FC_jse_back, }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Snapshot Sets
    sets.precast.RA = {ammo=gear.RAbullet,
		-- neck="Comm. Charm +2
		head="Chass. Tricorne", 
		-- Oshosi Vest +1
		body="Laksa. Frac +3", hands="Lanun Gants",
		-- waist="Yemaya Belt", Adhemar Kecks +1 Path D
		back=gear.snapshot_jse_back, feet="Meg. Jambeaux"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head="Chass. Tricorne", 
		body="Laksa. Frac +3", hands="Lanun Gants",
		-- waist="Yemaya Belt", Adhemar Kecks +1 Path D
		back=gear.snapshot_jse_back, feet="Meg. Jambeaux"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head="Chass. Tricorne", 
		-- hands="Carmine Fin. Ga. +1",
		body="Laksa. Frac +3", hands="Lanun Gants",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Purser's Gaiters"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Meghanada Visor", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Telos Earring",
		--body="Laksa. Frac +3", 
		body="Meg. Cuirie", hands="Meg. Gloves", lring="Epaminondas's Ring", rring="Chirich Ring +1", 
		back=gear.magic_wsd_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}
	
    sets.precast.WS.Acc = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Telos Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring",  rring="Epaminondas's Ring", 
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jambeaux"}

    sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Melee
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		-- head="Nyame Helm", neck="Comm. Charm +2", 
		head="Meghanada Visor", neck="Combatant's Torque", lear="Moonshade Earring", rear="Telos Earring",
		--body="Laksa. Frac +3", hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Meg. Cuirie", hands="Meg. Gloves", lring="Rajas Ring", rring="Epaminondas's Ring", 
		-- waist="Salifi Belt +1", legs="Nyame Flanchard" feet="Lanun Boots +3"
		back=gear.str_wsd_jse_back, waist="Anguinus Belt", legs="Meg. Chausses", feet="Malignance Boots"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		-- head="Nyame Helm", neck="Comm. Charm +2", 
		head="Meghanada Visor", neck="Combatant's Torque", lear="Moonshade Earring", rear="Ishvara Earring",
		--body="Laksa. Frac +3", hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Meg. Cuirie", hands="Meg. Gloves", lring="Rajas Ring", rring="Epaminondas's Ring", 
		-- waist="Salifi Belt +1", legs="Nyame Flanchard" feet="Lanun Boots +3"
		back=gear.str_wsd_jse_back, waist="Anguinus Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
		-- head="Nyame Helm",
		head="Meghanada Visor", neck="Combatant's Torque", lear="Moonshade Earring", rear="Telos Earring",
		--body="Laksa. Frac +3", hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Meg. Cuirie", hands="Meg. Gloves", lring="Chirich Ring +1", rring="Epaminondas's Ring", 
		--  waist="Grunfeld Rope", legs="Nyame Flanchard" feet="Lanun Boots +3"
		back=gear.str_wsd_jse_back, waist="Anguinus Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	--Ranged Weaponskill
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- head="Lanun Tricorne +3",  rear="Enervating Earring",
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- body="Laksa. Frac +3", hands="Meg. Gloves +2", rring="Regal Ring", 
		body="Meghanada Cuirie", hands="Meg. Gloves", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		--waist="Fotia Belt", Malignance Tights feet="Lanun Boots +3"
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- Rostam A 
		-- head="Lanun Tricorne +3",  rear="Enervating Earring",
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- body="Laksa. Frac +3", hands="Meg. Gloves +2", rring="Regal Ring", 
		body="Meghanada Cuirie", hands="Meg. Gloves",lring="Epaminondas's Ring", rring="Chirich Ring +1",
		--waist="Fotia Belt", Malignance Tights feet="Lanun Boots +3"
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}
		

    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
		-- Comm. Neck +2
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3 Nyame Gauntlets Path B lring="Dingir Ring", rring="Archon Ring",
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1",  rring="Rajas Ring",
		-- Nyame Flanchard Path B feet="Lanun Bottes +3"
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
       	-- neck="Baetyl Pendant", 
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3 rring="Archon Ring",
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Rajas Ring",
		-- Herc legs agi mdmg wsd
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		-- head="Herc Helm", neck="Baetyl Pendant", Comm. Neck +2
		head="Mummu Bonnet +2", neck="Fotia Gorget", lear="Friomisi Earring",  rear="Moonshade Earring",
		-- Lanun Frac +3 
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Rajas Ring",
		-- Herc legs agi mdmg wsd
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		-- neck="Baetyl Pendant", 
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3 
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Rajas Ring",
		-- Herc legs agi mdmg wsd
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +1"}

    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
	
	--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
		-- Rostam A 
		-- Malignance Chapeau Ikenga's Hat neck="Iskur Gorget", rear="Enervating Earring",
		head="Meghanada Visor", neck="Combatant's Torque", lear="Telos Earring", rear="Volley Earring",
		-- Malignance Tabard Malignance Gloves lring="Ilabrat Ring", rring="Dingir Ring", 
		body="Meghanada Cuirie", hands="Meg. Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--waist="Yemaya Belt",  Malignance Tights Ikenga Trousers
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		-- Rostam A 
		-- Malignance Chapeau Ikenga's Hat neck="Iskur Gorget", rear="Enervating Earring",
		head="Meghanada Visor", neck="Combatant's Torque", lear="Telos Earring", rear="Volley Earring",
		-- Malignance Tabard Malignance Gloves lring="Ilabrat Ring", rring="Dingir Ring", 
		body="Meghanada Cuirie", hands="Meg. Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--waist="Yemaya Belt",  Malignance Tights Ikenga Trousers
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}
		
	 sets.midcast.RA.Crit = {ammo=gear.RAbullet,
		-- Rostam A 
		-- neck="Iskur Gorget", rear="Odr Earring",
		head="Meghanada Visor", neck="Combatant's Torque", lear="Telos Earring", rear="Volley Earring",
		-- Meghanada Cuirie +2 Mummu Wrist. +2 lring="Mummu Ring", rring="Begrudging Ring", 
		body="Meghanada Cuirie", hands="Meg. Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--waist="Gerdr Belt +1",  Darraigner's Brais Oshosi Lieggings +1
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Meg. Chausses", feet="Malignance Boots"}
	
	sets.buff['Triple Shot'] = {
		-- head="Oshosi Mask +1", 
		-- Oshosi Gloves
		body="Chasseur's Frac", hands="Lanun Gants", 
		-- legs="Osh. Trousers +1", Feet="Osh. Leggings +1",
		back=gear.tp_ranger_jse_back}
    
    -- Sets to return to when not performing an action.	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Odnowa Earring +1",
        head="Meghanada Visor",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Malignance Boots"}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Malignance Boots"}
	
    sets.defense.MEVA = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Malignance Boots"}
			
    sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	--Weapon Sets
	-- 'Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	-- Fencer Last Stand Rostam
	sets.weapons.Default = {main="Blurred Knife +1",sub="Nusku Shield",range="Gun of Trials"}--range="Fomalhaut"
	-- Last Stand Dual Ranged
	sets.weapons.DualRangedWeapons = {main="Blurred Sword +1",sub="Blurred Knife +1",range="Nibiru Gun"}
	-- Fencer Savage 
	sets.weapons.SavageWeapons = {main="Blurred Sword +1",sub="Nusku Shield", range="Nibiru Gun"}--range="Ataktos"
	-- DW Savage
	sets.weapons.DualWeapons = {main="Blurred Sword +1",sub="Hepatizon Rapier",range="Nibiru Gun"}--range="Ataktos"
	-- Leaden/Wildfire  Rostam Path A
	sets.weapons.LeadenWeapons = {main="Blurred Sword +1",sub="Blurred Knife +1", range="Nibiru Gun"}--range="Fomalhaut"
	-- Rolling
	sets.weapons.RollMeleeWeapons = {main="Naegling",sub="Blurred Knife +1",range="Compensator"}
	sets.weapons.RollRangedWeapons = {main="Kustawi +1",sub="Nusku Shield", range="Compensator"}
	
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"

    -- Engaged sets
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	-- Single Weapon
    sets.engaged = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Salifi Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.engaged.Acc = {
		-- head="Adhemar Bonnet +1"  rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Salifi Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}
	
	 sets.engaged.Low = {
		-- head="Adhemar Bonnet +1"  rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Salifi Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	sets.engaged.Mid = {
		-- head="Adhemar Bonnet +1"  rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Salifi Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	sets.engaged.Max = {
		-- head="Adhemar Bonnet +1"  rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Salifi Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.engaged.DW = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Suppanomimi", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

    sets.engaged.DW.Acc = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Suppanomimi", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}
	
	sets.engaged.DW.Low = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Suppanomimi", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	sets.engaged.DW.Mid = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Suppanomimi", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}

	sets.engaged.DW.Max = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Meghanada Visor", neck="Combatant's Torque", lear="Suppanomimi", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Twilight Belt", legs="Meg. Chausses", feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Ranged sets
	if player.equipment.range == 'Akatos' then
		if player.sub_job == 'NIN' then
			set_macro_page(4, 10)
		elseif player.sub_job == 'DNC' then
			set_macro_page(6, 10)
		elseif player.sub_job == 'WAR' then
			set_macro_page(5, 10)
		elseif player.sub_job == 'DRG' then
			set_macro_page(7, 10)
		else
			set_macro_page(1, 10)
		end
	-- Melee
	elseif player.sub_job == 'NIN' then
			set_macro_page(2, 10)
	elseif player.sub_job == 'DNC' then
			set_macro_page(1, 10)
	elseif player.sub_job == 'WAR' then
			set_macro_page(3, 10)
	elseif player.sub_job == 'DRG' then
			set_macro_page(8, 10)
	else
			set_macro_page(1, 10)
	end   
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 010')
end

function job_setup()
	-- Whether to use Compensator under a certain threshhold even when weapons are locked.
	state.CompensatorMode = M{'Never','300','1000','Always'}
	-- Whether to automatically generate bullets.
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false

	-- Whether to use Luzaf's Ring
	state.LuzafRing = M(false, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
	
	autows = 'Savage Blade'
	rangedautows = 'Last Stand'
	autofood = 'Maringna'
	ammostock = 198

    define_roll_values()
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","RngHelper","AutoStunMode","AutoDefenseMode","LuzafRing",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","ElementalMode","IdleMode","Passive","RuneElement","CompensatorMode","TreasureMode",})
end