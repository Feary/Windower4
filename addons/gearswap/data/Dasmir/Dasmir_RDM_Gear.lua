function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Dagger','Sword','DualWeapons','DualWeaponsAcc','DualDagger','DualEvisceration','DualAeolian','DualProcDaggers','EnspellOnly','DualClubs','DualBlackHalo','DualBow','BowMacc')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = 		{name="Ghostfyre Cape",	 augments={'Enfb.mag. skill +4','Enha.mag. skill +10','Mag. Acc.+3',}}
	gear.Macc_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.nuke_jse_back = 	{name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.FC_jse_back =		{name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	
	-- DEX +20/Accuracy +30/Attack +20/Dual Wield +10].
	gear.dw_jse_back =		{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.stp_jse_back	=		{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.ws_jse_back 	= 		{name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	
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
	sets.precast.FC = {main="Mafic Cudgel", sub="Genmei Shield", ammo="Hasty Pinion +1",
		-- sub="Sacro Bulwark", ammo="Staunch Tathlum +1"
		-- head="Atro. Chapeau +3", 
		head="Atro. Chapeau +2", neck="Loricate Torque +1", ear1="Etiolation Earring", rear="Malignance Earring",
		-- Viti. Tabard +3  Malignance Gloves
		body="Viti. Tabard +1", hands="Aya. Manopolas +2", lring=gear.DarkRing, rring="Defending Ring",
		-- legs="Malignance Tights", feet="Malignance Boots" 
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
		back=gear.ws_jse_back, waist="Windbuffet Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Swords
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau 
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves lring="Epaminodas's Ring", 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		--  Taeon Tights feet="Theroid Greaves"
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {--ammo="Ginsen",
		-- Viti. Chapeau +3 Duelist's Torque +2 
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Atrophy Gloves +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		-- Safili Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		--head="Carmine Mask +1", lear="Crematio Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Doublet +1", lring="Epaminodas's Ring", 
		body="Shamash Robe", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Freke Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
	
	-- Dagger 
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		-- Taeon Chapeau 
		head="Aya. Zucchetto +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Sherida Earring",
		-- Taeon Tabard Taeon Gloves lring="Epaminodas's Ring", 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		--  Taeon Tights feet="Theroid Greaves"
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Thereoid Greaves"})
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
		--head="Carmine Mask +1", lear="Crematio Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Amalric Doublet +1", lring="Epaminodas's Ring", 
		body="Shamash Robe", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Freke Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Amalric Nalis"}
	
	-- Club 
	sets.precast.WS['Black Halo'] = {--ammo="Ginsen",
		-- Viti. Chapeau +3 Duelist's Torque +2 
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 lring="Epaminodas's Ring",
		body="Ayanmo Corazza +2", hands="Atrophy Gloves +2", lring="Rufescent Ring", rring="Ilabrat Ring",
		-- Safili Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
	
	-- H2H 
	sets.precast.WS['Asuuran Fists'] = {}
	
	-- Bow 
	sets.precast.WS['Empreal Arrow'] = {}

	-- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs="Volte Hose", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		--head="Ea Hat +1", 	
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		body="Shamash Robe", hands="Amalric Gages", ring1="Mujin Band", ring2="Freke Ring",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {main="Kaja Rod", sub="Ammurapi Shield",
		-- head="Ea Hat +1", 
		head="Atro. Chapeau +2", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Seidr Cotehardie"
		body="Shamash Robe",hands="Amalric Gages", ring1="Mujin Band", ring2="Freke Ring",
		-- waist="Refoccilation Stone", legs="Ea Slops +1",
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		head="Atro. Chapeau +2", beck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

    sets.midcast.Cure = {main="Tamaxchi", sub="Thuellaic Ecu +1", ammo="Regal Gem",
		--head="Vanya Hood", neck="Incanter's Torque", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring 
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Atrophy Tights +2", feet="Carmine Greaves +1"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Clerisy Strap +1", ammo="Regal Gem",
		--head="Vanya Hood",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Kaykaus Cuffs Haoma's Ring
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Sirona's Ring",
		-- Atrophy Tights +3 Vanya Clogs  feet="Kaykaus Boots"
		back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Atrophy Tights +2", feet="Carmine Greaves +1"}
	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Tamaxchi", sub="Thuellaic Ecu +1", ammo="Regal Gem",
		-- head="Vanya Hood", lear="Mendi. Earring",
		head="Atro. Chapeau +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Novia Earring",
		-- Kaykaus Bliaut Cuffs Haoma's Ring Sirona's Ring
		body="Viti. Tabard +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
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
	sets.midcast['Enhancing Magic'] = {main="Naegling", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		-- main="Pukulatmuj +1",
		-- Duelist's Torque +2  
		head=gear.telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body=gear.telchine_body_Duration, hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {main="Naegling", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",		
		--Duelist's Torque +2 neck="Incanter's Torque", 
		head="Leth. Chappel +1", neck="Colossus's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Vitiation Tabard +3 Atrophy Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Lethargy Sayon +1", hands="Atrophy Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs="Leth. Fuseau +1", feet="Leth. Houseaux +1"}
	
	-- Phalanx Potency
	sets.midcast.Phalanx = {main="Naegling", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--  neck="Incanter's Torque", 
		head=gear.taeon_head_Phalanx, neck="Colossus's Torque", ear1="Andoaa Earring", ear2="Gifted Earring", 
		-- Vitiation Tabard +3 Stikini Ring +1 Stikini Ring +1
		body=gear.telchine_body_Duration, hands=gear.taeon_hands_Phalanx, ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.JSE_Cape, waist="Olympus Sash", legs=gear.taeon_legs_Phalanx, feet=gear.taeon_feet_Phalanx}
		
	-- Enhancing Magic Skill set
	sets.midcast['Temper'] = {main="Naegling", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		--neck="Incanter's Torque", Duelist's Torque +2  
		head="Befouled Crown", neck="Colossus's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3
		back=gear.JSE_Cape,waist="Olympus Sash",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
	sets.midcast['Temper II'] = {main="Naegling",  sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1",sub="Arendsi Fleuret",		
		-- Duelist's Torque +2 
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring", ear2="Augment. Earring",
		-- Viti. Tabard +1 +3 Vitiation Gloves +3 Stikini Ring +1 Stikini Ring +1
		body="Viti. Tabard +1",hands="Viti. Gloves +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Atrophy Tights +3 
		back=gear.JSE_Cape, waist="Olympus Sash",legs="Atrophy Tights +2",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif",body="Atrophy Tabard +2", hands="Atrophy Gloves +2",  legs="Leth. Fuseau +1"} --  back="Grapevine Cape",waist="Gishdubar Sash",
	sets.midcast.Aquaveil = {head="Amalric Coif",} --  hands="Regal Cuffs",waist="Emphatikos Rope", legs="Shedir Seraweels"
	sets.midcast.BarElement = {} --legs="Shedir Seraweels"
	sets.midcast.Stoneskin = {waist="Siegel Sash",} -- neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	-- Enfeebling Magic
	-- Path F = Full Potency Gear
	sets.midcast['Enfeebling Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Regal Gem",
			-- Vitiation Chapeau +3 Duelist's Torque +3 neck="Incanter's Torque",
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
			--  body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Lethargy Sayon +1", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Vitiation Boots +1"}
	
	-- Path A - Pure Macc No Potency
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Ullr",
			--  Duelist's Torque +3 neck="Incanter's Torque", 
			head="Atro. Chapeau +2", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
			-- body="Atrophy Tabard +3", hands="Kaykaus Cuffs +1", Stikini Ring +1 Stikini Ring +1
			body="Atrophy Tabard +2", hands="Leth. Gantherots +1", lring="Stikini Ring", rring="Stikini Ring",
			back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Vitiation Boots +1"}
	
	sets.midcast['Sleep'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Sleep II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Sleepga'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Silence'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Inundation'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Dispel'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Break'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Bind'] = sets.midcast['Enfeebling Magic'].Resistant
	
	-- Path C Int + Potency Gear
	-- Blind
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back})
	
	sets.midcast['Blind'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1", legs="Viti. Tights +1"})
	sets.midcast['Blind II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1", legs="Viti. Tights +1"})
	
	-- Path B MND + Potency Gear
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +2"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {body="Atrophy Tabard +2"})

	sets.midcast['Paralyze'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Paralyze II'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Addle'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Addle II'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Slow II'] = set_combine(sets.midcast.MndEnfeebles, {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast.MndEnfeebles, {head="Viti. Chapeau +1"})
	
	-- Path D Enfeebling Skill + Potency Gear
	-- Poison II
	sets.midcast['Poison'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Poison II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Poisonga'] = set_combine(sets.midcast['Enfeebling Magic'], {})
 
	-- Path E - Enfeebling Skill + MND + Potency
	sets.midcast['Distract'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Distract II'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract II'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle II'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle II'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {})
	
	-- Path F - Seperated For AF
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter, {head="Viti. Chapeau +1"})


	sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif", waist="Acuity Belt"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif", waist="Acuity Belt"}) 
    
	-- Divine Magic 
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	-- Elemental Magic 
	sets.midcast['Elemental Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum", 
		-- gear.merlinic_nuke_head 
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Amalric Doublet +1 Amalric Gages +1   
		body="Shamash Robe", hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Regal Gem", 
		-- gear.merlinic_nuke_head rear="Malignance Earring",
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1
		body="Shamash Robe", hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty, ammo="Pemphredo Tathlum",
        -- gear.merlinic_nuke_head
		head="Atro. Chapeau +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1 
		body="Shamash Robe", hands="Amalric Gages", lring="Freke Ring", rring="Shiva Ring",
		-- Eschan Stone Amalric Slops +1
		back=gear.nuke_jse_back, waist="Acuity Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main="Daybreak", sub="Ammurapi Shield", ranged="Ullr", ammo=empty,
		-- Duelist Torque +2 
		head=empty, neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
		-- Regal Cuffs Stikini Ring +1 Stikini Ring +1
		body="Twilight Cloak", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Vitiation Boots +3
		back=gear.Macc_jse_back, waist="Luminary Sash", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Ammurapi Shield", ranged="Ullr", ammo=empty,
		head="Atrophy Chapeau +2", neck="Erra Pendant",  ear1="Regal Earring", ear2="Malignance Earring",
		--body="Atrophy Tabard +3", hands="Leth. Gantherots +1",
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- legs="Psycloth Lappas", feet=gear.merlinic_nuke_feet
		back=gear.Macc_jse_back,waist="Luminary Sash", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield", ranged="Ullr", ammo=empty,
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
        -- Shango Robe 
		body="Atrophy Tabard +2", hands="Aya. Manopolas +2", ring1="Stikini Ring", ring2="Stikini Ring",
        -- feet=gear.chironic_nuke_feet
		back=gear.Macc_jse_back, waist="Fucho-no-obi", legs=gear.chironic_macc_legs, feet="Aya. Gambieras +2"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		head="Viti. Chapeau +1",neck="Voltsurge Torque", ear1="Regal Earring", ear2="Malignance Earring",
		-- body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- feet=gear.merlinic_aspir_feet
		back=gear.Macc_jse_back, waist="Witful Belt",legs=gear.chironic_macc_legs, feet="Aya. Gambieras +2"}
		
	sets.midcast.Stun.Resistant = {gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ranged="Ullr", ammo=empty,
		head="Atrophy Chapeau +2", neck="Voltsurge Torque", ear1="Regal Earring", ear2="Malignance Earring",
		--body="Zendik Robe",
		body="Atrophy Tabard +2", hands="Leyline Gloves", ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Aya. Gambieras +2"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Daybreak",sub="Genmei Shield", -- ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {main="Daybreak",sub="Genmei Shield", -- ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- Stikini Ring +1 Stikini Ring +1
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.PDT = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1=gear.DarkRing,ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.MDT = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.idle.Weak = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back=gear.FC_jse_back,legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"
	
	-- Defense sets
	sets.defense.PDT = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield", -- ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Aya. Zucchetto +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Volte Hose",feet="Aya. Gambieras +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Dagger = {main="Tauret", sub="Ammurapi Shield",range="Ullr",ammo="Beetle Arrow"}
	sets.weapons.Sword = {main="Naegling", sub="Ammurapi Shield",range="Ullr",ammo="Beetle Arrow"} 
	sets.weapons.DualWeapons = {main="Naegling", sub="Tauret"}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Tauret"}
	sets.weapons.DualDagger = {main="Tauret", sub="Naegling"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Almace"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Kaja Rod"}
	sets.weapons.DualProcDaggers = {main="Blurred Knife +1",sub="Atoyac"}
	sets.weapons.EnspellOnly = {main="Ceremonial Dagger",sub="Ceremonial Dagger",range="Ullr",ammo="Beetle Arrow"}	
	sets.weapons.DualClubs = {main="Daybreak", sub="Kaja Rod"}
	sets.weapons.DualBlackHalo = {main="Kaja Rod",sub="Daybreak"}
	sets.weapons.DualBow = {main="Naegling",sub="Tauret",range="Ullr"}
	sets.weapons.BowMacc = {range="Ullr",ammo=empty}
	
    sets.buff.Sublimation = {} -- waist="Embla Sash"
    sets.buff.DTSublimation = {} -- waist="Embla Sash"

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	--	sets.engaged = {ammo="Ginsen",
	--	head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
	--	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring", ring2="Ilabrat Ring",
	--	back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		-- Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.EnspellOnly = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- Dls. Torque +2 ear2="Hollow Earring",
		head="Umuthi Hat",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- Malignance Tabard
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ramuh Ring +1",
		-- Orpheus's Sash Malignance Tights 
		back=gear.dw_jse_back, waist="Reiki Yotai", legs="Aya. Cosciales +2",feet="Malignance Boots"}
		
	sets.engaged.DW = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", Chirich Ring +1 Chirich Ring +1
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
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