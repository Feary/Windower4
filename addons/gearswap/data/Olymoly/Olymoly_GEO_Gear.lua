function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SingleWeapon','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = {name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"

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
	sets.precast.JA.Bolster = {body="Bagua Tunic"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1", back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood",hands="Bagua Mitaines"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
		body="Anhur Robe",hands="Magavan Mitts",ring1="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Geomancy Pants",feet="Amalric Nails"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
			 body="Heka's Kalasiris",})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Twilight Cloak",hands="Magavan Mitts",ring1="Prolix Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Amalric Nails"}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",sub="Genmei Shield",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Anhur Robe",hands="Magavan Mitts",ring1="Prolix Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Amalric Nails"}

	sets.midcast.Geomancy = {main="Solstice",sub="Genmei Shield",range="Dunna",
		-- neck="Incantor's Torque",
		head="Azimuth Hood", neck="Reti Pendant", lear="Merman's Earring", rear="Etiolation Earring",
		body="Bagua Tunic", hands="Geomancy Mitaines", lring="Stikini Ring", rring="Stikini Ring",
		-- back=Nantosuelta's Cape"
		back="Lifestream Cape", waist="Austerity Belt", legs="Bagua Pants", feet="Azimuth Gaiters"}


	--Extra Indi duration. As long as you can keep your 900 skill cap
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back="Lifestream Cape",legs="Bagua Pants",feet="Azimuth Gaiters"})
		
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Novia Earring",ear2="Beatific Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1",waist="Witful Belt",legs="Geomancy Pants",feet="Rubeus Boots"}
		
    sets.midcast.LightWeatherCure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Novia Earring",ear2="Beatific Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Rubeus Boots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Novia Earring",ear2="Beatific Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Rubeus Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main={name="Arasy Staff", priority=2}, sub={name="Elder's Grip +1", priority=1}, 
		head="Mallquis Chapeau +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
		body="Mallquis Saio +1", hands="Mallquis Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Wanion Belt", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		

    sets.midcast['Elemental Magic'].Resistant = {main={name="Arasy Staff", priority=2}, sub={name="Elder's Grip +1", priority=1}, 
		head="Mallquis Chapeau +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
		body="Mallquis Saio +1", hands="Mallquis Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Wanion Belt", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		

    sets.midcast['Elemental Magic'].Fodder = {main={name="Arasy Staff", priority=2}, sub={name="Elder's Grip +1", priority=1}, 
		head="Mallquis Chapeau +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
		body="Mallquis Saio +1", hands="Mallquis Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {hands="Amalric Gages"})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {hands="Amalric Gages",})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {hands="Amalric Gages"})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
        body=gear.merlinic_nuke_body,hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Mallquis Trews +1",feet="Mallquis Clogs +1"}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
        body="Mallquis Saio +1",hands="Mallquis Cuffs +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +1",feet="Mallquis Clogs +1"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Arasy Staff",sub="Elder's Grip +1",ammo="Hasty Pinion +1",
		head="Mallquis Chapeau +1",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
        body="Mallquis Saio +1",hands="Mallquis Cuffs +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +1",feet="Mallquis Clogs +1"}
    
	sets.midcast.Stun.Resistant = {main="Arasy Staff",sub="Elder's Grip +1",ammo="Hasty Pinion +1",
		head="Mallquis Chapeau +1",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
		body="Mallquis Saio +1",hands="Mallquis Cuffs +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Wanion Belt",legs="Mallquis Trews +1",feet="Mallquis Clogs +1"}
	
	sets.midcast.Impact = {main="Arasy Staff",sub="Elder's Grip +1",
		head=empty, neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
		body="Twilight Cloak", hands="Mallquis Cuffs +1", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back, waist="Wanion Belt", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		

	sets.midcast['Enfeebling Magic'] = {main="Arasy Staff",sub="Elder's Grip +1",
		head=empty, neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
		body="Twilight Cloak", hands="Mallquis Cuffs +1", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back, waist="Wanion Belt", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Arasy Staff",sub="Elder's Grip +1",
		head=empty, neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
		body="Twilight Cloak", hands="Mallquis Cuffs +1", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back, waist="Wanion Belt", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}		
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	-- Duration
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		--hands="Ayao's Gages",
		body="Anhur Robe", lring="Stikini Ring", rring="Stikini Ring",
		--legs="Portant Pants",
		back="Merciful Cape", waist="Olympus Sash", feet="Rubeus Boots"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Elder Grip +1",
		head="Amalric Coif",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +1"}

	-- Idle sets

	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Amalric Coif",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +1"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Amalric Coif",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +1"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Mafic Cudgel",sub="Genbu's Shield",range="Dunna",
		head="Azimuth Hood",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Handler's Earring",
		body="Jhakri Robe +2",hands="Geomancy Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Assid. Pants +1",feet="Bagua Sandals"}

	sets.idle.PDT.Pet = {main="Terra's Staff",sub="Umbra Strap",range="Dunna",
		head="Azimuth Hood",neck="Loricate Torque",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Jhakri Robe +2",hands="Geomancy Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Assid. Pants +1",feet="Bagua Sandals"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Amalric Coif",neck="Loricate Torque",ear1="Ethereal Earring",ear2=" Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +1"}
		
	-- Defense sets	
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Etiolation Earring",
		body="Mallquis Saio +1",hands="Geomancy Mitaines",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonbeam Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters"}

	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Etiolation Earring",
		body="Mallquis Saio +1",hands="Geomancy Mitaines",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flax Sash",legs="Assid. Pants +1",feet="Mallquis Clogs +1"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Azimuth Hood",neck="Warder's Charm +1",ear1="Handler's Earring +1",ear2="Etiolation Earring",
		body="Mallquis Saio +1",hands="Telchine Gloves",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.idle_jse_back,waist="Wanion Sash",legs="Telchine Braconi",feet="Mallquis Clogs +1"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.SingleWeapon = {main='Bolelabunga',sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {}	
	
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
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Jhakri Coronal +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Jhakri Robe +2",hands="Geomancy Mitaines",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Moonbeam Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Jhakri Pigaches +1"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Jhakri Coronal +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Geomancy Mitaines",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Moonbeam Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Jhakri Pigaches +1"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Ea Cuffs",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Ea Cuffs",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 2)
end