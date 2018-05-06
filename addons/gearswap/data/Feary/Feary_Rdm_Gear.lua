function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Default','DualWeapons','DualDagger','DualClubs')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = {name="Ghostfyre Cape"}
	-- MND Macc
	gear.Cape_Macc = {name="Sucello's Cape"}
	gear.Cape_Fastcast = {name="Sucello's Cape"}
	gear.Cape_TP = {name="Sucello's Cape"}
	gear.Cape_WS = {name="Sucello's Cape"}
	
	-- Waist Replacements
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Sekhmet Corset"

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
	sets.precast.FC = {ammo="Impatiens",
		head="Atrophy Chapeau", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Vitiation Tabard", hands="Gende. Gages +1", lring="Prolix Ring",
		-- 
		waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",			
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		-- Aug.Cape.RDM.WS
		back="Ground. Mantle +1", waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau Sherida Earring
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Taeon Tabard Taeon Gloves Begruding Ring Ilabrat Ring
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
		-- Aug.Cape.RDM.WS Taeon Tights Theroid Greaves
		back="Ground. Mantle +1", waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
		-- Despair Helm Caro Necklace 
		head="Carmine Mask +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
		-- Despair Mail Atrophy Gloves +3
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		-- Despair Trousers Despair Greaves
		back="Ground. Mantle +1", waist="Prosilio Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Aug.Cape.RDM.WS
		back="Ground. Mantle +1", waist="Fotia Belt", legs="Jhakri Slops +1", feet="Carmine Greaves +1"}

	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		--head="Ea Hat", 
		neck="Mizu. Kubikazari",
		-- body="Ea Houppelande",
		hands="Amalric Gages", ring1="Mujin Band",
		--legs="Ea Slops",
		feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {
		--head="Ea Hat", 
		neck="Mizu. Kubikazari",
		--body="Seidr Cotehardie", 
		hands="Amalric Gages", ring1="Mujin Band",
		--legs="Ea Slops", 
		feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}--main="Marin Staff +1"
	sets.element.Ice = {}--main="Ngqoqwanb"
	sets.element.Earth = {}--neck="Quanpur Necklace"

	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main="Vampirism",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",
		head="Atrophy Chapeau", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Vitiation Tabard", hands="Gende. Gages +1", lring="Prolix Ring",
		-- 28
		back="Ground. Mantle +1", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

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
		-- Kaykaus Bliaut  Cuffs Haoma's Ring Sirona's Ring
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Carmine Cuisses +1", feet="Kaykaus Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"
		
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
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"

	sets.midcast['Enhancing Magic'] = {--main="Colada",sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head=gear_telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring", ear2="Gifted Earring",
		body="Telchine Chas.", hands=gear_telchine_hands_Duration, ring1="Stikini Ring", ring2="Stikini Ring",
		back="Sucellos's Cape", waist="Olympus Sash", legs=gear_telchine_legs_Duration, feet="Leth. Houseaux"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel",
		body="Lethargy Sayon",
		legs="Leth. Fuseau",feet="Leth. Houseaux"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {body="Atrophy Tabard", legs="Leth. Fuseau"} -- head="Amalric Coif",
	sets.midcast.Aquaveil = {} -- head="Amalric Coif", hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {waist="Siegel Sash",} -- neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Staunch Tathlum",
			-- Incantor's Torque Digni. Earrings
			head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
			body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
			back="Ogapepo Cape", waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Staunch Tathlum",
			-- Incantor's Torque Digni. Earrings
			head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
			body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
			-- Luminary Sash
			back="Ogapepo Cape", waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {}) -- head="Amalric Coif +1",waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {}) --head="Amalric Coif +1",waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {hands="Leth. Gantherots", ring1="Stikini Ring"}) -- neck="Incanter's Torque",
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands="Jhakri Cuffs +1"})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {hands="Leth. Gantherots", ring1="Stikini Ring"})--neck="Incanter's Torque",
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands="Jhakri Cuffs +1"})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})--body="Atrophy Tabard +3"
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Vitiation Chapeau"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Vitiation Chapeau"})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Vitiation Chapeau"})
	
    sets.midcast['Elemental Magic'] = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		-- Sanctity Necklace
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Aug.Cape.RDM.Macc
		back="Toro Cape", waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Resistant = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		-- Sanctity Necklace
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Aug.Cape.RDM.Macc
		back="Toro Cape", waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Fodder = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, 
		-- Sanctity Necklace
		head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Aug.Cape.RDM.Macc
		back="Toro Cape", waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Jhakri Coronal +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Defending Ring",
		back="Toro Cape",waist="Witful Belt",legs="Amalric Slops", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Staunch Tathlum",
		-- Incantor's Torque Digni. Earrings
		head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.Cape_Macc, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",
		--head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		head="Appetence Crown", neck="Aesir Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Atrophy Tabard +3",hands="Leth. Gantherots +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Stikini Ring",ring2="Stikini Ring",
		--waist="Luminary Sash",legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet
		back=gear.Cape_Macc,waist="Ovate Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",
        --head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		head="Appetence Crown", neck="Aesir Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
        -- Shango Robe 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +1", ring1="Stikini Ring",ring2="Stikini Ring",
        --back=gear.Cape_Macc, waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet
		back=gear.Cape_Macc,waist="Ovate Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		--legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}
		back=gear.Cape_Macc, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	sets.midcast.Stun.Resistant = {main="Serenity",sub="Enki Strap",ammo="Regal Gem",
		head="Carmine Mask +1", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Ayanmo Corazza +2", hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cape_Macc,waist="Ovate Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Vitiation Chapeau",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	

	-- Idle sets
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Vitiation Chapeau",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
	sets.idle.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
	sets.idle.Weak = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Moonbeam Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Shadow Ring",ring2="Defending Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
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
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen",
		head="Carmine Mask +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Ilabrat Ring",
		back="Ground. Mantle +1",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Carmine Mask +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Rajas Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Ayanmo Gambieras +1"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Loricate Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Dark Ring",ring2="Defending Ring",
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