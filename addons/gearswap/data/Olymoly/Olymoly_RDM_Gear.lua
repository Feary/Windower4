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
	gear.JSE_Cape = {name="Ghostfyre Cape"}
	-- MND Macc M.DMG
	gear.Cape_Macc = {name="Sucello's Cape"}
	-- INT MACC M.DMG
	gear.Cape_Nuke = {name="Sucello's Cape"}
	-- FC MP -dt 
	gear.Cape_Fastcast = {name="Sucello's Cape"}
	gear.Cape_Cure = {name="Sucello's Cape"}
	gear.Cape_TP = {name="Sucello's Cape"}
	gear.Cape_WS = {name="Sucello's Cape"}
	
	-- Waist Replacements
	gear.obi_cure_back = gear.Cape_Cure
	gear.obi_cure_waist = "Luminary Sash"

	gear.obi_low_nuke_back = gear.Cape_Nuke
	gear.obi_low_nuke_waist = "Yamabuki-no-Obi"

	gear.obi_high_nuke_back = gear.Cape_Nuke
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"

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
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Vitiation Tabard"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	-- RDM gets 30 FC from traits and up to 8 more from JP gifts. 80-38=42 
	sets.precast.FC = {
		head="Atrophy Chapeau", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Vitiation Tabard", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.Cape_Fastcast, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",			
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Epaminodas's Ring", rring="Shukuyu Ring",
		back=gear.Cape_WS, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau 
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Begruding Ring", rring="Ilabrat Ring",
		-- Aug.Cape.RDM.WS Taeon Tights Theroid Greaves
		back=gear.Cape_WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
		-- Despair Helm Caro Necklace 
		head="Carmine Mask +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
		-- Despair Mail Atrophy Gloves +3
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminodas's Ring", rring="Shukuyu Ring",
		-- Despair Trousers Despair Greaves
		back=gear.Cape_WS, waist="Prosilio Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminodas's Ring", rring="Shiva Ring +1",
		-- Aug.Cape.RDM.WS
		back=gear.Cape_WS, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}

	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--head="Ea Hat +1", 
		neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring +1",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.Cape_Nuke, waist="Yamabuki-no-Obi", feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {
		-- head="Ea Hat +1", 
		neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Seidr Cotehardie"
		hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring +1",
		-- waist="Refoccilation Stone", legs="Ea Slops +1",
		back=gear.Cape_Nuke, waist="Yamabuki-no-Obi", feet="Jhakri Pigaches +2"}
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main="Vampirism",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",
		head="Atrophy Chapeau", beck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Vitiation Tabard", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.Cape_Nuke, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

    sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Thuellaic Ecu +1", priority=1}, ammo="Esper Stone +1",
		-- head="Vanya Hood", neck="Nodens Gorget", lear="Mendi. Earring"
		head="Atrophy Chapeau", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring 
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back="Tempered Cape +1", waist="Bishop's Sash", legs="Carmine Cuisses +1", feet="Kaykaus Boots"}

    sets.midcast.LightWeatherCure = {main={name="Chatoyant Staff", priority=2}, sub={name="Curatio Grip", priority=1}, ammo="Esper Stone +1",
		-- head="Vanya Hood", neck="Nodens Gorget", lear="Mendi. Earring"
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Carmine Cuisses +1", feet="Kaykaus Boots"}
	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main={name="Tamaxchi", priority=2}, sub={name="Thuellaic Ecu +1", priority=1}, ammo="Esper Stone +1",
       -- head="Vanya Hood", neck="Nodens Gorget", lear="Mendi. Earring"
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
		-- Kaykaus Bliaut Cuffs Haoma's Ring Sirona's Ring
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Carmine Cuisses +1", feet="Kaykaus Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",feet="Vanya Clogs"
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan"})--,sub="Clemency Grip"
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.Self_Healing = {
		neck="Phalaina Locket",ear1="Etiolation Earring",
		hands="Buremte Gloves", ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Cure_Received = {
		neck="Phalaina Locket", 
		hands="Buremte Gloves",ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Self_Refresh = {back="Grapevine Cape",}--waist="Gishdubar Sash"
	sets.midcast.Phalanx = {
		-- Incanter's Torque"
		head=gear_taeon_head_Phalanx, neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring", }
		-- Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands=gear_taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		-- 
		back="Ghostfyre Cape", waist="Olympus Sash", legs=gear_taeon_legs_Phalanx, feet=gear_taeon_feet_Phalanx}
		
	-- Duration
	sets.midcast['Enhancing Magic'] = {ammo="Hasty Pinion +1",
		-- main="Arendsi Fleuret",sub="Ammurapi Shield",
		-- neck="Incanter's Torque" Duelist's Torque +2 rear="Augment. Earring"
		head=gear_telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring",
		-- Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, ring1="Stikini Ring", ring2="Stikini Ring",
		back="Ghostfyre Cape", waist="Olympus Sash", legs=gear_telchine_legs_Duration, feet="Leth. Houseaux"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Ammurapi Shield",		
		--neck="Incanter's Torque" Duelist's Torque +2 rear="Augment. Earring"
		head="Leth. Chappel", neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring",
		-- Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Lethargy Sayon", hands=gear_telchine_hands_Duration, ring1="Stikini Ring", ring2="Stikini Ring",
		back="Ghostfyre Cape", waist="Olympus Sash", legs="Leth. Fuseau", feet="Leth. Houseaux"}
	
	-- Phalanx Potency
	sets.midcast.Phalanx = {
		-- Incanter's Torque"
		head=gear_taeon_head_Phalanx, neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring", }
		-- Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands=gear_taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		-- 
		back="Ghostfyre Cape", waist="Olympus Sash", legs=gear_taeon_legs_Phalanx, feet=gear_taeon_feet_Phalanx}
		
	-- Enhancing Magic Skill set
	sets.midcast.['Temper'] = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--neck="Incanter's Torque" Duelist's Torque +2 rear="Augment. Earring"
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		-- Vitiation Tabard +3 Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Vitiation Tabard",hands="Vitiation Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3
		back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Leth. Houseaux"}
	sets.midcast.['Temper II'] = {ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--neck="Incanter's Torque" Duelist's Torque +2 rear="Augment. Earring"
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		-- Vitiation Tabard +3 Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Vitiation Tabard",hands="Vitiation Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3
		back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Leth. Houseaux"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {body="Atrophy Tabard", back="Grapevine Cape", legs="Leth. Fuseau"} -- head="Amalric Coif +1", hands="Atrophy Gloves +3", waist="Gishdubar Sash", back
	sets.midcast.Aquaveil = {} -- head="Amalric Coif", hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {waist="Siegel Sash",} -- neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem",
			-- head="Atrophy Chapeau +3", neck="Incantor's Torque", Duelist's Torque +3
			head="Carmine Mask +1", neck="Erra Pendant", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Jhakri Robe +2", hands="Leth. Gantherots", lring="Stikini Ring", rring="Stikini Ring",
			-- feet="Vitiation Boots +3"
			back=gear.Cape_Macc, waist="Luminary Sash", legs=gear_chironic_macc_legs, feet="Jhakri Pigaches +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem",
			-- head="Atrophy Chapeau +3", neck="Incantor's Torque", Duelist's Torque +3
			head="Carmine Mask +1", neck="Erra Pendant", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Jhakri Robe +2", hands="Leth. Gantherots", lring="Stikini Ring", rring="Stikini Ring",
			-- feet="Vitiation Boots +3"
			back=gear.Cape_Macc, waist="Luminary Sash", legs=gear_chironic_macc_legs, feet="Jhakri Pigaches +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {}) -- head="Amalric Coif +1",waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {}) --head="Amalric Coif +1",waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Vitiation Chapeau"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Vitiation Chapeau"})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Vitiation Chapeau"})
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast['Elemental Magic'] = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Pemphredo Tathlum", 
		-- 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Path A Amalric Gages +1 Path D 
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Amalric Slops +1 Path A Amalric Nails +1 Path A
		back=gear.Cape_Nuke, waist="Yamabuki-no-Obi", legs="Amalric Slops", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Resistant = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem", 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Path A Amalric Gages +1 Path D 
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Amalric Slops +1 Path A Amalric Nails +1 Path A
		back=gear.Cape_Nuke, waist="Yamabuki-no-Obi", legs="Amalric Slops", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Jhakri Coronal +2",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Defending Ring",
		back=gear.Cape_Nuke,waist="Yamabuki-no-Obi",legs="Amalric Slops", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main={name="Oranyan", priority=2}, sub={name="Enki Strap", priority=1}, ammo="Regal Gem",
		-- Duelist Torque +2
		head=empty, neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Regal Cuffs Stikini Ring +1 Stikini Ring +1
		body="Twilight Cloak", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Vitiation Boots +3
		back=gear.Cape_Macc, waist="Luminary Sash", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity",ammo="Pemphredo Tathlum",
		--sub="Ammurapi Shield",
		--head="Amalric Coif +1",neck="Incanter's Torque",
		head="Appetence Crown", neck="Erra Pendant", ear1="Regal Earring",ear2="Digni. Earring",
		--body="Atrophy Tabard +3",hands="Leth. Gantherots +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Stikini Ring",ring2="Stikini Ring",
		--legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet
		back=gear.Cape_Macc,waist="Luminary Sash",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

    sets.midcast.Drain = {main="Rubicundity", ammo="Pemphredo Tathlum",
		-- sub="Ammurapi Shield",
		head="Pixie Hairpin +1". neck="Erra Pendant", ear1="Regal Earring",ear2="Digni. Earring",
        -- Shango Robe 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Stikini Ring",ring2="Stikini Ring",
        --feet=gear.chironic_nuke_feet
		back=gear.Cape_Macc, waist="Fucho-no-obi", legs=gear_chironic_macc_legs,feet="Aya. Gambieras +2"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan", sub="Enki Strap", ammo="Hasty Pinion +1",
		--sub="Clerisy Strap +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		--feet=gear.merlinic_aspir_feet}
		back=gear.Cape_Macc, waist="Witful Belt", legs=gear_chironic_macc_legs, feet="Aya. Gambieras +2"}
	sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Regal Gem",
		head="Carmine Mask +1", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cape_Macc,waist="Luminary Sash",legs=gear_chironic_macc_legs,feet="Aya. Gambieras +2"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Vitiation Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Vitiation Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Jhakri Robe +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Catpe",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.Weak = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Moonbeam Cape",legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Mandau = {main="Mandau", sub="Genbu's Shield"}
	sets.weapons.Sequence = {main="Sequence",sub="Genbu's Shield"}
	sets.weapons.Almace = {main="Almace",sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Sequence",sub="Almace"}
	sets.weapons.DualDagger = {main="Mandau", sub="Almace"}
	sets.weapons.DualClubs = {main="Mafic Club",sub="Bolelabunga"}
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
		head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rajas Ring",ring2="Ilabrat Ring",
		back="Ground. Mantle +1",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Ayanmo Gambieras +1"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Ayanmo Gambieras +1"}

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
	else
		set_macro_page(1, 3)
	end
end

function user_job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'buffup' then
		
		if check_arts() then return end
		
		if buffactive.Composure and buffactive.Refresh and buffactive.Haste and buffactive.Regen and buffactive.Aquaveil and buffactive.Phalanx and buffactive.Stoneskin and buffactive.Blink and  buffactive.Shell and buffactive.Protect and buffactive['INT Boost'] and buffactive['Shock Spikes'] and buffactive['Enthunder II'] and buffactive['Multi Strikes'] and buffactive.Barfire and buffactive.Barparalyze then
			buffup = false
			add_to_chat(217, 'All buffs are currently up!')
			return
		elseif not (player.status == 'Idle' or player.status == 'Engaged') then
			buffup = false
			return
		end
		
		buffup = true
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive.Composure then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[50] == 0 then
				windower.chat.input('/ja "Composure" <me>')
			else
				buffup = false
				add_to_chat(123,'Abort: Composure not ready.')
			end
			return
		elseif not buffactive.Refresh and spell_recasts[894] == 0 then
			windower.chat.input('/ma "Refresh II" <me>')
		elseif not buffactive.Haste and spell_recasts[511] == 0 then
			windower.chat.input('/ma "Haste II" <me>')
		elseif not buffactive.Regen and spell_recasts[110] == 0 then
			windower.chat.input('/ma "Regen II" <me>')
		elseif not buffactive.Aquaveil and spell_recasts[55] == 0 then
			windower.chat.input('/ma "Aquaveil" <me>')
		elseif not buffactive.Phalanx and spell_recasts[106] == 0 then
			windower.chat.input('/ma "Phalanx" <me>')
		elseif not buffactive.Stoneskin and spell_recasts[54] == 0 then
			windower.chat.input('/ma "Stoneskin" <me>')
		elseif not buffactive.Blink and spell_recasts[53] == 0 then
			windower.chat.input('/ma "Blink" <me>')		
		elseif not buffactive.Shell and spell_recasts[52] == 0 then
			windower.chat.input('/ma "Shell V" <me>')
		elseif not buffactive.Protect and spell_recasts[47] == 0 then
			windower.chat.input('/ma "Protect V" <me>')
		end
	end
	
	if commandArgs[1]:lower() == 'buffup2' then		
		if check_arts() then return end
		
		if buffactive.Composure and buffactive['INT Boost'] and buffactive['Shock Spikes'] and buffactive['Enthunder II'] and buffactive['Multi Strikes'] and buffactive.Barfire and buffactive.Barparalyze then
			buffup = false
			add_to_chat(217, 'All buffs are currently up!')
			return
		elseif not (player.status == 'Idle' or player.status == 'Engaged') then
			buffup = false
			return
		end
		
		buffup = true
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive.Composure then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[50] == 0 then
				windower.chat.input('/ja "Composure" <me>')
			else
				buffup = false
				add_to_chat(123,'Abort: Composure not ready.')
			end
			return
		elseif not buffactive['INT Boost'] and spell_recasts[490] == 0 then
			windower.chat.input('/ma "Gain-INT" <me>')
		elseif not buffactive['Shock Spikes'] and spell_recasts[251] == 0 then
			windower.chat.input('/ma "Shock Spikes" <me>')
		elseif not buffactive['Enthunder II'] and spell_recasts[316] == 0 then
			windower.chat.input('/ma "Enthunder II" <me>')
		elseif not buffactive['Multi Strikes'] and spell_recasts[895] == 0 then
			windower.chat.input('/ma "Temper" <me>')
		elseif not buffactive.Barfire and spell_recasts[60] == 0 then
			windower.chat.input('/ma "Barfire" <me>')
		elseif not buffactive.Barparalyze and spell_recasts[74] == 0 then
			windower.chat.input('/ma "Barparalyze" <me>')
		end
	end
end