function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','DualWield')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SingleWeapon','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.FC_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Ovate Rope"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Ovate Rope"

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	-- Alias
	send_command('alias ageohaste gs c autogeo frailty;gs c autoindi haste;gs c autoentrust fury')
	send_command('alias ageoatk gs c autogeo frailty;gs c autoindi fury')	
	send_command('alias ageoacc gs c autogeo frailty;gs c autoindi torpor')
		
	indi_duration = 275
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2", back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants +1", feet="Azimuth Gaiters +1"}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	-- Current 69%
	sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		--ammo="Impatiens",
		--ear1="Enchntr. Earring +1",
		head="Haruspex Hat", neck="Voltsurge Torque", ear1="Etiolation Earring", ear2="Loquac. Earring",
		--body="Zendik Robe", 
		Body="Helios Jacket", hands=gear.helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Geomancy Pants +2", feet="Amalric Nails"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="Idris", sub="Genmei Shield", range="Dunna",ammo=empty,})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1",})--ear2="Barkaro. Earring"

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1"})--main="Serenity",
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})--waist="Siegel Sash"

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {--ammo="Impatiens",
		head=empty,
		body="Twilight Cloak"})
	
	sets.Self_Healing = {neck="Phalaina Locket", ring2="Asklepian Ring"} --ring1="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket", ring2="Asklepian Ring"} --ring1="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {} --back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"
	
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = set_combine(sets.precast.FC,{main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		--ammo="Impatiens",
		--ear1="Enchntr. Earring +1",
		head="Haruspex Hat", neck="Voltsurge Torque", ear1="Etiolation Earring", ear2="Loquac. Earring",
		--body="Zendik Robe", 
		Body="Helios Jacket", hands=gear.helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Geomancy Pants +2", feet="Amalric Nails"})

	sets.midcast.Geomancy = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- neck="Incantor's Torque", rear="Calamutious Earring",
		head="Azimuth Hood +1", neck="Melic Torque",
		body="Bagua Tunic +1", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Lifestream Cape", waist="Austerity Belt", legs="Bagua Pants +1", feet="Azimuth Gaiters +1"}

	--Extra Indi duration on any slot you can't get skill on here.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- neck="Incantor's Torque",
		head="Azimuth Hood +1", neck="Melic Torque",
		body="Bagua Tunic +1", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Lifestream Cape", legs="Bagua Pants +1", feet="Azimuth Gaiters +1"})

    sets.midcast.Cure = {main="Tamaxchi", sub="Sors Shield", range="Dunna",
		--Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Geomancy Pants +2", feet="Rubeus Boots"}

    sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Kaja Grip", range="Dunna",
		-- Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist=gear.ElementalObi, legs="Geomancy Pants +2", feet="Rubeus Boots"}

    sets.midcast.LightDayCure = {main="Iridal Staff", sub="Kaja Grip", range="Dunna",
		---- Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist=gear.ElementalObi, legs="Geomancy Pants +2", feet="Rubeus Boots"}
    
	sets.midcast.Curaga = {main="Tamaxchi", sub="Sors Shield", range="Dunna",
		-- lear="Novia Earring", rear="Lifestorm Earring",
		head="Haruspex Hat", neck="Colossus's Torque", 
		body="Heka's Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Geomancy Pants +2", feet="Rubeus Boots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Melic Torque", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Erra Pendant", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Fodder = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Melic Torque", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		
	
	-- Hight Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- head="Amalric Coif", neck="Incantor Torque", lear="Novio Earring",
		head="Jhakri Coronal +2", neck="Melic Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- head="Amalric Coif", neck="Incantor Torque",
		head="Jhakri Coronal +2", neck="Melic Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- head="Amalric Coif", neck="Incantor Torque", 
		head="Jhakri Coronal +2", neck="Melic Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	
    sets.midcast['Dark Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- head="Bagua Galero +3", neck="Incantor Torque", lear="Enchntr. Earring +1",
		head="Bagua Galero +1", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Drain = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- head="Bagua Galero +3", neck="Incantor Torque", lear="Enchntr. Earring +1",
		head="Bagua Galero +1", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		--  waist="Luminary Sash
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast.Stun.Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		--  waist="Luminary Sash
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast.Impact = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		-- waist="Luminary Sash
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque",lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- main=gear.gada_enhancing_club,		
		-- neck="Incantor's Torque",
		head=gear.telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.FC_jse_back, waist="Cascade Belt", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Idris", sub="Genmei Shield", range="Dunna",
		head="Befouled Crown",neck="Loricate Torque +1", ear1="Ethereal Earring", rear="Merman's Earring",
		body="Jhakri Robe +2", hands="Bagua Mitaines +1", ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

	-- Idle sets
	sets.idle = {main="Bolelabunga", sub="Genmei Shield", range="Dunna",
		head="Befouled Crown", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Merman's Earring",
		body="Jhakri Robe +2", hands="Bagua Mitaines +1", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	sets.idle.PDT = {main="Earth Staff", sub="Mensch Strap", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	-- Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle.PDT, {main="Idris", sub="Genmei Shield", range="Dunna",
		-- rear="Handler's Earring +1",
		head=gear.telchine_head_Pet, lear="Ethereal Earring", rear="Merman's Earring",
		body=gear.telchine_body_Pet, hands=gear.telchine_hands_Pet,
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +1"})

	sets.idle.PDT.Pet = {main="Idris", sub="Genmei Shield", range="Dunna",
		-- lear="Handler's Earring", rear="Handler's Earring +1",
		head=gear.telchine_head_Pet, 
		body=gear.telchine_body_Pet, hands="Bagua Mitaines +1",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +1"}
				
	-- Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {main="Idris", sub="Genmei Shield", range="Dunna"})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {main="Idris", sub="Genmei Shield", range="Dunna"}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {main="Idris", sub="Genmei Shield", range="Dunna"})
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {main="Idris", sub="Genmei Shield", range="Dunna"})

	sets.idle.Weak = {main="Mafic Cudgel",sub="Genmei Shield", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}

	-- Defense sets	
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei Shield", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}	

	sets.defense.MDT = {main="Mafic Cudgel",sub="Genmei Shield", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}
	
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genmei Shield", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +3"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})--feet=gear.chironic_treasure_feet
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rajas Ring", rring="Petrov Ring",
		back=gear.idle_jse_back, waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.engaged.DualWield = {
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ramuh Ring", rring="Ramuh Ring",
		back=gear.idle_jse_back, waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		-- Bagua Galero +2
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		-- Bagua Tunic +2 Bagua Mitaines +2 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Petrov Ring",
		-- WS Cape Bagua Pants +2 Bagua Sandals +2
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	-- Club
	-- STR/MND
	sets.precast.WS['Hexa Strike']= {  
		-- neck="Caro Necklace", lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Zennaroi Earring", rear="Regal Earring",
		-- lring="Begrudging Ring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring",  rring="Petrov Ring",
		back=gear.nuke_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Flash Nova']= {  
		-- Bagua Galero +2
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		-- Bagua Tunic +2 Bagua Mitaines +2 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring",  rring="Petrov Ring",
		-- WS Cape Bagua Pants +2 Bagua Sandals +2
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	-- Changes Based on TP Range
	sets.precast.WS['Realmrazer']= {
		-- lear="Telos Earring", rear="Cessance Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget",  lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring",  rring="Petrov Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	-- MND
	sets.precast.WS['Exudation']= {	
		-- lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	-- Staff
	sets.precast.WS['Catacylsm']= {
		--  lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Shattersoul']= {
		-- lring="Epaminondas's Ring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2",  rring="Shiva Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat", ring1="Mujin Band", feet="Jhakri Pigaches +2"}--neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Ea Cuffs",legs="Ea Slops",
	sets.RecoverBurst = {head="Ea Hat", body="Seidr Cotehardie", ring1="Mujin Band", feet="Jhakri Pigaches +2"}--head="Ea Hat",neck="Mizu. Kubikazari",hands="Ea Cuffs",legs="Ea Slops",
	-- Weapons sets
	sets.weapons.SingleWeapon = {main="Idris", sub="Genmei Shield", ranged="Dunna"}
	sets.weapons.DualWeapons = {main="Idris", sub="Maxentius", ranged="Dunna"}	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 2)
end