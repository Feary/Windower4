-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc', 'Crit', 'STP')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	state.CompensatorMode:options('300','1000','Never','Always')
	
    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet" -- Chrono Bullet  Divine Bullet
    gear.MAbullet = "Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet" -- Living Bullet  Omphalous Bullet 
    options.ammo_warning_limit = 15


	gear.snapshot_jse_back = {		name="Camulus's Mantle", augments={'"Snapshot"+10',}}	
	gear.ranger_wsd_jse_back = {	name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {		name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.DW_jse_back = {			name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Damage taken-5%',}}
	gear.tp_ranger_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}}
	gear.magic_wsd_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.tp_jse_back = {			name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.crit_ranger_jse_back = {	name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Damage taken-5%',}}
	gear.magic_QD_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Store TP"+10',}}
	gear.FC_jse_back = {			name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Store TP"+10',}}
	
	send_command('alias das send Dasmir /targetnpc;wait 1;send Dasmir Horde Lullaby;wait 1;send dasmir /follow olymoly')

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
function init_gear.sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs	
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
    sets.precast.CorsairRoll = {
        head="Lanun Tricorne +1", neck="Regal Necklace", ear1="Odnowa Earring +1", ear2="Etiolation Earring",
        -- DT
		body="Meg. Cuirie +2",hands="Chasseur's Gants +1",ring1="Dark Ring",ring2="Defending Ring",
		-- DTfeet
        back=gear.tp_jse_back,waist="Flume Belt",legs="Desultor Tassets",feet="Meg. Jam. +2"}
		
    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		-- Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Lanun Frac +3  Fenrir Ring +1
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Shiva Ring +1",
		-- Heculean Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Adhe. Gamashes +1"}
	
		--  Dedition Earring
	sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		head="Blood Mask", neck="Iskur Gorget", lear="Tripudio Earring", rear="Telos Earring",
		-- Oshosi Vest +1 Schutzen Mittens Chirich Ring +1 Chirich Ring +1
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Sweordfaetels +1
		back=gear.magic_QD_jse_back, waist="Goading Belt", legs="Chas. Culottes +1", feet="Carmine Greaves +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- Laksa. Tricone +3 Comm. Charm +2  
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Digni. Earring", rear="Gwati Earring",
		-- Laksa. Gants +3 
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Regal Ring", rring="Stikini Ring",
		-- Laksa. Bottes +3
		back=gear.magic_QD_jse_back, waist="Kwahu Kachina Belt", legs="Mummu Kecks +2", feet="Mummu Gamash. +2"}
	
	-- Proc AF3 Feet for Damage Bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Fire Shot'], {feet="Chass. Bottes +1"})
	
	-- Less damage
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
        -- Baetyl Pendant
		head="Blood Mask", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1
		body="Carm. Sc. Mail +1", hands="Leyline Gloves", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs="Mummu Kecks +2", feet="Adhe. Gamashes +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Dashing Subligar",feet="Carmine Greaves +1"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"} --body="Passion Jacket",
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		-- neck="Baetyl Pendant"
        head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Taeon Tabard",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
		-- Herc FC
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

	-- Snapshot
    sets.precast.RA = {ammo=gear.RAbullet,
		-- neck="Comm. Charm +2"
        head=gear.taeon_head_Snapshot,
		body="Lak. Frac +1", hands="Carmine Fin. Ga. +1",
		-- Laksa. Trews +3
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2"
        head=gear.taeon_head_Snapshot,
		body="Lak. Frac +1", hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2"
        head="Chass. Tricorne +1",
        --body="Laksa. Frac +3",
		hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Pursuer's Gaiters"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	-- Melee
    sets.precast.WS = {
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
    sets.precast.WS.Acc = {
        head="Meghanada Visor +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Telos Earring",
		body="Meg. Cuirie +2",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}		
		
    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Cessance Earring",
		body="Mummu Jacket +2", hands="Floral Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Mummu Gamash. +2"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Regal Ring", rring="Rufescent Ring",
		back=gear.str_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet=gear.herculean_ta_feet})
				
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		-- Herc Helm STR/Acc/WSD 
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		-- Laksa. Frac +3 
        body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Shukuyu Ring",
		-- Herc Trousers STR/ACC/WSD feet="Lanun Bottes +3"
        back=gear.str_wsd_jse_back,waist="Prosilio Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Telos Earring",
		-- Laksa. Frac +3
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",lring="Regal Ring", rring="Shukuyu Ring",
		-- Herc Trousers STR/ACC/WSD Lanun Bottes +3
        back=gear.str_wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
	sets.precast.WS['Swift Blade'] = {ammo=gear.WSbullet,
		-- Herc Helm STR/Acc/WSD 
        head="Adhemar Bonnet", neck="Fotia Gorget",ear1="Brutal Earring",ear2="Telos Earring",
        body="Adhemar Jacket +1", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epona's Ring",
		-- Herc Trousers STR/ACC/WSD Lanun Bottes +3
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS['Swift Blade'].Acc = {ammo=gear.WSbullet,
		-- Herc Helm STR/Acc/WSD 
        head="Meghanada Visor +2", neck="Fotia Gorget",ear1="Brutal Earring",ear2="Telos Earring",
        body="Adhemar Jacket +1", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epona's Ring",
		-- Herc Trousers STR/ACC/WSD Lanun Bottes +3
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.precast.WS['Evisceration'] = {
		-- Mache Earring +1
        head="Adhemar Bonnet",neck="Fotia Belt",ear1="Moonshade Earring",ear2="Telos Earring",       
		body="Abnoba Kaftan",hands="Mummu Wrists +2", ring1="Epaminondas's Ring", ring2="Regal Ring",
		-- herc Trousers dex acc/crit
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}		
		
    sets.precast.WS['Evisceration'].Acc = {
		-- Mache Earring +1 
        head="Mummu Bonnet +2", neck="Sanctity Necklace", ear1="Moonshade Earring",ear2="Telos Earring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", ring1="Epaminondas's Ring", ring2="Regal Ring",
		-- herc Trousers dex acc/crit
        back=gear.tp_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Mummu Gamash. +2"}		
	
	sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
		-- Herc Helm AGI/Mab/wsd 
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Ilabrat Ring",
		-- Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

	sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
		-- Herc Helm AGI/Mab/wsd Baetyl Necklace
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Shiva Ring +1",
		--  Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

	-- Ranged WS
	-- Last Stand
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- Lanun Tricorne +3 
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        -- Laksa. Frac +3 
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dingir Ring",ring2="Ilabrat Ring",
        -- Herc Trousers agi/rattk/racc/wsd Lanun Boots +3
		back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
      	-- Lanun Tricorne +3 
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        -- Laksa. Frac +3 
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dingir Ring",ring2="Ilabrat Ring",
        -- Herc Trousers agi/rattk/racc/wsd Lanun Boots +3
		back=gear.ranger_wsd_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

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
		-- Baetyl Necklace
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring",  rring="Archon Ring",
		-- Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
        -- Hermetic Earring
		head="Pixie Hairpin +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Archon Ring",
		-- Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		-- Herc Helm AGI/Mab/wsd Baetyl Necklace
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Ilabrat Ring",
		--  Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		-- Herc Helm AGI/Mab/wsd Sanctity Necklace Hermetic Earring
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd  
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Ilabrat Ring",
		-- Eschan Stone Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +1"}

    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
	--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Enervating Earring",ear2="Telos Earring"}
	sets.AccMaxTP = {ear1="Enervating Earring",ear2="Telos Earring"}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
    
	-- Specific spells
	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Odnowa Earring +1", ear2="Enchntr. Earring +1",
        body="Meg. Cuirie +2",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",}--hands="Buremte Gloves",waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",}--hands="Buremte Gloves",waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1 Path C 
        body="Mummu Jacket +2", hands="Adhemar Wristbands",ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Laksa. Frac +3",
        body="Mummu Jacket +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1" legs="Laksa. Trews +3",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
	
    sets.midcast.RA.Crit = {ammo=gear.RAbullet, 
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1" Path C 
        body="Mummu Jacket +2", hands="Mummu Wrists +2",ring1="Mummu Ring", rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.STP = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",rear="Dedition Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1 Path C lring="Chirich Ring +1", 
        body="Mummu Jacket +2", hands="Adhemar Wristbands",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Armageddon = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1 Path C 
        body="Mummu Jacket +2", hands="Adhemar Wristbands",lring="Dingir Ring", ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}
	
    sets.midcast.RA.Armageddon.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Laksa. Frac +3",
        body="Mummu Jacket +2", hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1" legs="Laksa. Trews +3",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Armageddon.Crit = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", Path C 
        body="Mummu Jacket +2", hands="Mummu Wrists +2",ring1="Mummu Ring",rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Armageddon.STP = {ammo=gear.RAbullet,
		--rear="Dedition Earring",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1" Path C lring="Chirich Ring +1", 
        body="Mummu Jacket +2", hands="Adhemar Wrist. +1" ,ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}
		
	sets.midcast.RA.Fomalhaut = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1" Path C 
        body="Mummu Jacket +2", hands="Adhemar Wristbands",ring1="Dingir Ring", ring2="Ilabrat Ring", 
        back=gear.tp_ranger_jse_back, waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
    sets.midcast.RA.Fomalhaut.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Laksa. Frac +3", 
        body="Mummu Jacket +2", hands="Meg. Gloves +2",lring="Regal Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1" legs="Laksa. Trews +3",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Fomalhaut.Crit = {ammo=gear.RAbullet, 
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Nisroch Jerkin", Path C 
        body="Mummu Jacket +2", hands="Mummu Wrists +2",ring1="Mummu Ring", rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Meg. Jam. +2"}
		
	sets.midcast.RA.Fomalhaut.STP = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",rear="Dedition Earring",
		-- body="Nisroch Jerkin", hands="Adhemar Wrist. +1 Path C lring="Chirich Ring +1", 
        body="Mummu Jacket +2", hands="Adhemar Wristbands",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back, waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.buff['Triple Shot'] = {
		--head="Oshosi Mask +1",
		body="Chasseur's Frac +1", hands="Lanun Gants +1",
		--legs="Osh. Trousers +1", feet="Osh. Leggings +1"
		}
    
    -- Sets to return to when not performing an action.
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring", rear="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
		head="Rawhide Mask", neck="Loricate Torque +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Mekosu. Harness",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
		--legs="Rawhide Trousers",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Genmei Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	-- hands="Floral Gauntlets",
	sets.DWMax = {body="Adhemar Jacket +1", waist="Reiki Yotai", ear1="Dudgeon Earring", ear2="Heartseeker Earring"}
	
	--Weapon Sets
	--'Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	-- Fencer Last Stand Rostam
	sets.weapons.Default = {main="Kustawi +1",sub="Nusku Shield",range="Molybdosis"}--range="Fomalhaut"
	-- Last Stand Dual Ranged
	sets.weapons.DualRangedWeapons = {main="Kustawi +1",sub="Kaja Knife",range="Molybdosis"}
	-- Fencer Savage 
	sets.weapons.SavageWeapons = {main="Naegling",sub="Nusku Shield", range="Molybdosis"}--range="Ataktos"
	-- DW Savage
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Molybdosis"}--range="Ataktos"
	-- Leaden/Wildfire  Rostam Path A
	sets.weapons.LeadenWeapons = {main="Naegling",sub="Kaja Knife",range="Molybdosis"}--range="Fomalhaut"
	-- Rolling
	sets.weapons.RollMeleeWeapons = {main="Naegling",sub="Blurred Knife +1",range="Compensator"}
	sets.weapons.RollRangedWeapons = {main="Kustawi +1",sub="Nusku Shield", range="Compensator"}

    -- Engaged sets
	
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Brutal Earring", rear="Cessance Earring",
		-- Herculean Vest TA
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

    sets.engaged.Acc = {
		-- neck="Combatant's Torque", lear="Mache Earring +1",
		head="Adhemar Bonnet +1", neck="Iskur Gorget",lear="Digni. Earring", rear="Telos Earring",
		-- Herculean Vest TA
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

    sets.engaged.DW = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Suppanomimi", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

    sets.engaged.DW.Acc = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Suppanomimi", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

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