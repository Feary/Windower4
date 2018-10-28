-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal', 'Acc', 'HighAcc')
	state.RangedMode:options('Normal', 'Acc', 'HighAcc')
	state.WeaponskillMode:options('Match','Normal','Acc','HighAcc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Default','DualWeapons','DualMagicWeapons')
	
	DefaultAmmo = {['Fomalhaut'] = "Chrono Bullet",['Yoichinyumi']="Yoichi's Arrow",['Armageddon']="Adlivun Bullet"}
	U_Shot_Ammo = {['Fomalhaut'] = "Animkii Bullet",['Yoichinyumi']="Yoichi's Arrow",['Armageddon']="Adlivun Bullet"}
	
	-- Snapshot
	gear.snapshot_jse_back = {name="Belenus's Cape", augments={'"Snapshot"+10',}}	
	-- Ranged TP
	gear.tp_ranger_jse_back = {name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	-- Crit RA TP/ws
	gear.crit_ranger_jse_back = {name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
	-- Last Stand
	gear.ranger_wsd_jse_back = {name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	-- Leaden/Wildfire/Trueflight
	gear.magic_wsd_jse_back = {name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	-- Melee TP
	gear.tp_jse_back = {name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	-- DW
	gear.DW_jse_back = {name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}
	--sets.precast.JA['Eagle Eye Shot'] = {legs="Arcadian Braccae +3"}
	
	-- Fast cast sets for spells
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Taeon Tabard",hands="Leyline Gloves",ring1="Prolix Ring", ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",}) -- body="Passion Jacket"

	-- Ranged sets (snapshot)
	-- Snapshot - Caps at 70 from any source.
	sets.precast.RA = {
		--neck="Scout's Gorget +2"
		head=gear_taeon_head_Snapshot,
		-- Oshosi Vest +1
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head=gear_taeon_head_Snapshot,
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- Adhemar Kecks +1
		back=gear.snapshot_ranger_jse_back, waist="Yemeya Belt", legs="Adhemar Kecks", feet="Meg. Jam. +2"})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head="Arcadian Beret +1",
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- legs="Adhemar Kecks +1", feet="Arcadian Socks +3"
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt", legs="Adhemar Kecks", feet="Pursuer Gaiters"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS.Acc = {
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	-- Bow
	-- Jishnu's Ridiance
	sets.precast.WS['Jishnu\'s Radiance'] = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Sherida Earring",
		-- lring="Begruding Ring" hands="Kobo Kote",
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Mummu Ring", ring2="Ilabrat Ring",
		-- 	
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Darraigner's Brais", feet="Adhe. Gamashes +1"}

	sets.precast.WS['Jishnu\'s Radiance'].Acc = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Sherida Earring",
		-- lring="Begruding Ring" hands="Kobo Kote",
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Mummu Ring", ring2="Ilabrat Ring",
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Darraigner's Brais", feet="Adhe. Gamashes +1"}
		
	-- Namas Arrow			
	sets.precast.WS['Namas Arrow'] = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Adhe. Wrist. +1", lring="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}

	sets.precast.WS['Namas Arrow'].Acc = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Adhe. Wrist. +1", lring="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}

	-- Gun
	-- Last Stand
	sets.precast.RA['Last Stand'] = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", lring="Rajas Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	sets.precast.RA['Last Stand'].Acc = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", lring="Hajduk Ring", rring="Hajduk Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	-- Coronach
	sets.precast.RA['Coronach'] = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", lring="Rajas Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	sets.precast.RA['Coronach'].Acc = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
		body="Mummu Jacket +2", hands="Meg. Gloves +2", lring="Hajduk Ring", rring="Hajduk Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

	-- Wildfire
    sets.precast.WS['Wildfire'] = {
       -- Herc Helm AGI/Mab/wsd Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Ilabrat Ring",
		-- Eschan Stone Herc Trousers AGI/Macc/MAB Lanun Bottes +3
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Meg. Chausses +2", feet="Lanun Bottes +1"}
    sets.precast.WS['Wildfire'].Acc = {		
		-- Herc Helm AGI/Mab/wsd Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
		-- Lanun Frac +3 herc gloves agi/mab/wsd 
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Ilabrat Ring",
		-- Eschan Stone Herc Trousers AGI/Macc/MAB Herculean Boots macc/mab
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Meg. Chausses +2", feet="Lanun Bottes +1"}
	-- Crossbow
	-- Trueflight
    sets.precast.WS['Trueflight'] = {
		-- neck="Scout's Gorget +2" baetyl pendant
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Carmine Mail +1",hands="Carmine Fin. Ga. +1",lring="Dingir Ring", rring="Garuda Ring +1",
        back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhe. Gamashes +1"}

    sets.precast.WS['Trueflight'].Acc = {
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhe. Gamashes +1"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Telos Earring",ear2="Enervating Earring",}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
       
	-- Ranged sets	
	-- Everything else
	sets.midcast.RA = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Sherida Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Acc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Yoichinyumi = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
		-- feet="Orion Socks +1",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Yoichinyumi.Acc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Yoichinyumi.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" 
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}	

	sets.midcast.RA.Yoichinyumi.AM = {
       -- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Gandiva = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Gandiva.Acc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Gandiva.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Annihilator = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Annihilator.Acc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	 sets.midcast.RA.Annihilator.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Fomalhaut  = {
		-- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Sherida Earring",
		-- body="Oshosi Vest +1", lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Fomalhaut.Acc = {
        -- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" 
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Fomalhaut.HighAcc = {
        -- head="Arcadian Beret +3",
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.buff['Double Shot'] = {back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {}
	
	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers +1"})
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
    
	-- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +1",feet="Meg. Jam. +2"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +1",feet="Meg. Jam. +2"}
    
    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +1",feet="Meg. Jam. +2"}
    
    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +1",feet="Meg. Jam. +2"}
    
	sets.Kiting = {feet="Jute Boots +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapon Sets
	sets.weapons.Default = {main="Perun +1",sub="Nusku Shield",range="Yoichinyumi",ammo="Yoichi's Arrow"}
	sets.weapons.SingleWeapon = {main="Perun +1",sub="Nusku Shield",range="Yoichinyumi",ammo="Yoichi's Arrow"}
	sets.weapons.DualWeapons =  {main="Perun +1",sub="Nusku Shield",range="Yoichinyumi",ammo="Yoichi's Arrow"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence",range="Fomalhaut",ammo="Eminent Bullet"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Dynamic Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.Acc = {
		head="Meghanada Visor +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back=gear.tp_jse_back, waist="Dynamic Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.DW = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- Floral Gauntlets
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW.Acc = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		--  Floral Gauntlets
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 13)
end
