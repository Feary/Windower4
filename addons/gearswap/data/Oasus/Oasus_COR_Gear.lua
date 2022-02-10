-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','Low','Mid','Max')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT','Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	
    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet"
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
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs	
	sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +1"}-- hands="Lanun Gants +3",
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}
    
    sets.precast.CorsairRoll = {--ammo="Compensator",
		-- neck="Regal Necklace", lear="Etiolation Earring", rear="Odndowa Earring",
		head="Lanun Tricorne",  
		-- hands="Chasseur's Gants +1",
		body="Meg. Cuirie", hands="Nvrch. Gants +1", lring="Barataria Ring", rring="Defending Ring",
		--  legs="Desultor Tassets" -dt feet
		back=gear.tp_jse_back, waist="Flume Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Nvrch. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Nvrch. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Nvrch. Gants +1"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		-- Baetyl Necklace Crematio Earring
		head="Laksa. Tricorne +2", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Hecate Earring",
		-- Lanun Frac +3 Fenrir Ring +1
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1", lring="Rajas Ring", rring="Dingir Ring",
		-- Eschan Stone 
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Mummu Kecks +2", feet="Laksa. Bottes  +2"}
	
	-- STP 
    sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		-- neck="Combatant's Torque", lear="Dedition Earring", rear="Telos Earring",
		head="Laksa. Tricorne +2", neck="Iskur Gorget", lear="Neritic Earring", rear="Enervating Earring",
		-- body="Oshosi Vest +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		body="Oshosi Vest", hands="Laksa. Gants +2", lring="Rajas Ring", rring="Chirich Ring",
		-- waist="Kwahu Kachina Belt", feet="Lanun Boots +2"
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Mummu Kecks +2", feet="Carmine Greaves +1"}
	
	-- Acc 
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- neck="Combatant's Torque", lear="Diginitary Earring", 
		head="Laksa. Tricorne +2", neck="Voltsurge Torque", rear="Gwati Earring",
		body="Mummu Jacket +2", hands="Laksa. Gants +2", lring="Rajas Ring", rring="Stikini Ring",
		-- waist="Kwahu Kachina Belt",
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Mummu Kecks +2", feet="Laksa. Bottes  +2"}

	-- for ws bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chasseur's Bottes +1"})
	
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chasseur's Bottes +1"})
			
	-- to Prevent Damage overkill
	sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        -- Baetyl Necklace Diginitary Earring
		head="Laksa. Tricorne +2", neck="Sanctity Necklace", lear="Novio Earring", rear="Gwati Earring",
		-- Fenrir Ring +1 Fenrir Ring +1
		body="Lanun Frac +1", hands="Carmine Fin. Ga. +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells    
    sets.precast.FC = {
		-- head="Carmine Mask", 
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring",  rear="Enchntr. Earring +1",
		body=gear.taeon_body_Fastcast, hands="Leyline Gloves", lring="Kishar Ring", rring="Prolix Ring",
		-- legs="Taeon Tights", 
		back=gear.FC_jse_back, waist="Sarissapho. Belt", feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Snapshot Sets
    sets.precast.RA = {ammo=gear.RAbullet,
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- rring="Epaminondas's Ring", 
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
    sets.precast.WS.Acc = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.precast.WS.Proc = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Melee
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rufescent Ring", rring="Epona's Ring",
		back=gear.str_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		-- rear="Ishvara Earring",
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Steelflash Earring",
		-- rring="Epaminondas's Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		-- Herc legs str acc att wsd Lanun Boots +3
		back=gear.str_wsd_jse_back, waist="Prosilio Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
       -- head="Herc helm WSD", rear="Ishvara Earring",
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Steelflash Earring",
		-- rring="Epaminondas's Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rufescent Ring", rring="Epona's Ring",
		-- Herc legs str acc att wsd Lanun Boots +3
		back=gear.str_wsd_jse_back, waist="Prosilio Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

	--Ranged Weaponskill
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- head="Lanun Tricorne +3", rear="Ishvara Earring"
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- lring="Epaminondas's Ring", 
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Dingir Ring", 
		-- feet="Lanun Boots +3"
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- head="Lanun Tricorne +3", rear="Ishvara Earring"
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- lring="Epaminondas's Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Dingir Ring", 
		-- feet="Lanun Boots +3"
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

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
		-- neck="Baetyl Pendant", Comm. Neck +2
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3  rring="Archon Ring",
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Rajas Ring",
		-- Herc legs agi mdmg wsd
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +1"}

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
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		-- Nisroch Jerkin  Adhemar Wristbands +1 Path C
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Dingir Ring", 
		-- legs="Adhemar Kecks +1", Path C Feet="Adhemar Gamashes +1" Path D
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Adhemar Gamashes"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Rajas Ring",
		-- legs="Adhemar Kecks +1", 
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
		
	 sets.midcast.RA.Crit = {ammo=gear.RAbullet,
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		-- rring="Hajduk Ring", 
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Rajas Ring",
		-- legs="Adhemar Kecks +1", 
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	sets.buff['Triple Shot'] = {
		-- head="Oshosi Mask +1", 
		head="Meghanada Visor +2",
		-- Lanun Gants +3 Oshosi Gloves
		body="Chasseur's Frac +1", hands="Meg. Gloves +2", 
		-- legs="Oshosi Trousers +1", Feet="Oshosi Leggings +1",
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses +2", feet="Adhemar Gamashes"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Meghanada Visor",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Meg. Jambeaux"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Meg. Jambeaux"}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Meg. Jambeaux"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Meg. Jambeaux"}
	
    sets.defense.MEVA = {ammo=gear.RAbullet,
		--  neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Merman's Earring",
        head="Rawhide Mask",
		-- lring="Dark Ring",
		body="Meghanada Cuirie", hands="Meghanada Gloves", rring="Defending Ring",
		-- waist="Flume Belt", 
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses", feet="Meg. Jambeaux"}
			
    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Weapon Sets
	-- 'Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	-- Fencer Last Stand Rostam
	sets.weapons.Default = {main="Odium",sub="Nusku Shield",range="Nibiru Gun"}--range="Fomalhaut"
	-- Last Stand Dual Ranged
	sets.weapons.DualRangedWeapons = {main="Kustawi +1",sub="Kaja Knife",range="Nibiru Gun"}
	-- Fencer Savage 
	sets.weapons.SavageWeapons = {main="Naegling",sub="Nusku Shield", range="Nibiru Gun"}--range="Ataktos"
	-- DW Savage
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Nibiru Gun"}--range="Ataktos"
	-- Leaden/Wildfire  Rostam Path A
	sets.weapons.LeadenWeapons = {main="Naegling",sub="Kaja Knife",range="Nibiru Gun"}--range="Fomalhaut"
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
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		--  feet="Herculean Boots", TA
		back=gear.tp_jse_back, waist="Windbuffet Belt", legs="Samnuha Tights", feet="Meg. Jam. +2"}

    sets.engaged.Acc = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}
	
	 sets.engaged.Low = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"  rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.Mid = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1",legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.Max = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.DW_jse_back, waist="Kentarch Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.DW.Acc = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		-- Adhemar Jacket +1
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Cacoethic Ring", rring="Ramuh Ring",
		back=gear.DW_jse_back, waist="Kentarch Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	sets.engaged.DW.Low = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"  rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.DW.Mid = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.DW.Max = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 10)
	elseif player.sub_job == 'RNG' then
        set_macro_page(4, 10)
    else
        set_macro_page(1, 10)
    end   
end