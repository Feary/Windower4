function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','DualWield')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.FC_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	
	gear.obi_cure_back = "Tempered Cape +1"
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
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants +1", feet="Azimuth Gaiters +1"}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	sets.precast.FC = {
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		--ear1="Enchntr. Earring +1",
		head="Haruspex Hat", neck="Voltsurge Torque", ear2="Loquac. Earring",
		--body="Zendik Robe", 
		hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Geomancy Pants +2", feet="Amalric Nails"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1",})--ear2="Barkaro. Earring"

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})--main="Serenity",sub="Clerisy Strap +1"
		
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

    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})

	sets.midcast.Geomancy = {range="Dunna",
		-- neck="Incantor's Torque", rear="Calamutious Earring",
		head="Azimuth Hood +1", neck="Reti Pendant",
		body="Bagua Tunic +1", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Lifestream Cape", waist="Austerity Belt", legs="Bagua Pants +1", feet="Azimuth Gaiters +1"}

	--Extra Indi duration on any slot you can't get skill on here.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {range="Dunna",
		-- neck="Incantor's Torque",
		head="Azimuth Hood +1", neck="Reti Pendant",
		body="Bagua Tunic +1", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Lifestream Cape", legs="Bagua Pants +1", feet="Azimuth Gaiters +1"})

    sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1},
		--Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear_telchine_Cure_Hands, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Geomancy Pants +2", feet="Rubeus Boots"}

    sets.midcast.LightWeatherCure = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip", priority=1},
		-- Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear_telchine_Cure_Hands, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Geomancy Pants +2", feet="Rubeus Boots"}

		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main={name="Iridal Staff", priority=2}, sub={name="Pax Grip", priority=1},
		---- Vanya Hood
		head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
		body="Heka's Kalasiris", hands=gear_telchine_Cure_Hands, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Geomancy Pants +2", feet="Rubeus Boots"}
    
	sets.midcast.Curaga = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1},
		-- lear="Novia Earring", rear="Lifestorm Earring",
		head="Haruspex Hat", neck="Colossus's Torque", 
		body="Heka's Kalasiris", hands=gear_telchine_Cure_Hands, lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Cascade Belt", legs="Geomancy Pants +2", feet="Rubeus Boots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		--  neck="Eddy Necklace", lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Aesir Torque", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Resistant = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		--  neck="Eddy Necklace", lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Erra Pendant", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Fodder = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		--  neck="Eddy Necklace", lear="Novio Earring",
		head="Mall. Chapeau +2", neck="Aesir Torque", lear="Regal Earring", rear="Friomisi Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		
	
	-- Hight Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		-- head="Amalric Coif", neck="Incantor Torque", lear="Novio Earring",
		head="Jhakri Coronal +2", neck="Aesir Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		-- head="Amalric Coif", neck="Incantor Torque",
		head="Jhakri Coronal +2", neck="Aesir Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		-- head="Amalric Coif", neck="Incantor Torque", 
		head="Jhakri Coronal +2", neck="Aesir Torque", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Robe" hands="Amalric Gages",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- legs="Amalric Slops" feet="Amalric Nails"
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	
    sets.midcast['Dark Magic'] = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		-- head="Bagua Galero +3", neck="Incantor Torque", lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Drain = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		-- head="Bagua Galero +3", neck="Incantor Torque", lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {--ammo="Hasty Pinion +1",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast.Stun.Resistant = {--ammo="Hasty Pinion +1",
		-- lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast.Impact = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		-- neck="Eddy Necklace", lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'] = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		-- neck="Eddy Necklace", lear="Enchntr. Earring +1",
		head="Geo. Galero +2", neck="Voltsurge Torque",lear="Regal Earring", rear="Loquac. Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Ovate Rope", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Arasy Staff", priority=2}, sub={name="Niobid Strap", priority=1}, 
		-- neck="Eddy Necklace", lear="Enchntr. Earring +1",
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
		
	sets.midcast['Enhancing Magic'] = {ammo="Hasty Pinion",
		-- main=gear.gada_enhancing_club,sub="Ammurapi Shield",		
		-- neck="Incantor's Torque",
		head=gear_telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.FC_jse_back, waist="Cascade Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
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
	sets.resting = {main={name="Iridal Staff", priority=2}, sub={name="Niobid Strap", priority=1},
		head="Befouled Crown",neck="Loricate Torque +1", ear1="Ethereal Earring", rear="Merman's Earring",
		body="Jhakri Robe +2", hands="Bagua Mitaines +1", ring1="Vocane Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

	-- Idle sets
	sets.idle = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Befouled Crown", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Merman's Earring",
		body="Jhakri Robe +2", hands="Bagua Mitaines +1", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Mensch Strap", priority=1},
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle.PDT, {
		-- rear="Handler's Earring +1",
		head=gear_telchine_head_Pet, lear="Ethereal Earring", rear="Merman's Earring",
		body=gear_telchine_body_Pet, hands=gear_telchine_hands_Pet,
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear_telchine_legs_Pet, feet="Bagua Sandals +1"})

	sets.idle.PDT.Pet = {main="Earth Staff", sub="Umbra Strap", range="Dunna",
		-- lear="Handler's Earring", rear="Handler's Earring +1",
		head=gear_telchine_head_Pet, 
		body=gear_telchine_body_Pet, hands="Bagua Mitaines +1",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear_telchine_legs_Pet, feet="Bagua Sandals +1"}
				
	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main={name="Earth Staff", priority=2}, sub={name="Mensch Strap", priority=1},
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}

	-- Defense sets	
	sets.defense.PDT = {main={name="Earth Staff", priority=2}, sub={name="Mensch Strap", priority=1},
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}	

	sets.defense.MDT = {main={name="Earth Staff", priority=2}, sub={name="Mensch Strap", priority=1},
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Vocane Ring", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}
	
    sets.defense.MEVA = {main={name="Earth Staff", priority=2}, sub={name="Mensch Strap", priority=1},
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
		head="Jhakri Coronal +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rajas Ring", rring="Ramuh Ring",
		waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.engaged.DualWield = {
		head="Jhakri Coronal +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ramuh Ring", rring="Ramuh Ring",
		 waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}	
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {ring1="Mujin Band", feet="Jhakri Pigaches +2"}--head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Ea Cuffs",legs="Ea Slops",
	sets.RecoverBurst = {ring1="Mujin Band", feet="Jhakri Pigaches +2"}--head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Ea Cuffs",legs="Ea Slops",

	-- Weapons sets
	sets.weapons.Nehushtan = {main='Kaja Rod',sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main='Kaja Rod',sub='Gabaxorea'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 2)
end