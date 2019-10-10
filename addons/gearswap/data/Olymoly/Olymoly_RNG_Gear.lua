-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal', 'Acc', 'HighAcc')
	state.RangedMode:options('Normal', 'Acc', 'HighAcc')
	state.WeaponskillMode:options('Match','Normal','Acc','HighAcc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Default','DualWeapons','DualMagicWeapons')
	
	DefaultAmmo = {['Fomalhaut'] = "Chrono Bullet", ['Yoichinoyumi']="Yoichi's Arrow", ['Armageddon']="Eminent Bullet",}
	U_Shot_Ammo = {['Fomalhaut'] = "Animkii Bullet", ['Yoichinoyumi']="Yoichi's Arrow", ['Armageddon']="Eminent Bullet",}
	ranged_Bow = T{"Yoichinoyumi", "Gandiva",}
	ranged_Gun = T{"Annihilator", "Holliday", "Armageddon", "Fomalhaut", "Gastraphetes"}
	
	-- Snapshot
	gear.snapshot_jse_back = {name="Belenus's Cape", augments={'"Snapshot"+10',}}	
	-- Ranged TP
	gear.tp_ranger_jse_back = {name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Damage taken-5%',}}
	-- --Crit RA TP/ws
	gear.crit_ranger_jse_back = {name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	-- Last Stand
	gear.ranger_wsd_jse_back = {name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	-- Leaden/Wildfire/Trueflight
	gear.magic_wsd_jse_back = {name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	-- -- Melee TP
	gear.tp_jse_back = {name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	-- DW
	gear.DW_jse_back = {name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	
	-- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	send_command('alias gear exec gearrng.txt')
	send_command('alias ungear gs equip naked;exec ungearrng.txt')
	
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
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +2"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +2"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}
	sets.precast.JA['Eagle Eye Shot'] = {legs="Arcadian Braccae +2"}
	
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
		-- Orion Braccae +3
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head=gear_taeon_head_Snapshot,
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- legs="Path D"
		back=gear.snapshot_ranger_jse_back, waist="Yemaya Belt", legs="Adhemar Kecks", feet="Meg. Jam. +2"})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head="Arcadian Beret +2",
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- legs="Path D", feet="Arcadian Socks +3"
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt", legs="Adhemar Kecks", feet="Pursuer's Gaiters"})

	sets.precast.RA.Gastraphetes = {
		--neck="Scout's Gorget +2"
		head=gear_taeon_head_Snapshot,
		-- Oshosi Vest +1
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- Orion Braccae +3
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Gastraphetes.Flurry = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head=gear_taeon_head_Snapshot,
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- Adhemar Kecks +1
		back=gear.snapshot_ranger_jse_back, waist="Yemaya Belt", legs="Adhemar Kecks", feet="Meg. Jam. +2"})
	
	sets.precast.RA.Gastraphetes.Flurry2 = set_combine(sets.precast.RA, {
		-- head="Orion Beret +3", neck="Scout's Gorget +2"
		head="Arcadian Beret +2",
		body="Amini Caban +1", hands="Carmine Fin. Ga. +1",
		-- legs="Adhemar Kecks +1", feet="Arcadian Socks +3"
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt", legs="Adhemar Kecks", feet="Pursuer's Gaiters"})

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
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Regal Ring", ring2="Begrudging Ring",
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Darraigner's Brais", feet="Adhe. Gamashes +1"}

	sets.precast.WS['Jishnu\'s Radiance'].Acc = {
		-- Orion Beret +3
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Mummu Ring", ring2="Ilabrat Ring",
		-- feet="Oshosi Leggings +1"
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}
	
	-- Goal 1900 Acc
	sets.precast.WS['Jishnu\'s Radiance'].HighAcc = {
		-- Head="Orion Beret +3"
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Telos Earring", rear="Enervating Earring",
		-- body="Orion Jerkin +3", hands="Adhemar Wrist. +1", Path C lring"Cacoethic Ring +1"
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Mummu Ring", ring2="Regal Ring",
		-- wais="K. Kachina Belt +1" feet="Orion Socks +3"
		back=gear.crit_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}
	
	-- Namas Arrow			
	sets.precast.WS['Namas Arrow'] = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}

	sets.precast.WS['Namas Arrow'].Acc = {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Adhemar Kecks +1", feet="Adhe. Gamashes +1"}

	-- Gun
	-- Last Stand
	sets.precast.RA['Last Stand'] = {
		-- Orion Beret +3 Scout's Gorget +2
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", ring2="Epaminondas's Ring",
		-- Arc. Braccae +3 Herc. Boots AGI/Ratk/WSD
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	sets.precast.RA['Last Stand'].Acc = {
		-- Orion Beret +3 Scout's Gorget +2
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", ring2="Epaminondas's Ring",
		-- Arc. Braccae +3 Herc. Boots AGI/Ratk/WSD
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	-- Coronach
	sets.precast.RA['Coronach'] = {
		-- Orion Beret +3 Scout's Neck +2
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Ishvara Earring", rear="Sherida Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", ring2="Epaminondas's Ring",
		-- Arc. Braccae +3 Herc. Boots AGI/Ratk/WSD
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	sets.precast.RA['Coronach'].Acc = {
		-- Orion Beret +3 Scout's Neck +2
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Ishvara Earring", rear="Sherida Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", ring2="Epaminondas's Ring",
		-- Arc. Braccae +3 Herc. Boots AGI/Ratk/WSD
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

	-- Wildfire
    sets.precast.WS['Wildfire'] = {
		-- Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		back=gear.magic_wsd_jse7_back, waist="Eschan Stone", legs=gear_herculean_nuke_legs, feet=gear_herculean_nuke_feet}
    sets.precast.WS['Wildfire'].Acc = {		
		-- Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear_herculean_nuke_legs, feet=gear_herculean_nuke_feet}

	-- Crossbow
	-- Trueflight
    sets.precast.WS['Trueflight'] = {
		-- Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- feet=gear_herculean_nuke_feet
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear_herculean_nuke_legs, feet="Orion Socks +2"}

    sets.precast.WS['Trueflight'].Acc = {
        -- Baetyl Necklace
		head=gear_herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- feet=gear_herculean_nuke_feet
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs=gear_herculean_nuke_legs, feet="Orion Socks +2"}

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
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Sherida Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Acc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Yoichinoyumi = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
		-- feet="Orion Socks +2",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Yoichinoyumi.Acc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Yoichinoyumi.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" 
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}	

	sets.midcast.RA.Yoichinoyumi.AM = {
       -- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Gandiva = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Gandiva.Acc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Gandiva.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Annihilator = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Annihilator.Acc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	 sets.midcast.RA.Annihilator.HighAcc = {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.midcast.RA.Fomalhaut  = {
		-- head="Arcadian Beret +3",
       head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Sherida Earring",
		-- body="Oshosi Vest +1", lring="Chirich Ring +1",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

    sets.midcast.RA.Fomalhaut.Acc = {
        -- head="Arcadian Beret +3",
		head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" 
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
	sets.midcast.RA.Fomalhaut.HighAcc = {
		head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3"
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1", ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.buff['Double Shot'] = {body="Arc. Jerkin +3", back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {body="Arc. Jerkin +3", back=gear.tp_ranger_jse_back}
	
	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {
		-- head="Arcadian Beret +3",
        head="Arcadian Beret +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- body="Orion Jerkin +3" Orion Bracers +3 rring="Caooethic Ring +1",
        body="Meg. Cuirie +2",hands="Orion Bracers +2", ring1="Regal Ring",ring2="Ilabrat Ring",
		-- Orion Socks +3
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"})
	
	sets.buff.Camouflage = {body="Orion Jerkin +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",}--hands="Buremte Gloves", waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",}--hands="Buremte Gloves", waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
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
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}
    
    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}
    
    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Volte Bracers",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meg. Jam. +2"}
    
	sets.Kiting = {feet="Jute Boots +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapon Sets
	-- Shooting
	sets.weapons.Default = {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
	sets.weapons.SingleWeapon = {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
	sets.weapons.DualWeapons =  {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence",range="Armageddon",ammo="Eminent Bullet"}
	-- Melee
	sets.weapons.SingleMelee= {main="Naegling",sub="Nusku Shield",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
	sets.weapons.DualMelee =  {main="Naegling",sub="Kaja Knife",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		-- neck="Combatant's Necklace", 
		head="Meghanada Visor +2", neck="Erudit. Necklace",  lear="Brutal Earring", rear="Suppanomimi",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Tempus Fugit", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.Acc = {
		-- neck="Combatant's Necklace", 
		head="Meghanada Visor +2", neck="Erudit. Necklace",  lear="Brutal Earring", rear="Suppanomimi",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Ilabrat Ring",
		back=gear.tp_jse_back, waist="Tempus Fugit", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.DW = {
		-- neck="Combatant's Necklace", 
		head="Meghanada Visor +2", neck="Erudit. Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- Floral Gauntlets
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Tempus Fugit", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW.Acc = {
		-- neck="Combatant's Necklace", 
		head="Meghanada Visor +2", neck="Erudit. Necklace", lear="Brutal Earring", rear="Suppanomimi",
		--  Floral Gauntlets
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ilabrat Ring",
		back=gear.DW_jse_back, waist="Tempus Fugit", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if ranged_Bow:contains(player.equipment.range) then
		if player.sub_job == 'NIN' then
			set_macro_page(1,13)
		elseif player.sub_job == 'SAM' then
			set_macro_page(2,13)
		elseif player.sub_job == 'WAR' then
			set_macro_page(3,13)
		elseif player.sub_job == 'DRG' then 
			set_macro_page(4,13)
		else
			set_macro_page(3,13)
		end
	elseif ranged_Gun:contains(player.equipment.range) then
		if player.sub_job == 'NIN' then
			set_macro_page(5,13)
		elseif player.sub_job == 'SAM' then
			set_macro_page(6,13)
		elseif player.sub_job == 'WAR' then
			set_macro_page(7,13)
		elseif player.sub_job == 'DRG' then 
			set_macro_page(8,13)
		else
			set_macro_page(7,13)
		end
	end
end
