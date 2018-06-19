-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualWeapons','SavageWeapons','DualRangedWeapons','LeadenWeapons','None')
	state.CompensatorMode:options('300','1000','Never','Always')
	
    gear.RAbullet = "Adlivun Bullet"
    gear.WSbullet = "Adlivun Bullet"
    gear.MAbullet = "Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Omphalous Bullet"
    options.ammo_warning_limit = 15

	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_ranger_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.tp_jse_back = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	-- 'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}

	
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

	send_command('bind !r gs c weapons SingleWeapon;gs c update')
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
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}
    
    sets.precast.CorsairRoll = {
		-- neck="Regal Necklace"
        head="Lanun Tricorne",neck="Loricate Torque +1", ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Lanun Frac",hands="Chasseur's Gants",ring1="Barataria Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt",legs="Desultor Tassets",feet="Meg. Jam. +2"}
		
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
       -- Baetyl Pendant
		head="Blood Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1
		body="Samnuha Coat", hands="Leyline Gloves", lring="Shiva Ring +1", rring="Shiva Ring +1",
		--  Aug.Cape.COR.MAB      Belt             Adhe. Gamashes +1 
		back=gear.tp_ranger_jse_back, waist="Salire Belt", legs="Mummu Kecks +1", feet="Adhemar Gamashes"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
         -- Baetyl Pendant
		head="Blood Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1
		body="Samnuha Coat", hands="Leyline Gloves", lring="Shiva Ring +1", rring="Shiva Ring +1",
		--  Aug.Cape.COR.MAB      Belt             Adhe. Gamashes +1 
		back=gear.tp_ranger_jse_back, waist="Salire Belt", legs="Mummu Kecks +1", feet="Adhemar Gamashes"}
	
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- Sanctity Necklace 
		head="Meghanada Visor +2", neck="Iqabi Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
		-- Mirke Wadecors  Arvina Ringlet +1
		body="Lanun Frac", hands="Chasseur's Gants", lring="Stikini Ring", rring="Stikini Ring",
		-- Eschan Stone 
		back=gear.tp_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Mummu Kecks +1", feet="Chasseur's Bottes"}
		
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chasseur's Bottes "})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves. +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Dashing Subligar",feet="Carmine Greaves +1"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +1",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		-- neck="Baetyl Pendant"
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Taeon Tabard",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +1",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

	-- Snapshot
    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne",
        --body="Laksa. Frac +3",
		hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	-- Melee
    sets.precast.WS = {
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ifrit Ring +1",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
    sets.precast.WS.Acc = {
        head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}		
		
    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Grunfeld Belt",legs="Carmine Cuisses +1",feet="Mummu Gamash. +1"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
			head="Carmine Mask +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie +2", hands="Carmine Fin. Ga. +1", lring="Stikini Ring", rring="Stikini Ring",
			back=gear.tp_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})
			
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Carmine Mask +1",neck="Lacono Neck. +1",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Mummu Jacket +1",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ifrit Ring +1",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
         head="Carmine Mask +1",neck="Iqabi Necklace",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Mummu Jacket +1",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Ifrit Ring +1",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	-- Ranged WS
	-- Last Stand
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Moonshade Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
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
		-- Ishvara Earring
		 head="Lanun Tricorne", neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Laksa. Frac +3 
		body="Samnuha Coat", hands="Carmine Fin. Ga. +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
		-- waist="Eschan Stone"
		back=gear.magic_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
         head="Lanun Tricorne",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Meghanada Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Adhe. Gamashes"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
      head="Lanun Tricorne",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Adhe. Gamashes"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head="Lanun Tricorne",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Adhe. Gamashes"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
	--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Cessance Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Neritic Earring",ear2="Enervating Earring",}
	sets.AccMaxTP = {ear1="Neritic Earring",ear2="Enervating Earring",}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
    
	-- Specific spells
	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Odnowa Earring +1", ear2="Enchntr. Earring +1",
        body="Meg. Cuirie +2",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Hajduk Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Armageddon = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="Hajduk Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Armageddon.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Fomalhaut = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Fomalhaut.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Mummu Jacket +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1 +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Meg. Jam. +2"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask",neck="Loricate Torque +1 +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Meg. Jam. +2"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	-- body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}
	
	--Weapon Sets
	sets.weapons.Default = {main="Atoyac",sub="Legion Scutum",range="Malison"}
	sets.weapons.DualWeapons = {main="Demersal Degan",sub="Atoyac",range="Malison"}
	sets.weapons.SavageWeapons = {main="Demersal Degan",sub="Atoyac",}
	sets.weapons.DualRangedWeapons = {main="Demersal Degan",sub="Atoyac"}
	sets.weapons.LeadenWeapons = {main="Demersal Degan",sub="Atoyac",range="Malison"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		body="Mummu Jacket +1", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet="Mummu Gamash. +1"}

    sets.engaged.Acc = {
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back=gear.tp_jse_back, waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW = {
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		body="Mummu Jacket +1", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet="Mummu Gamash. +1"}

    sets.engaged.DW.Acc = {
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back=gear.tp_jse_back, waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
    elseif player.sub_job == 'RNG' then
        set_macro_page(3, 10)
	elseif player.sub_job == 'WAR' then
        set_macro_page(5, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(4, 10)
	elseif player.sub_job == 'RDM' then
        set_macro_page(4, 10)
	elseif player.sub_job == 'BRD' then
        set_macro_page(4, 10)
    else
        set_macro_page(1, 10)
    end  
end