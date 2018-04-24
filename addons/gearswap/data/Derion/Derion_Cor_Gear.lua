-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualWeapons','SavageWeapons','DualRangedWeapons','LeadenWeapons','None')
	
    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet"
    gear.MAbullet = "Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	-- 'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}

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
    sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}
    
    sets.precast.CorsairRoll = {
		head="Lanun Tricorne", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Chasseur's Gants", lring="Barataria Ring", rring="Luzaf's Ring",
		--  legs="Desultor Tassets"
		back="Camulus's Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		--  neck="Stoicheion Medal",
		head="Meghanada Visor +1", lear="Hecate's Earring", rear="Moldavite earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Garuda Ring", rring="Garuda Ring",
		-- waist="Aquiline Belt",
		back="Toro Cape", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        --  neck="Stoicheion Medal",
		head="Meghanada Visor +1", lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Perception Ring", rring="Perception Ring",
		-- waist="Aquiline Belt",
		back="Navarch's Mantle",  legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		--  neck="Stoicheion Medal",
		head="Meghanada Visor +1", lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Perception Ring", rring="Perception Ring",
		-- waist="Aquiline Belt",
		back="Navarch's Mantle",  legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chasseur's Bottes"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		-- head="Carmine Mask", neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		head="Haruspex Hat", lear="Loquac. Earring",  
		-- body="Taeon Tabard", hands="Leyline Gloves", rring="Prolix Ring",				
		--back="Camulus's Mantle", legs="Taeon Tights", feet="Carmine Greaves"
		waist="Twilight Belt"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.RAbullet,
		head="Chass. Tricorne", 
		-- body="Skopos Jerkin",  
		body="Ebon Jerkin", hands="Lanun Gants",
		-- Camulus's Mantle waist="Impulse Belt",
		back="Navarch's Mantle", legs="Chasseur's Culottes", feet="Meg. Jam. +1"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.ranger_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
    sets.precast.WS.Acc = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.ranger_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.WS.Proc = {
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Dark Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Melee
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Leviathan Ring", rring="Epona's Ring",
		back=gear.str_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.str_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.str_wsd_jse_back, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	--Ranged Weaponskill
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- lear="Clearview Earring", rear="Volley Earring",
		head="Meghanada Visor +1", neck="Fotia Gorget", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Garuda Ring", rring="Cacoethic Ring",
		-- Kwahu Kachina Belt 
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- lear="Clearview Earring", rear="Volley Earring",
		head="Meghanada Visor +1", neck="Fotia Gorget", 
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Garuda Ring", rring="Cacoethic Ring",
		-- Kwahu Kachina Belt 
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

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
		--  Baetyl Pendant Pixie Earring +1 neck="Stoicheion Medal",  lear="Friomisi Earring",
		head="Lanun Tricorne",  rear="Moonshade Earring",
		-- Carmine Mail +1  Carmine Fin. Gauntlets +1 Arvina Ringlet +1
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Stone Adhe. Gamashes +1
		back=gear.ranger_wsd_jse_back, waist="Salire Belt", legs="Lak. Trews", feet="Meg. Jam. +1"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
        --  Baetyl Pendant Pixie Earring +1 neck="Stoicheion Medal", lear="Friomisi Earring",
		head="Lanun Tricorne",   rear="Moonshade Earring",
		-- Carmine Mail +1  Carmine Fin. Gauntlets +1 Arvina Ringlet +1
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Stone Adhe. Gamashes +1
		back=gear.ranger_wsd_jse_back, waist="Salire Belt", legs="Lak. Trews", feet="Meg. Jam. +1"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		--  neck="Stoicheion Medal",
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Hecate's Earring", rear="Moldavite Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Garuda Ring", rring="Cacoethic Ring",
		-- waist="Aquiline Belt",
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		--  neck="Stoicheion Medal",
		head="Meghanada Visor +1", neck="Fotia Gorget", lear="Hecate's Earring", rear="Moldavite Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Garuda Ring", rring="Cacoethic Ring",
		-- waist="Aquiline Belt",
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

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
		--  lear="Clearview Earring", rear="Volley Earring",
		head="Meghanada Visor +1", neck="Peacock Amulet",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Cacoethic Ring",
		-- waist="Buccaneer's Belt",
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		--  lear="Clearview Earring", rear="Volley Earring",
		head="Meghanada Visor +1", neck="Peacock Amulet",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Cacoethic Ring",
		-- waist="Buccaneer's Belt",
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        hhead="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Defending Ring",
		-- waist="Flume Belt",
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Defending Ring",
		-- waist="Flume Belt"
		back="Engulfer Cape", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Defending Ring",
		-- waist="Flume Belt",
		back="Repulse Mantle", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}


    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Defending Ring",
		-- waist="Flume Belt"
		back="Engulfer Cape", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Meghanada Ring", rring="Defending Ring",
		-- waist="Flume Belt"
		back="Engulfer Cape", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
			
    sets.Kiting = {legs="Crimson Cuisses"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapon Sets
	sets.weapons.Default = {main="Atoyac",sub="Legion Scutum",range="Malison"}--main="Fettering Blade",sub="Nusku Shield",range="Fomalhaut"
	sets.weapons.DualWeapons = {main="Demersal Degen",sub="Atoyac",range="Malison"}--main="Fettering Blade",sub="Blurred Knife +1",range="Fomalhaut"
	sets.weapons.SavageWeapons = {main="Demersal Degen",sub="Atoyac",range="Malison"}--main="Hep. Sapara +1",sub="Blurred Knife +1",range="Ataktos"
	sets.weapons.DualRangedWeapons = {main="Demersal Degen",sub="Atoyac",range="Malison"}--main="Fettering Blade",sub="Kustawi +1"
	sets.weapons.LeadenWeapons = {main="Demersal Degen",sub="Atoyac",range="Malison"}--main="Fettering Blade",sub="Atoyac",range="Fomalhaut"

	
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
		-- Aug.Cape.COR.TP.Derion
		back="Bleating Mantle", waist="Anguinus Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.Acc = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Cacoethic Ring", rring="Ramuh Ring",
		back="Grounded Mantle", waist="Anguinus Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.DW = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Cacoethic Ring", rring="Ramuh Ring",
		back="Grounded Mantle", waist="Anguinus Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

    sets.engaged.DW.Acc = {
		head="Meghanada Visor +1", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +1", lring="Cacoethic Ring", rring="Ramuh Ring",
		back="Grounded Mantle", waist="Anguinus Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
    elseif player.sub_job == 'RNG' then
        set_macro_page(3, 10)
    else
        set_macro_page(1, 10)
    end   
end