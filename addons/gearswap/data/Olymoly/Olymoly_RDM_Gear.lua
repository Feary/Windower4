 function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	-- Mandau Almace Sequence 
	state.Weapons:options('None','Normal','DualWeapons','DualDagger','DualClubs')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = 		{name="Ghostfyre Cape",	 augments={'Enfb.mag. skill +8','Enha.mag. skill +10','Mag. Acc.+3',}}
	gear.Macc_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.nuke_jse_back = 	{name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back =		{name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.Cape_TP 	=		{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.Cape_WS 	= 		{name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	-- Waist Replacements
	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Luminary Sash"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Eschan Stone"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Eschan Stone"

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	send_command('alias gear exec gearrdm.txt')
	send_command('alias ungear gs equip naked;exec ungearrdm.txt')
	
	send_command('alias imp input /ja "Parsimony" <me>;wait 1;input /ma "Impact" <stnpc>')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	-- RDM gets 30 FC from traits and up to 8 more from JP gifts. 80-38=42 
	sets.precast.FC = {
		head="Atro. Chapeau +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Psycloth Lappas", feet="Carmine Greaves +1"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",			
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Epaminondas's Ring", rring="Shukuyu Ring",
		back=gear.Cape_WS, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Regal Gem",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Crematio Earring", rear="Friomisi Earring",
		-- Atrophy Gloves +2
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Shukuyu Ring",
		-- Jhakri Slops +2 Jhakri Pigaches +2
		back=gear.Cape_WS, waist="Fotia Belt", legs="Amalric Slops +1", feet="Amalric Nails +1"})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {ammo="Yetshila",
		-- Taeon Chapeau 
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		--  Taeon Tights 
		back=gear.Cape_WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
		-- Atrophy Chapeau +3 Duelist Torque +2  Regal Earring Moonshade Earring
		head="Carmine Mask +1", neck="Caro Necklace", lear="Brutal Earring", rear="Moonshade Earring",
		-- Atrophy Tabard +3 Atrophy Gloves +3
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Shukuyu Ring",
		-- Jhakri Slops +2
		back=gear.Cape_WS, waist="Prosilio Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		back=gear.Cape_WS, waist="Fotia Belt", legs="Amalric Slops +1", feet="Carmine Greaves +1"}
	
	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Oranyan", sub="Elder's Grip +1", ammo="Pemphredo Tathlum",
		--head="Ea Hat +1", 
		head="Amalric Coif +1", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Mujin Band", ring2="Shiva Ring +1",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {main="Oranyan", sub="Elder's Grip +1", ammo="Pemphredo Tathlum",
	--head="Ea Hat +1", 
		head="Amalric Coif +1", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Seidr Cotehardie"
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Mujin Band", ring2="Shiva Ring +1",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Jhakri Pigaches +2"}

	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		head="Atro. Chapeau +1", beck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

    sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		head="Vanya Hood", neck="Incanter's Torque", lear="Mendi. Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring 
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +1", feet="Kaykaus Boots"}

    sets.midcast.LightWeatherCure = {main={name="Chatoyant Staff", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Esper Stone +1",
		head="Vanya Hood", neck="Incanter's Torque",lear="Mendi. Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Vanya Clogs
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Atrophy Tights +1", feet="Kaykaus Boots"}
	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		head="Vanya Hood", neck="Nodens Gorget", lear="Mendi. Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Cuffs Haoma's Ring Sirona's Ring
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +1", feet="Kaykaus Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",feet="Vanya Clogs"
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan"})--,sub="Clemency Grip"
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.Self_Healing = {
		neck="Phalaina Locket",
		 -- hands="Buremte Gloves",
		ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Cure_Received = {
		neck="Phalaina Locket", 
		--hands="Buremte Gloves",
		ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Self_Refresh = {back="Grapevine Cape",}--waist="Gishdubar Sash"
	
	-- Duration
	sets.midcast['Enhancing Magic'] = {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		-- main="Arendsi Fleuret",sub="Ammurapi Shield",
		-- Duelist's Torque +2 
		head=gear_telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands="Atrophy Gloves +1", ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs=gear_telchine_legs_Duration, feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1", sub="Ammurapi Shield",		
		--Duelist's Torque +2 
		head="Leth. Chappel +1", neck="Incanter's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Lethargy Sayon +1", hands="Atrophy Gloves +1", ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs="Leth. Fuseau +1", feet="Leth. Houseaux +1"}
	
	-- Phalanx Potency
	sets.midcast.Phalanx = {ammo="Hasty Pinion +1",
		--head=gear_taeon_head_Phalanx, 
		head="Befouled Crown", neck="Incanter's Torque", ear1="Andoaa Earring", ear2="Augment. Earring", 
		-- Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands=gear_taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs=gear_taeon_legs_Phalanx, feet=gear_taeon_feet_Phalanx}
		
	-- Enhancing Magic Skill set
	sets.midcast['Temper'] = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--Torque" Duelist's Torque +2 
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",rear="Augment. Earring",
		-- Viti. Tabard +3 Viti. Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3
		back=gear.JSE_Cape,waist="Olympus Sash",legs="Atrophy Tights +1",feet="Leth. Houseaux +1"}
	sets.midcast['Temper II'] = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		-- Duelist's Torque +2 
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring", ear2="Augment. Earring",
		-- Viti. Tabard +3 Viti. Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3
		back=gear.JSE_Cape,waist="Olympus Sash",legs="Atrophy Tights +1",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +1", hands="Atrophy Gloves +1", back="Grapevine Cape", legs="Leth. Fuseau +1"} --   waist="Gishdubar Sash",
	sets.midcast.Aquaveil = {head="Amalric Coif +1",} --  hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {neck="Nodens Gorget", waist="Siegel Sash",} -- ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {main={name="Oranyan", priority=2}, sub={name="Kaja Grip", priority=1}, ammo="Regal Gem",
			-- head="Atro. Chapeau +3",  Duelist's Torque +3
			head="Carmine Mask +1", neck="Incanter's Torque", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +1", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			-- feet="Vitiation Boots +3"
			back=gear.Macc_jse_back, waist="Luminary Sash", legs="Psycloth Lappas", feet="Skaoi Boots"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem",
			-- head="Atro. Chapeau +3",  Duelist's Torque +3
			head="Carmine Mask +1", neck="Incanter's Torque", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +1", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			-- feet="Vitiation Boots +3"
			back=gear.Macc_jse_back, waist="Luminary Sash", legs="Psycloth Lappas", feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1"}) --waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1"}) --waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Viti. Chapeau +1"})
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast['Elemental Magic'] = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Pemphredo Tathlum", 
		head=gear_merlinic_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring", 
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem", 
		head=gear_merlinic_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head=gear_merlinic_nuke_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Defending Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Amalric Slops +1", feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem",
		-- Duelist Torque +2
		head=empty, neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Regal Cuffs Stikini Ring +1 Stikini Ring +1
		body="Twilight Cloak", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Vitiation Boots +3
		back=gear.Macc_jse_back, waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity",ammo="Pemphredo Tathlum",
		--sub="Ammurapi Shield",
		head="Amalric Coif +1" ,neck="Incanter's Torque", ear1="Regal Earring", ear2="Digni. Earring",
		--body="Atrophy Tabard +3",
		body="Ayanmo Corazza +2", hands="Leth. Gantherots +1", ring1="Stikini Ring", ring2="Stikini Ring",
		--feet=gear.merlinic_nuke_feet
		back=gear.Macc_jse_back,waist="Luminary Sash",legs="Psycloth Lappas", feet=gear_merlinic_aspir_feet}

    sets.midcast.Drain = {main="Rubicundity", ammo="Pemphredo Tathlum",
		-- sub="Ammurapi Shield",
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Regal Earring", ear2="Digni. Earring",
        -- Shango Robe 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
        --feet=gear.chironic_nuke_feet
		back=gear.Macc_jse_back, waist="Fucho-no-obi", legs="Psycloth Lappas", feet=gear_merlinic_aspir_feet}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		head="Atro. Chapeau +1", neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Psycloth Lappas", feet=gear_merlinic_aspir_feet}
	sets.midcast.Stun.Resistant = {main="Oranyan", sub="Clerisy Strap +1", mmo="Regal Gem",
		head="Atro. Chapeau +1", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Macc_jse_back,waist="Luminary Sash",legs="Psycloth Lappas", feet=gear_merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Jhakri Robe +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.Weak = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back=gear.FC_jse_back,legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Sword = {main="Naegling", sub="Genbu's Shield"}
	sets.weapons.Mandau = {main="Mandau", sub="Genbu's Shield"}
	sets.weapons.Sequence = {main="Sequence",sub="Genbu's Shield"}
	sets.weapons.Almace = {main="Almace",sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Sequence",sub="Almace"}
	sets.weapons.DualDagger = {main="Mandau", sub="Almace"}
	sets.weapons.DualClubs = {main="Kaja Rod", sub="Nibiru Cudgel"}
	sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	--	sets.engaged = {ammo="Ginsen",
	--	head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
	--	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
	--	back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Cessance Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.Cape_TP,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Cessance Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.Cape_TP,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Cessance Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.Cape_TP,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Cessance Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.Cape_TP,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(5, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 3)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 3)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'WHM' then
		set_macro_page(4, 3)
	elseif player.sub_job == 'WAR' then
		set_macro_page(6, 3)
	else
		set_macro_page(1, 3)
	end
end

function user_job_self_command(commandArgs, eventArgs)

end


buff_spell_lists = {
	Auto = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		--{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		--{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
}