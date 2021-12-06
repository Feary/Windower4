-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib.lua') 
	
end
packets = require('packets')


-- Setup vars that are user-independent.
function job_setup()
    -- Table of entries
    rune_timers = T{300, 600, 900}
    -- entry = rune, index, expires
    
    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('TP', 'DTParry', 'Hybrid', 'MEva', 'TPSamroll')
    state.WeaponskillMode:options('Normal', 'Acc', 'DT', 'CappedAttack')
    state.PhysicalDefenseMode:options('DT', 'Resist')
    state.IdleMode:options('HPDT','VITDefense', 'Refresh', 'Duration', 'Phalanx')
	state.CastingMode:options('Normal', 'Macc')
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
	select_default_macro_book(1,20)
			
	send_command ('bind numpad9 send @all input /follow Shiraj')	
	send_command ('bind numpad7 input //gfra')	
	send_command ('bind numpad4 input //ifury')	
	send_command ('bind numpad3 input lullaby')	
	send_command ('bind numpad1 input finale')	
	send_command ('bind numpad5 input /tell Nurzejoy dia')	

end


function init_gear_sets()
    sets.enmity = {
		ammo="Sapience Orb",
		head={name="Halitus Helm", priority=2},
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Ahosi Leggings",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		right_ear="Odnowa Earring +1",
		left_ear={name="Cryptic Earring", priority=1},
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=3},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, 
	}
	
	
	sets.Phalanx = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Herculean Vest", augments={'MND+2','Pet: INT+4','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		hands={ name="Herculean Gloves", augments={'Rng.Acc.+21','Pet: "Subtle Blow"+4','Phalanx +5','Accuracy+10 Attack+10',}},
		legs={ name="Herculean Trousers", augments={'Pet: DEX+3','Pet: INT+6','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
	
	sets.MEva = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={name="Moonlight Cape", priority=3}}
	
	sets.EnhancingSkill = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +1",
		body="Vrikodara Jupon",
		hands="Runeist's Mitons +3",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		feet="Meg. Jam. +2",
		neck="Enhancing Torque",
		waist="Cascade Belt",
		left_ear={name="Etiolation Earring", priority=2},
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={name="Moonlight Cape", priority=3}}
	
	sets.Warp = {
	ring1="Warp Ring"}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body="Runeist's Coat +3",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Ahosi Leggings",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		left_ear="Genmei Earring",
		right_ear="Cryptic Earring",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=3},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.precast.JA['Valiance'] = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body="Runeist's Coat +3",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Ahosi Leggings",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		left_ear="Genmei Earring",
		right_ear="Cryptic Earring",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=3},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
				
    sets.precast.JA['Pflug'] = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body="Runeist's Coat +3",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Runeist's Boots +3",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		left_ear="Genmei Earring",
		right_ear="Cryptic Earring",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
			
    sets.precast.JA['Battuta'] = {
		head="Futhark Bandeau +3"}
	
    sets.precast.JA['Liement'] = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Ahosi Leggings",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		left_ear="Genmei Earring",
		right_ear="Cryptic Earring",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
    sets.precast.JA['Lunge'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Phys. dmg. taken -2%','Mag. Acc.+6',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+11','"Dual Wield"+2',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+1','AGI+6','Mag. Acc.+15',}},
		feet={ name="Herculean Boots", augments={'"Resist Silence"+11','Accuracy+2','Magic burst dmg.+15%','Accuracy+12 Attack+12','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Mujin Band",
		right_ring="Locus Ring",
		back={ name="Ogma's cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
		
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	
    sets.precast.JA['Gambit'] = set_combine(sets.enmity, {
		hands="Runeist's Mitons +3"})
	
	
    sets.precast.JA['Rayke'] = set_combine (sets.enmity,  {
		feet="Futhark Boots +3"})
	
    sets.precast.JA['Elemental Sforzo'] = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Ahosi Leggings",
		neck="Futhark Torque +2",
		waist="Trance Belt",
		left_ear="Genmei Earring",
		right_ear="Cryptic Earring",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.precast.JA['Swordplay'] = {hands="Futhark Mitons +3"}
	
    sets.precast.JA['Embolden'] = {back="Evasionist's Cape"}
	
     sets.precast.JA['Vivacious Pulse'] = set_combine(sets.enmity, {
		head="Erilaz Galea +1", 
		legs="Runeist's Trousers +3",
		back={name="Moonlight Cape", priority=3},
		ring1="Defending Ring", 
		ring2={name="Moonlight Ring", priority=2},})
		
    sets.precast.JA['One for All'] = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +1",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Eschan Stone",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Gelatinous Ring +1",
		ring2={name="Moonlight Ring", priority=2},
		back={name="Moonlight Cape", priority=1},}
	
	sets.precast.JA['Odyllic Subterfuge'] = sets.enmity
	
    sets.precast.JA['Provoke'] = sets.enmity
	
	sets.precast.JA['Souleater'] = sets.enmity
	
    sets.precast.JA['Last Resort'] = sets.enmity

	-- Fast cast sets for spells
    sets.precast.FC = {
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},
		ammo="Sapience Orb",
        head="Runeist Bandeau +3", 
		neck="Futhark Torque +2", 
		ear1="Etiolation Earring", 
		ear2="Loquacious Earring",
		body="Vrikodara Jupon",
		hands="Leyline Gloves", 
		ring1="Weatherspoon Ring", 
		waist="Flume Belt", 
		legs="Futhark Trousers +3", 
		feet="Carmine Greaves"}
		
			-- Fast Cast: 58% / -15% Enhancing Magic Casting Time / 30% Inspiration
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},
		waist="Siegel Sash", 
		head="Erilaz Galea +1",
		legs="Futhark Trousers +3"})
	
	
	sets.precast.JA['Arcane Circle'] = sets.enmity
		
		
		


	-- Weaponskill sets
    sets.precast.WS['Resolution'] = {
		ammo="Seething Bomblet",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
    sets.precast.WS['Resolution'].DT = {
		ammo="Seething Bomblet",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
		
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, 
        {ammo="Yamarang",
		head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},})
		
	sets.precast.WS['Resolution'].CappedAttack = set_combine(sets.precast.WS['Resolution'].Normal, {
	    ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}})

	
    sets.precast.WS['Dimidiation'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Pet: DEX+5','"Dbl.Atk."+3','Weapon skill damage +7%','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'].Normal, {
		ammo="Yamarang",
		head="Rune. Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs="Rune. Trousers +3",
		feet="Runeist's Boots +3",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},})
		
	sets.precast.WS['Dimidiation'].DT = set_combine(sets.precast.WS['Dimidiation'].Normal, {
	    head="Meghanada Visor +2",
		neck="Futhark Torque +2",
		body="Futhark Coat +3",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet="Meg. Jam +2",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},})
		
    sets.precast.WS['Herculean Slash'] = {
		ammo="Seething Bomblet",
		head={ name="Herculean Helm", augments={'"Store TP"+1','Spell interruption rate down -8%','Damage taken-2%','Accuracy+9 Attack+9','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		body={ name="Herculean Vest", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+4%','STR+7',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst 	dmg.+1%',}},	
		feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +5%','MND+5','Mag. Acc.+12',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ogma's cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
		
	sets.precast.WS['Shockwave'] = {
		ammo="Pemphredo Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands={ name="Futhark Mitons +3", augments={'Enhances "Sleight of Sword" effect',}},
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet={ name="Futhark Boots +3", augments={'Enhances "Rayke" effect',}},
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Gwati Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ogma's cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
		
	sets.precast.WS['Swift Blade'] = {
		ammo="Seething Bomblet",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Savage Blade'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
	
	sets.precast.WS['Sanguine Blade'] = {
		ammo="Seething Bomblet",
		head={ name="Herculean Helm", augments={'"Store TP"+1','Spell interruption rate down -8%','Damage taken-2%','Accuracy+9 Attack+9','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		body={ name="Herculean Vest", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+4%','STR+7',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst 	dmg.+1%',}},	
		feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +5%','MND+5','Mag. Acc.+12',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ogma's cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
		
    sets.precast.WS['Requiescat'] = {
		ammo="Seething Bomblet +1",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget", 
		ear1="Telos Earring", 
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="Meghanada Gloves +2",
		ring1="Rufescent Ring",
		ring2="Leviathan Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		legs="Meghanada Chausses +2",
		feet="Runeist's Boots +3"}
		
    sets.precast.WS['Ground Strike'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
		sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS['Ground Strike'].Normal, {
		ammo="Yamarang",
		head="Rune. Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs="Rune. Trousers +3",
		feet="Runeist's Boots +3",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
		
		sets.precast.WS['Decimation'] = {
		ammo="Seething Bomblet",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Meg. Chausses +2",
				feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Rampage'] = {
		ammo="Seething Bomblet",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},		
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Fell Cleave'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Judgment'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Upheaval'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['True Strike'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
	
	
	sets.precast.WS['Steel Cyclone'] = {
		ammo="Knobkierrie",
		head={ name="Herculean Helm", augments={'Accuracy+4 Attack+4','Weapon skill damage +3%','STR+2','Accuracy+12',}},
		body={ name="Herculean Vest", augments={'Rng.Atk.+14','Pet: Haste+2','Weapon skill damage +8%','Accuracy+5 Attack+5',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Caro Necklace",
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
		head="Erilaz Galea +1", 
		ear1="Etiolation Earring", 
		ear2="Odnowa Earring +1", 
		hands="Kurys Gloves", 
		body="Futhark Coat +3",
	    neck="Futhark Torque +2", 
		waist="Flume Belt", 
		legs="Futhark Trousers +3", 
		feet="Erilaz Greaves +1", 
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},
		ring1="Defending Ring"}
		
		
    sets.midcast['Phalanx'] =  {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Herculean Vest", augments={'MND+2','Pet: INT+4','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		hands={ name="Herculean Gloves", augments={'Rng.Acc.+21','Pet: "Subtle Blow"+4','Phalanx +5','Accuracy+10 Attack+10',}},
		legs={ name="Herculean Trousers", augments={'Pet: DEX+3','Pet: INT+6','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
    
	sets.midcast['Regen IV'] = {
		head="Runeist's Bandeau +3", 
		body="Futhark Coat +3",
		legs="Futhark Trousers +3", 
		hands="Kurys Gloves",
		neck="Sacro Gorget"
		}
    
	sets.midcast['Stoneskin'] = {
		head="Runeist's Bandeau +3", 
		body="Futhark Coat +3",
		legs="Futhark Trousers +3", 
		hands="Kurys Gloves",
		neck="Futhark Torque +2",
		waist="Siegel Sash"}
	
	sets.midcast['Flash'] = sets.enmity
	
	sets.midcast['Stun'] = sets.enmity
	
	sets.midcast['Stun'].Macc = sets.midcast['Blind']	
	
	sets.midcast['Foil'] = set_combine(sets.enmity, {
		head="Erilaz Galea +1",
		legs="Futhark Trousers +3"})
		
	sets.midcast['Blind'] = {
		ammo="Pemphredo Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands={ name="Futhark Mitons +3", augments={'Enhances "Sleight of Sword" effect',}},
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet={ name="Futhark Boots +3", augments={'Enhances "Rayke" effect',}},
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Gwati Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Ogma's cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}

		
	
	sets.midcast['Refresh'] = {
		body="Futhark Coat +3",
		head="Erilaz Galea +1", 
		legs="Futhark Trousers +3", 
		hands="Kurys Gloves",
		waist="Gishdubar Sash"}
    
	sets.midcast['Temper'] = {
		head="Erilaz Galea +1",
		body="Vrikodara Jupon",
		hands="Runeist's Mitons +3",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		feet="Meg. Jam. +2",
		neck="Enhancing Torque",
		waist="Cascade Belt",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={name="Moonlight Cape", priority=1},}
		
		sets.midcast['Barfire'] = sets.EnhancingSkill
		
		sets.midcast['Barblizzard'] = sets.EnhancingSkill
		
		sets.midcast['Baraero'] = sets.EnhancingSkill
		
		sets.midcast['Barstone'] = sets.EnhancingSkill
		
		sets.midcast['Barthunder'] = sets.EnhancingSkill
		
		sets.midcast['Barwater'] = sets.EnhancingSkill
		
		sets.midcast['Barpoison'] = sets.EnhancingSkill
		
		sets.midcast['Barparalyze'] = sets.EnhancingSkill
		
		sets.midcast['Barsleep'] = sets.EnhancingSkill
		
		sets.midcast['Baramnesia'] = sets.EnhancingSkill
		
		sets.midcast['Barblind'] = sets.EnhancingSkill
		
		sets.midcast['Barpetrify'] = sets.EnhancingSkill
		
		sets.midcast['Barvirus'] = sets.EnhancingSkill
		
		sets.midcast['Barsilence'] = sets.EnhancingSkill
		
	sets.midcast['Poisonga'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck={name="Futhark Torque +2", priority=3},
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','DEF+50',}},}
		
	sets.midcast['Utsusemi: Ichi'] = {
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}

			
	sets.midcast['Utsusemi: Ni'] = {
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
		
    sets.midcast['Cure'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body="Vrikodara Jupon",
		hands="Weath. Cuffs +1",
		legs="Eri. Leg Guards +1",
		feet="Skaoi Boots",
		neck="Sacro Gorget",
		waist="Korin Obi",
		left_ear="Mendi. Earring",
		right_ear={name="Odnowa Earring +1", priority=3},
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}},}
	
	sets.midcast['Wild Carrot'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body="Vrikodara Jupon",
		hands="Weath. Cuffs +1",
		legs="Eri. Leg Guards +1",
		feet="Skaoi Boots",
		neck="Sacro Gorget",
		waist="Korin Obi",
		left_ear="Mendi. Earring",
		right_ear={name="Odnowa Earring +1", priority=3},
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}},}
	
	sets.midcast['Healing Breeze'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body="Vrikodara Jupon",
		hands="Weath. Cuffs +1",
		legs="Eri. Leg Guards +1",
		feet="Skaoi Boots",
		neck="Sacro Gorget",
		waist="Korin Obi",
		left_ear="Mendi. Earring",
		right_ear={name="Odnowa Earring +1", priority=3},
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Phys. dmg. taken-10%',}},}

	sets.midcast['Refueling'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear={name="Odnowa Earring +1", priority=3},
		ring1="Defending Ring", 
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}

	sets.midcast['Cocoon'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','DEF+50',}},}

	sets.midcast['Geist Wall'] = sets.enmity

	sets.midcast['Stinking Gas'] = sets.enmity

	sets.midcast['Blank Gaze'] = sets.enmity
	
	sets.midcast['Jettatura'] = sets.enmity
	
	sets.midcast['Soporific'] = sets.enmity
	
	sets.midcast['Sheep Song'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','DEF+50',}},}
	
	sets.midcast['Curing Waltz III'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}

	sets.midcast['Curing Waltz II'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}

	sets.midcast['Curing Waltz'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}
		
	sets.midcast['Divine Waltz'] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}
	
	sets.precast.JA['Box Step'] = {
		ammo="Yamarang",
		head="Rune. Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs="Rune. Trousers +3",
		feet="Runeist's Boots +3",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
		
	sets.midcast['Stutter Step'] = {
		ammo="Yamarang",
		head="Rune. Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs="Rune. Trousers +3",
		feet="Runeist's Boots +3",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}

	
		
	--------------------------------------
	-- Idle/resting/defense/etc sets -----
	--------------------------------------

    sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Rawhide Mask",
		body="Runeist's Coat +3",
		hands="Kurys Gloves",
		legs={ name="Herculean Trousers", augments={'"Blood Boon"+8','"Drain" and "Aspir" potency +1','"Refresh"+2',}},
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		ring1="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
			
			
	sets.idle.HPDT = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
			
			
			
			
	sets.idle.Refresh = {
		ammo="Staunch Tathlum +1",
		head="Rawhide Mask",
		body="Runeist's Coat +3",
		hands="Kurys Gloves",
		legs={ name="Herculean Trousers", augments={'"Blood Boon"+8','"Drain" and "Aspir" potency +1','"Refresh"+2',}},
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		ring1="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
			
    sets.idle.VITDefense = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','DEF+50',}},}
			
	sets.idle.Duration = {
		ammo="Staunch Tathlum +1", 
		head="Erilaz Galea +1", 
		neck="Futhark Torque +2", 
		ear1="Etiolation Earring", 
		ear2="Odnowa Earring +1",
        body="Futhark Coat +3", 
		hands="Regal Gauntlets", 
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
        back="Evasionist's Cape", 
		waist="Flume Belt", 
		legs="Futhark Trousers +3", 
		feet="Erilaz Greaves +1"}
           
	sets.idle.Phalanx = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Herculean Vest", augments={'MND+2','Pet: INT+4','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		hands={ name="Herculean Gloves", augments={'Rng.Acc.+21','Pet: "Subtle Blow"+4','Phalanx +5','Accuracy+10 Attack+10',}},
		legs={ name="Herculean Trousers", augments={'Pet: DEX+3','Pet: INT+6','Phalanx +4','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Defending Ring",
		back={name="Moonlight Cape", priority=1},
		ring2={name="Moonlight Ring", priority=2},}
	
	sets.defense.PDT = {
		head="Lithelimb Cap", 
		neck="Twilight Torque", 
		ear1="Sanare Earring", 
		ear2="Cryptic Earring",
        body="Futhark Coat +1", 
		hands="Erilaz Gauntlets +1", 
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
        back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+7','"Dbl.Atk."+2','Damage taken-4%'}}, 
		waist="Flume Belt", 
		legs="Erilaz Leg Guards +1", 
		feet="Meg. Jam. +2"}

	sets.defense.MDT = {}

	sets.Kiting = 
	{
		neck="Warder's Charm +1",
		waist="Engraved Belt",}


	--------------------------------------               
	-- Engaged sets
	--------------------------------------
	
    sets.engaged.TP = {
		ammo="Yamarang",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Defending Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.TPSamroll = {
		ammo="Yamarang",
		head={ name="Herculean Helm", augments={'Accuracy+17','"Triple Atk."+4','STR+6','Attack+7',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+5','Crit.hit rate+1','Quadruple Attack +3','Accuracy+10 Attack+10','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
		neck="Anu Torque",
		waist="Ioskeha Belt",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

	
	
	sets.engaged.Hybrid = {
		ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Turms Mittens +1",
		legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

		
	
	sets.engaged.DTParry = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},}
		
	sets.engaged.MEva = {
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +2",
		waist="Flume Belt",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		ring2={name="Moonlight Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
		
		
		
	sets.engaged.CC = {
		ammo="Staunch Tathlum +1",
        head="Halitus Helm", 
		neck="Futhark Torque +2", 
		ear1="Odnowa Earring", 
		ear2="Odnowa Earring +1",
        body="Erilaz Surcoat +1", 
		hands="Turms Mittens", 
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
        back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10',}},
		waist="Flume Belt", 
		legs="Erilaz Leg Guards +1", 
		feet="Turms Leggings"}

	sets.engaged.HP = {
		ammo="Staunch Tathlum +1",
		head="Rune. Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet="Turms Leggings +1",
		neck="Sanctity Necklace",
		waist="Trance Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Gelatinous Ring +1",
		ring2={name="Moonlight Ring", priority=2},
		back={name="Moonlight Cape", priority=1},}
	
	organizer_items = {
      echos="Echo Drops",
	  curry="Red Curry Bun"}
	  
end

------------------------------------------------------------------
-- Action events
------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        local obi = get_obi(get_rune_obi_element())
        if obi then
            equip({waist=obi})
        end
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.english == 'Phalanx' then 
		add_to_chat(215,'Phalanx set equipped')
	elseif spell.english == 'Protect IV' then	
		send_command('input /echo Enhancing Set')
	elseif spell.english == 'Shell V' then	
		send_command('input /echo Enhancing Set')
	elseif spell.english == 'Poisonga' then
		send_command('input /echo DT Set')
	elseif spell.english == 'Cocoon' then 
		add_to_chat(210,'Cocoon set equipped')
	elseif spell.english == 'Pflug' then
		send_command('input /echo Pflug')
	elseif spell.english == 'Foil' then
		add_to_chat(210,'Foil set equipped')
	elseif spell.english == 'Aquaveil' then 
		add_to_chat(210,'Aquaveil set equipped')
	elseif spell.english == 'Herculean Slash' then 
		send_command('@input /echo Induration/ Detonation/ Impaction')
	elseif spell.english == 'Resolution' then 
		send_command('@input /echo Fragmentation/ Scission/ Light')
	elseif spell.english == 'Dimidiation' then 
		add_to_chat(215,'Dimidiation: Fragmentation/Light')
	elseif spell.english == 'Swordplay' then 
		send_command('input /echo Accuracy +80/Evasion +80')
	elseif spell.english == 'Gambit' then
		send_command('input /party Gambit used on <t> Magic Defense Down -30%')
	elseif spell.english == 'Rayke' then
		send_command('input /party Rayke used on <t> Magic Resistance Down -30%')
		
	elseif spell.english ==  'Tellus' then      
		add_to_chat(217,'Tellus Locked -- Earth Damage -- Thunder Resist: Stun, Magic Defense Down')
		
	elseif spell.english ==  'Ignis' then      
		add_to_chat(217,'Ignis Locked -- Fire Damage -- Ice Resist: Evasion Down, Paralyze, Bind')
		
	elseif spell.english ==  'Gelus' then      
		add_to_chat(217,'Gelus Locked -- Ice Damage -- Wind Resist: Defense Down, Gravity, Silence')
		
	elseif spell.english ==  'Flabra' then      
		add_to_chat(217,'Flabra Locked -- Wind Damage -- Earth Resist: Accuracy Down, Petrification, Slow')
		
	elseif spell.english ==  'Sulpor' then      
		add_to_chat(217,'Sulpor Locked -- Thunder Damage -- Water Resist: Attack Down / Poison / Drown')
		
	elseif spell.english ==  'Unda' then      
		add_to_chat(217,'Unda Locked -- Water Damage -- Fire Resist: Magic Attack Down, Amnesia, Plague')
		
	elseif spell.english ==  'Tenebrae' then      
		add_to_chat(217,'Tenebrae Locked -- Dark Damage -- Light Resist: M.Acc Down, Lullaby, Charm')
		
	elseif spell.english ==  'Lux' then      
		add_to_chat(217,'Lux Locked -- Light Damage -- Dark Resist: Magic Evasion Down, Dispel, Sleep')
		
		
	end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DRK' then
		set_macro_page(1, 20) 
		send_command('@input /lockstyleset 20')
		send_command('@input //lua r equipviewer')
		send_command('@input //lua r anchor')
		
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 20)
		send_command('@input /lockstyleset 20')
	else
		set_macro_page(1, 20)
	end
end

function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']
    
    local found_rune_element
    
    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end
    
    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end	
end


windower.register_event('chat message', function(message,sender,mode,gm)

    --Ignore it if it's not party chat or a tell
    if mode ~= 3 and mode ~= 4 then return end
    
    local play = windower.ffxi.get_player().name
    
    message = message:lower()

    if sender == 'Shiraj' and message:contains('d12') then
        windower.send_command('input /equipset 75')
        windower.send_command('@wait 13;input /item \"Warp Ring\" <me>')
    end

end)

windower.register_event('zone change', function(new_id)
	add_to_chat(122, 'Currently in '..world.area..'!!!')
	status_change(player.status)
end)

			
function precast(spell, action)
        if buffactive['terror'] or buffactive['petrification']
            or buffactive['stun'] or buffactive['sleep'] then
                equip(sets.Tanking)
        end
        if buffactive.sleep and player.hp > 100 and player.status == "Engaged" then
            equip(set_combine(sets.Tanking, {head="Frenzy Sallet"}))
        end
end	
			
function precast_weaponskill(spell, action)
    if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        cancel_spell()
        return
    end
    if player.equipment.main == "Lionheart" then
        if player.tp < 2251 then
            equip({right_ear = 'Moonshade Earring'})
        end
    else
        if player.tp < 2751 then
            equip({right_ear = 'Moonshade Earring'})
        end
    end
 
end

function job_buff_change(status,gain_or_loss)
   if (gain_or_loss) then  
	 
	 if status == "Aftermath: Lv.3" then
	   send_command('input //timers c "AM3" 180')
	 elseif status == "Aftermath: Lv.2" then
	   send_command('input //timers c "AM2" 120')
	 elseif status == "Aftermath: Lv.1" then
	   send_command('input //timers c "AM1" 90')
	 end
	 
   end
   end

function job_aftercast(spell, action, eventArgs)
	if spell.type == "WeaponSkill" then 
		add_to_chat(217, 'TP Return: '..tostring(player.tp))
    end
end	

function job_precast(spell, action, spellMap, eventArgs)    
if spell.type == 'WeaponSkill' and player.target.distance > (3.4 + player.target.model_size) then 
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        eventArgs.cancel = true        
        return
    end
end 	   
