function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SingleWeapon','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = {name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Bishop's Sash"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Yamabuki-no-Obi"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"

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
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2", back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1", hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells
	sets.precast.FC = {
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Nahtirah Hat", neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Anhur Robe", hands="Helios Gloves", ring1="Prolix Ring", ring2="Lebeche Ring",
		back=gear.FC_jse_back, waist="Witful Belt",legs="Geomancy Pants +2", feet="Amalric Nails"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="Idris", sub="Genbu's Shield", range="Dunna",ammo=empty,
		rring=empty,
		waist="Austerity Belt"})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1", ear2="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		 rear="Mendi. Earring",
		 body="Heka's Kalasiris",})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}-- waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}-- back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Twilight Cloak",hands="Magavan Mitts", ring1="Prolix Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants +2",feet="Amalric Nails"}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		-- Bagua Galero +2
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		-- Bagua Tunic +2 Bagua Mitaines +2 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Stikini Ring",
		-- WS Cape Bagua Pants +2 Bagua Sandals +2
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	-- Club
	-- STR/MND
	sets.precast.WS['Hexa Strike']= {  
		head="Jhakri Coronal +2", neck="Caro Necklace", lear="Telos Earring", rear="Regal Earring",
		-- lring="Begrudging Ring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rajas Ring", rring="Ifrit Ring +1",
		back=gear.nuke_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Flash Nova']= {  
		-- Bagua Galero +2
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		-- Bagua Tunic +2 Bagua Mitaines +2 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Stikini Ring",
		-- WS Cape Bagua Pants +2 Bagua Sandals +2
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	-- Changes Based on TP Range
	sets.precast.WS['Realmrazer']= {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Telos Earring", rear="Cessance Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	-- MND
	sets.precast.WS['Exudation']= {	
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Telos Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring +1", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	-- Staff
	sets.precast.WS['Catacylsm']= {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Telos Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring +1", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Shattersoul']= {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Telos Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",sub="Genmei Shield",
		head="Nahtirah Hat", neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Anhur Robe", hands=gear_helios_hands_FC, lring="Prolix Ring", rring="Kishar Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants +2",feet="Amalric Nails"}

	sets.midcast.Geomancy = {main="Idris", sub="Genmei Shield", range="Dunna",
		-- neck="Incantor's Torque",
		head="Azimuth Hood +1", neck="Reti Pendant", lear="Merman's Earring", rear="Etiolation Earring",
		-- Vedic Coat
		body="Bagua Tunic +1", hands="Shrieker's Cuffs", lring="Stikini Ring", rring="Stikini Ring",
		-- Feet Conserve MP
		back=gear.FC_jse_back, waist="Austerity Belt", legs="Vanya Slops", feet="Azimuth Gaiters +1"}

	--Extra Indi duration. As long as you can keep your 900 skill cap
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
		back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
		-- Gada 
		-- Vanya Hood Incantor Torque
        head="Nahtirah Hat", neck="Colossus's Torque",ear1="Novia Earring", rear="Mendi. Earring",
        body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1", waist="Witful Belt", legs="Gyve Trousers", feet="Regal Pumps +1"}
		
    sets.midcast.LightWeatherCure = {main="Tamaxchi",sub="Sors Shield", ammo="Hasty Pinion +1",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Novia Earring", rear="Mendi. Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1", waist="Hachirin-no-Obi", legs="Gyve Trousers", feet="Regal Pumps +1"}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Novia Earring", rear="Mendi. Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Stikini Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1",waist="Hachirin-no-Obi", legs="Gyve Trousers", feet="Regal Pumps +1"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"
	
    sets.midcast['Elemental Magic'] = {
		main={name="Idris", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Resistant = {
		main={name="Idris", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

    sets.midcast['Elemental Magic'].Fodder = {
		main={name="Idris", priority=2}, sub={name="Genbu's Shield", priority=1},  ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}		

	-- High Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main={name="Idris", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"})	
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main={name="Idris", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"})	
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder,  {
		main={name="Idris", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Pemphredo Tathlum",
		-- gear_merlinic_nuke_head Merlinic Hood Saevus Pendant +1
		head="Mallquis Chapeau +2", neck="Erra Pendant", lear="Friomisi Earring", rear="Regal Earring",
		--Amalric Doublet +1 Amalric Gages +1 Fenrir Ring +1 Fenrir Ring +1
		body="Mallquis Saio +2", hands="Mallquis Cuffs +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Eschan Stone Amalric Slops +1 Amalric Nails +1
		back=gear.nuke_jse_back, waist="Yamabuki-no-Obi", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"})	
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Bagua Galero +3
        head="Bagua Galero +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Enchntr. Earring +1",
        body=gear.merlinic_nuke_body,hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Hirundinea Earring
        head="Bagua Galero +1",neck="Erra Pendant",ear1="Digi. Earring",ear2="Regal Earring",
		-- Aspir body and hands Excelsis Ring Evanescence Ring
        body="Geomancy Tunic +2",hands="Geo. Mitaines +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Perimede Cape",waist="Fucho-no-obi",legs="Geomancy Pants +2",feet="Geo. Sandals +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Idris",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Geo. Galero +2",neck="Voltsurge Torque",ear1="Regal Earring",ear2="Enchntr. Earring +1",
        -- body="Zendik Robe",
		body="Geomancy Tunic +2",hands="Geo. Mitaines +2",ring1="Stikini Ring",ring2="Kishar Ring",
        back=gear.FC_jse_back,waist="Ninurta's Sash",legs="Geomancy Pants +2",feet="Geo. Sandals +2"}
    
	sets.midcast.Stun.Resistant = {main="Idris",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Geo. Galero +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Enchntr. Earring +1",
		-- body="Zendik Robe",
		body="Geomancy Tunic +2",hands="Geo. Mitaines +2",ring1="Stikini Ring",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Ninurta's Sash",legs="Geomancy Pants +2",feet="Geo. Sandals +2"}
	
	sets.midcast.Impact = {main="Idris",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head=empty, neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
		body="Twilight Cloak", hands="Geo. Mitaines +2", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back, waist="Luminary Sash", legs="Geomancy Pants +2", feet="Geo. Sandals +2"}		

	sets.midcast['Enfeebling Magic'] = {main="Idris",sub="Ammurapi Shield", 
		head="Geo. Galero +2", neck="Erra Pendant",ear1="Digi. Earring", ear2="Regal Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", ring1="Stikini Ring", ring2="Kishar Ring",
		back=gear.nuke_jse_back, waist="Luminary Sash", legs="Geomancy Pants +2", feet="Geo. Sandals +2"}		
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Idris",sub="Ammurapi Shield", 
		head="Geo. Galero +2", neck="Erra Pendant",ear1="Digi. Earring", ear2="Regal Earring", 
		body="Geomancy Tunic +2", hands="Geo. Mitaines +2", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back, waist="Luminary Sash", legs="Geomancy Pants +2", feet="Geo. Sandals +2"}		
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {ammo="Pemphredo Tathlum",back=gear.FC_jse_back})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ammo="Pemphredo Tathlum",back=gear.FC_jse_back})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ammo="Pemphredo Tathlum",back=gear.nuke_jse_back})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ammo="Pemphredo Tathlum",back=gear.nuke_jse_back})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ammo="Pemphredo Tathlum",waist="Luminary Sash", back=gear.FC_jse_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ammo="Pemphredo Tathlum",waist="Luminary Sash", back=gear.FC_jse_back})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	-- Duration
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Hasty Pinion +1",		
		head=gear_telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		back="Fi Follet Cape +1", waist="Olympus Sash", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {})--neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})--neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		--main="Vadose Rod", sub="Genmei Shield",
		--head="Amalric Hood", hands="Regal Cuffs",
		--waist="Emphatikos Rope", legs="Shedir Seraweels"
		})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {}) -- legs="Shedir Seraweels"
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff", sub="Elder Grip +1",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	-- Idle sets
	sets.idle = {main="Idris",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Befouled Crown
		head="Azimuth Hood +1", neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2", hands="Bagua Mitaines +1", ring1="Dark Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1", feet="Mallquis Clogs +2"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Befouled Crown
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Mallquis Saio +2",hands="Bagua Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	--Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear_telchine_head_Pet, neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",		
		body=gear_telchine_body_Pet,hands=gear_telchine_hands_Pet, ring1="Dark Ring",ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear_telchine_legs_Pet, feet="Bagua Sandals +1"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear_telchine_head_Pet, neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body=gear_telchine_body_Pet, hands="Geo. Mitaines +2", ring1="Dark Ring", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear_telchine_legs_Pet, feet="Bagua Sandals +1"}

	--Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {main="Idris",sub="Genbu's Shield",range="Dunna"})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {main="Idris",sub="Genbu's Shield",range="Dunna"}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Idris",sub="Genbu's Shield", range="Dunna",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
	-- Defense sets	
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Mallquis Saio +2",hands="Geo. Mitaines +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Azimuth Gaiters +1"}

	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Mallquis Saio +2",hands="Geo. Mitaines +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head=gear_telchine_head_Pet,neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Mallquis Saio +2",hands=gear_telchine_hands_Pet,ring1="Dark Ring",ring2="Defending Ring",
        back=gear.idle_jse_back, waist="Fucho-no-obi",legs=gear_telchine_legs_Pet,feet="Mallquis Clogs +2"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.SingleWeapon = {main='Idris', sub="Genbu's Shield", ranged="Dunna"}
	sets.weapons.DualWeapons = {main='Idris', sub="Genbu's Shield", ranged="Dunna"}	
	
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
		-- Combatant's Torque
		head="Jhakri Coronal +2",neck="Asperity Necklace",ear1="Digi. Earring",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Moonbeam Cape",waist="Witful Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.engaged.DW = {
		-- Combatant's Torque
		head="Jhakri Coronal +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Moonbeam Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Jhakri Pigaches +2"}

	-- Custom buff sets
	--------------------------------------
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {feet="Mallquis Clogs +2"}--body="Seidr Cotehardie", 
	sets.DamageMP = {lear="Ethereal Earring", feet="Mallquis Clogs +2"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",feet="Jhakri Pigaches +2"}--head="Ea Hat",body="Ea Houppelande",hands="Ea Cuffs",legs="Ea Slops",
	sets.RecoverBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",feet="Jhakri Pigaches +2"}--head="Ea Hat",body="Seidr Cotehardie",hands="Ea Cuffs",legs="Ea Slops",

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(7, 2)
end