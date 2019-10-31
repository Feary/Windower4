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
	state.Weapons:options('None','Sword','Dagger', 'DualWeapons','DualDagger','DualClubs')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = 		{name="Ghostfyre Cape",	 augments={'Enfb.mag. skill +4','Enha.mag. skill +10','Mag. Acc.+3',}}
	gear.Macc_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.nuke_jse_back = 	{name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.FC_jse_back =		{name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	
	gear.Cape_TP = {name="Sucellos's Cape"}
	gear.Cape_WS = {name="Sucellos's Cape"}
	
	-- Waist Replacements
	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Luminary Sash"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Luminary Sash"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Luminary Sash"

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
	send_command('bind !pause gs c toggle AutoSubMode')
	
	send_command('alias ungear gs equip naked;exec dasmir/ungearrdm.txt')
	send_command('alias gear exec dasmir/gearrdm.txt')
	
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
	sets.precast.FC = {ammo="Hasty Pinion +1",
		head="Atro. Chapeau +2", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		-- legs="Psycloth Lappas", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {head="Leth. Chappel +1"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {--ammo="Ginsen",
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Ilabrat Ring", 
		back=gear.Cape_WS, waist="Windbuffet Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau 
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves lring="Epaminodas's Ring", 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		--  Taeon Tights feet="Theroid Greaves"
		back=gear.Cape_WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

	sets.precast.WS['Savage Blade'] = {--ammo="Ginsen",
		-- Despair Helm Caro Necklace 
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
		-- Despair Mail Atrophy Gloves +3 lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		-- Despair Trousers Despair Greaves
		back=gear.Cape_WS, waist="Prosilio Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		--head="Carmine Mask +1", lear="Crematio Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Regal Earring", rear="Friomisi Earring",
		-- lring="Epaminodas's Ring", 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.Cape_WS, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}

	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs="Volte Hose", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Kaja Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		--head="Ea Hat +1", 
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		body="Jhakri Robe +2", hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {main="Kaja Rod", sub="Ammurapi Shield",
		-- head="Ea Hat +1", 
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Seidr Cotehardie"
		body="Jhakri Robe +2",hands="Amalric Gages", ring1="Mujin Band", ring2="Shiva Ring",
		-- waist="Refoccilation Stone", legs="Ea Slops +1",
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main="Naegling",sub="Thuellaic Ecu +1",ammo="Regal Gem",
		head="Atro. Chapeau +2", beck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

    sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Thuellaic Ecu +1", priority=1}, ammo="Regal Gem",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring 
		body="Viti. Tabard +1", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +2", feet="Carmine Greaves +1"}

    sets.midcast.LightWeatherCure = {main={name="Iridal Staff", priority=2}, sub={name="Clerisy Strap +1", priority=1}, ammo="Regal Gem",
		--head="Vanya Hood",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring
		body="Viti. Tabard +1", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs  feet="Kaykaus Boots"
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Atrophy Tights +2", feet="Carmine Greaves +1"}
	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main={name="Tamaxchi", priority=2}, sub={name="Thuellaic Ecu +1", priority=1}, ammo="Regal Gem",
		-- head="Vanya Hood", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Cuffs Haoma's Ring Sirona's Ring
		body="Viti. Tabard +1", hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +2", feet="Carmine Greaves +1"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",feet="Vanya Clogs"
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Grioavolr", sub="Clemency Grip"})--main="Oranyan",
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.Self_Healing = {
		neck="Phalaina Locket",ear1="Etiolation Earring",
		--hands="Buremte Gloves", ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Cure_Received = {
		neck="Phalaina Locket", 
		--hands="Buremte Gloves",ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash"
	
	-- Duration
	sets.midcast['Enhancing Magic'] = {sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		-- main="Pukulatmuj +1",
		-- Duelist's Torque +2  rear="Augment. Earring",
		head=gear_telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring", 
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs=gear_telchine_legs_Duration, feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",		
		--Duelist's Torque +2 neck="Incanter's Torque", rear="Augment. Earring",
		head="Leth. Chappel +1", neck="Colossus's Torque", ear1="Andoaa Earring", 
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Lethargy Sayon +1", hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs="Leth. Fuseau +1", feet="Leth. Houseaux +1"}
	
	-- Phalanx Potency
	sets.midcast.Phalanx = {sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		head=gear_taeon_head_Phalanx, neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring", 
		-- Vitiation Tabard +3 Stikini Ring +1 Stikini Ring +1
		body=gear_telchine_body_Duration, hands=gear_taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Olympus Sash",
		back=gear.JSE_Cape, waist="Cascade Belt", legs=gear_taeon_legs_Phalanx, feet=gear_taeon_feet_Phalanx}
		
	-- Enhancing Magic Skill set
	sets.midcast['Temper'] = {sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--neck="Incanter's Torque", Duelist's Torque +2  rear="Augment. Earring",
		head="Befouled Crown", neck="Colossus's Torque", ear1="Andoaa Earring",
		-- Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3 Olympus Sash
		back=gear.JSE_Cape,waist="Cascade Belt",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
	sets.midcast['Temper II'] = {sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		-- Duelist's Torque +2 ear2="Augment. Earring",
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring", 
		-- Viti. Tabard +1 +3 Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3 Olympus Sash
		back=gear.JSE_Cape, waist="Cascade Belt",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif",body="Atrophy Tabard +2", hands="Atrophy Gloves +2",  legs="Leth. Fuseau +1"} --  back="Grapevine Cape",waist="Gishdubar Sash",
	sets.midcast.Aquaveil = {head="Amalric Coif",} --  hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {waist="Siegel Sash",} -- neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {main={name="Naegling", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Regal Gem",
			--   Duelist's Torque +3 neck="Incanter's Torque",  lear="Digni. Earring", 
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Enchntr. Earring +1", rear="Regal Earring", 
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +2", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			--  legs=gear_chironic_macc_legs,
			back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Vitiation Boots +1"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Naegling", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Regal Gem",
			--   Duelist's Torque +3 neck="Incanter's Torque",  lear="Digni. Earring", 
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Enchntr. Earring +1", rear="Regal Earring", 
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +2", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			--  legs=gear_chironic_macc_legs,
			back=gear.Macc_jse_back, waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Vitiation Boots +1"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif", waist="Acuity Belt"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif", waist="Acuity Belt"}) 
	
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
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1", legs="Viti.  Tights +1"})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Viti. Chapeau +1"})
	
	sets.midcast['Blind II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1",legs="Viti. Tights +1"})

	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast['Elemental Magic'] = {main={name="Naegling", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Pemphredo Tathlum", 
		-- gear_merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1  Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Belt Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Resistant = {main={name="Naegling", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Regal Gem", 
		-- gear_merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Belt Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty, ammo="Pemphredo Tathlum",
        -- gear_merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1  Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Eschan Belt Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main={name="Naegling", priority=2}, sub={name="Ammurapi Shield", priority=1}, ammo="Regal Gem", 
		-- Duelist Torque +2
		head=empty, neck="Erra Pendant", lear="Enchntr. Earring +1", rear="Regal Earring",
		-- Regal Cuffs Stikini Ring +1 Stikini Ring +1
		body="Twilight Cloak", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Vitiation Boots +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- ear2="Digni. Earring",
		head="Atrophy Chapeau +2", neck="Erra Pendant", lear="Enchntr. Earring +1", rear="Regal Earring",
		--body="Atrophy Tabard +3",hands="Leth. Gantherots +1",
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- legs="Psycloth Lappas", feet=gear.merlinic_nuke_feet
		back=gear.Macc_jse_back,waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- ear2="Digni. Earring",
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Enchntr. Earring +1", ear2="Regal Earring", 
        -- Shango Robe 
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
        -- legs=gear_chironic_macc_legs, feet=gear.chironic_nuke_feet
		back=gear.Macc_jse_back, waist="Fucho-no-obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Naegling", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--sub="Clerisy Strap +1",
		head="Viti. Chapeau +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		--f legs=gear_chironic_macc_legs, eet=gear.merlinic_aspir_feet}
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2",  feet="Aya. Gambieras +2"}
	sets.midcast.Stun.Resistant = {main="Naegling",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		--body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- legs=gear_chironic_macc_legs,
		back=gear.Macc_jse_back,waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {-- ammo="Homiliary",
		main="Bolelabunga",sub="Genbu's Shield",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear_merlinic_refresh_hands,ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {--ammo="Homiliary",
		main="Bolelabunga",sub="Ammurapi Shield",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Jhakri Robe +2",hands=gear_merlinic_refresh_hands,ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.PDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.MDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.Weak = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back=gear.FC_jse_back,legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"
	
	-- Defense sets
	sets.defense.PDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
    sets.defense.MEVA = {-- ammo="Staunch Tathlum",
		main="Bolelabunga",sub="Genbu's Shield",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Volte Hose",feet="Aya. Gambieras +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Dagger = {main="Kaja Knife", sub="Ammurapi Shield"}
	sets.weapons.Sword = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Kaja Knife"}
	sets.weapons.DualDagger = {main="Kaja Knife", sub="Naegling"}
	sets.weapons.DualClubs = {main="Kaja Rod",sub="Bolelabunga"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	--	sets.engaged = {ammo="Ginsen",
	--	head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
	--	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
	--	back="Bleating Mantle",waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {--ammo="Ginsen",
		--  ear2="Cessance Earring",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Brutal Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		--
		back=gear.Cape_TP,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged.DW = {--ammo="Ginsen",
		--  ear2="Cessance Earring",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Sherida Earring", ear2="Brutal Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		--
		back=gear.Cape_TP,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.PhysicalDef = {--ammo="Ginsen",
		-- ear2="Cessance Earring",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Sherida Earring", ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.Cape_TP,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.engaged.MagicalDef = {--ammo="Ginsen",
		-- ear2="Cessance Earring",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Sherida Earring", ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.Cape_TP,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

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