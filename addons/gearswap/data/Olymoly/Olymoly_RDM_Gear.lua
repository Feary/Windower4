function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT','MDT','DTHippo')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None', 'EnspellOnly','EnspellDW', 'Excalibur', 'Naegling', 'Almace', 'Mandau', 'Tauret', 'Club',	'DualWeapons','DualAlmace','DualDagger','DualEvisceration','DualAeolian','DualProcDaggers','DualClubs','DualBlackHalo')
	
	-- Augmented Capes
	-- Skill+ 10 Duration 10-20
	gear.JSE_Cape = 		{name="Ghostfyre Cape",	 augments={'Enfb.mag. skill +8','Enha.mag. skill +10','Mag. Acc.+3',}}
	gear.Macc_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.nuke_jse_back = 	{name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back =		{name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	-- DEX +20/Accuracy +30/Attack +20/Dual Wield +10].
	gear.dw_jse_back =		{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.stp_jse_back	=	{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.ws_jse_back 	= 	{name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
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
	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	
	select_default_macro_book()
	user_job_lockstyle()
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
	
	sets.precast.FC = {ammo="Sapience Orb", 
		head="Atro. Chapeau +1", neck="Orunmila's Torque", lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Psycloth Lappas", feet="Carmine Greaves +1"}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Sacro Bulwark"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen", -- Aurgelmir Orb +1
		-- Viti. Chapeau +3 Duelist Torque +2
		head="Carmine Mask +1", neck="Caro Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 Atrophy Gloves +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Metamor. Ring +1",
		-- Salifi Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
		
	sets.precast.WS.Proc = 	{range=empty,ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Regal Gem",
		-- Viti. Chapeau +3
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Regal Earring",
		-- body="Vititation Tabard +3", hands="Atrophy Gloves +3", lring="Metamor. Ring +1"
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Rufescent Ring",
		-- legs="Vititation Tights +3",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {ammo="Yetshila",
		-- Blistering Sallet +1 
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Mache Earring +1", rear="Sherida Earring", 
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- Zoar Subligar +1
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Thereoid Greaves"})	
		
	sets.precast.WS['Savage Blade'] = {ammo="Ginsen", -- Aurgelmir Orb +1
		-- Viti. Chapeau +3 Duelist Torque +2
		head="Carmine Mask +1", neck="Caro Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 Atrophy Gloves +3 rring="Metamor. Ring +1"
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Rufescent Ring",
		-- Salifi Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
	
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Regal Gem",
		-- Viti. Chapeau +3
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Regal Earring",
		-- body="Vititation Tabard +3", hands="Atrophy Gloves +3", lring="Metamor. Ring +1"
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Rufescent Ring",
		-- legs="Vititation Tights +3",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		-- head="C. Palug Crown" neck="Baetyl Pendant",
		head="Pixie Hairpin +1", neck="Fotia Gorget", ear1="Regal Earring", rear="Malignance Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		back=gear.ws_jse_back, wwaist="Orpheus's Sash", legs="Amalric Slops +1", feet="Carmine Greaves +1"}
		
	sets.precast.WS['Seraph Blade'] = {range=empty,ammo="Pemphredo Tathlum",
		-- C. Palug Crown neck="Baetyl Pendant", 
		head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Moonshade Earring", ear2="Regal Earring",
		-- rring="Freke Ring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",lring="Epaminondas's Ring",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.precast.WS['Death Blossom'] = {aammo="Ginsen", -- Aurgelmir Orb +1
		-- Viti. Chapeau +3 Duelist Torque +2
		head="Carmine Mask +1", neck="Caro Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 Atrophy Gloves +3 rring="Metamor. Ring +1"
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Rufescent Ring",
		-- Salifi Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
	sets.precast.WS['Knights of Round'] = {ammo="Ginsen", -- Aurgelmir Orb +1
		-- Viti. Chapeau +3 Duelist Torque +2
		head="Carmine Mask +1", neck="Caro Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 Atrophy Gloves +3 rring="Metamor. Ring +1"
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Rufescent Ring",
		-- Salifi Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}		
	
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']
	
	sets.precast.WS['Aeolian Edge'] = {range=empty,ammo="Pemphredo Tathlum",
		-- C. Palug Crown neck="Baetyl Pendant",
		head=gear.merlinic_nuke_head,neck="Sanctity Necklace", ear1="Regal Earring", ear2="Malignance Earring",
		-- Freke Ring
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.precast.WS['Black Halo'] = {ammo="Ginsen", -- Aurgelmir Orb +1
		-- Viti. Chapeau +3 Duelist Torque +2
		head="Carmine Mask +1", neck="Caro Necklace", lear="Regal Earring", rear="Moonshade Earring",
		-- Viti. Tabard +3 Atrophy Gloves +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Metamor. Ring +1",
		-- Salifi Belt +1
		back=gear.ws_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Carmine Greaves +1"}
	
	sets.precast.WS['Empyreal Arrow'] = {range="Ullr",ammo=empty,
		-- Nyame Marked Gorget +1
		head="Malignance Chapeau",neck="Fotia Gorget", lear="Telos Earring", rear="Enervating Earring",
		--  Nyame Cacoethic Ring +1 Hadjuk Ring +1
		body="Malignance Tabard", hands="Malignance Gloves", lring="Rajas Ring", rring="Ilabrat Ring",
		--  Nyame 
		back=gear.ws_jse_back, waist="Yemeya Belt", legs="Malignance Tights", feet="Malignance Boots"}
		
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- head="Ea Hat +1", 
		head="Amalric Coif +1", neck="Mizu. Kubikazari", lear="Regal Earring", rear="Friomisi Earring",
		-- body="Ea Houppelande +1",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Mujin Band", ring2="Shiva Ring +1",
		--waist="Refoccilation Stone", legs="Ea Slops +1", feet="Ea Pigaches +1"
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Jhakri Pigaches +2"}
		
	ssets.midcast.FastRecast = set_combine(sets.precast.FC, {main="Oranyan", sub="Clerisy Strap +1", ammo="Sapience Orb",
		head="Atro. Chapeau +1", beck="Orunmila's Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Viti. Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring", 
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"})

    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield", ammo="Esper Stone +1",
		head="Kaykaus Mitra +1", neck="Incanter's Torque", lear="Beatific Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

    sets.midcast.LightWeatherCure = {main="Daybreak", sub="Sors Shield", ammo="Esper Stone +1",
		head="Kaykaus Mitra +1", neck="Incanter's Torque", lear="Beatific Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

    sets.midcast.LightDayCure = {main="Daybreak", sub="Sors Shield", ammo="Esper Stone +1",
		head="Kaykaus Mitra +1", neck="Incanter's Torque", lear="Beatific Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Sirona's Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring",
		waist="Witful Belt",feet="Vanya Clogs"})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {		
		 -- hands="Buremte Gloves",
		ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Cure_Received = {		
		--hands="Buremte Gloves",
		ring2="Kunaji Ring",
		--waist="Gishdubar Sash"
		}
	sets.Self_Refresh = {back="Grapevine Cape",}--waist="Gishdubar Sash"

	sets.midcast['Enhancing Magic'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Hasty Pinion +1",
		-- main="Arendsi Fleuret",
		-- Duelist's Torque +2 
		head=gear.telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Atrophy Gloves +3 
		body=gear.telchine_body_Duration, hands="Atrophy Gloves +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back=gear.JSE_Cape, waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		--main="Pukulatmuj +1", sub="Ammurapi Shield",		
		--Duelist's Torque +2 
		head="Leth. Chappel +1", neck="Incanter's Torque", ear1="Andoaa Earring", rear="Augment. Earring",
		-- Atrophy Gloves +3 
		body="Lethargy Sayon +1", hands="Atrophy Gloves +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back=gear.JSE_Cape, waist="Olympus Sash", legs="Leth. Fuseau +1", feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj +1",head="Befouled Crown",neck="Incanter's Torque",ear2="Mimir Earring",hands="Viti. Gloves +3",back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3"}
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	-- Path F = Full Potency Gear
	sets.midcast['Enfeebling Magic'] = {main="Maxentius",sub="Ammurapi Shield", range=empty, ammo="Regal Gem",
			-- Vitiation Chapeau +3  Duelist's Torque +3
			head="Carmine Mask +1", neck="Incanter's Torque", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3", 
			body="Lethargy Sayon +1", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
			-- feet="Vitiation Boots +3"
			back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Skaoi Boots"}
	
	-- Path A - Pure Macc No Potency
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield", range="Ullr",ammo=empty, 
			-- head="Atro. Chapeau +3", Duelist's Torque +3
			head="Carmine Mask +1", neck="Incanter's Torque", lear="Digni. Earring", rear="Regal Earring",
			-- body="Atrophy Tabard +3",
			body="Shamash Robe", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
			-- feet="Vitiation Boots +3"
			back=gear.Macc_jse_back, waist="Luminary Sash", legs=gear.chironic_macc_legs, feet="Skaoi Boots"}
	
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3",range="Regal Gem"})
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",legs="Psycloth Lappas"})
				
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{waist="Acuity Belt +1"})
	sets.midcast['Inundation'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",legs="Psycloth Lappas"})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    -- Elemental Magic 
    sets.midcast['Elemental Magic'] = {main="Maxentius", sub="Ammurapi Shield", ammo="Pemphredo Tathlum", 
		head=gear.merlinic_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Freke Ring
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem", 
		head=gear.merlinic_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Freke Ring
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Fodder = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head=gear.merlinic_nuke_head,neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Defending Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Amalric Slops +1", feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
	
		
	sets.midcast.Impact = {main="Maxentius", sub="Ammurapi Shield", ammo="Regal Gem",
		-- Duelist Torque +2
		head=empty, neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		body="Twilight Cloak", hands="Regal Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Vitiation Boots +3
		back=gear.Macc_jse_back, waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Amalric Coif +1" ,neck="Incanter's Torque", ear1="Regal Earring", ear2="Digni. Earring",
		--body="Atrophy Tabard +3",
		body="Ayanmo Corazza +2", hands="Leth. Gantherots +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		--feet=gear.merlinic_nuke_feet
		back=gear.Macc_jse_back,waist="Luminary Sash",legs="Psycloth Lappas", feet=gear.merlinic_aspir_feet}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", neck="Erra Pendant", ear1="Regal Earring", ear2="Digni. Earring",
        -- Shango Robe 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        --feet=gear.chironic_nuke_feet
		back=gear.Macc_jse_back, waist="Fucho-no-obi", legs="Psycloth Lappas", feet=gear.merlinic_aspir_feet}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		head="Atro. Chapeau +1", neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe", hands="Gende. Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Psycloth Lappas", feet=gear.merlinic_aspir_feet}
	sets.midcast.Stun.Resistant = {main="Oranyan", sub="Clerisy Strap +1", range="Ullr",
		head="Atro. Chapeau +1", neck="Orunmila's Torque", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Zendik Robe", hands="Gende. Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Macc_jse_back,waist="Luminary Sash",legs="Psycloth Lappas", feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +3",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Aya. Gambieras +2"}
	
	-- Idle sets
	sets.idle = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Homiliary",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.MDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Weak = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back=gear.FC_jse_back,legs="Carmine Cuisses +1",feet="Hippomenes Socks"})
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Dark Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {main="Mafic Cudgel", sub="Genmei Shield", ammo="Staunch Tathlum",
		-- Sanare Earring
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	-- Swords
	sets.weapons.EnspellOnly = {main="Aern Dagger II",sub="Aern Dagger",range="Ullr",ammo="Beetle Arrow"}
	sets.weapons.EnspellDW = {main="Blurred Knife +1",sub="Aern Dagger",range="Ullr",ammo="Beetle Arrow"}
	sets.weapons.Excalibur = {main="Excalibur", sub="Genmei Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.Sequence = {main="Sequence",sub="Genmei Shield"}
	sets.weapons.Almace = {main="Almace",sub="Genmei Shield"}
	-- Daggers
	sets.weapons.Mandau = {main="Mandau", sub="Genmei Shield"}
	sets.weapons.Tauret = {main="Tauret",sub="Genmei Shield"}
	-- Club
	sets.weapons.Club = {main="Daybreak",sub="Genmei Shield"}
	-- Staff
	
	-- Dual 
	sets.weapons.DualWeapons = {main="Naegling",sub="Kaja Sword"}
	sets.weapons.DualAlmace = {main="Almace",sub="Naegling"}
	sets.weapons.DualDagger = {main="Tauret", sub="Kaja Knife"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Kaja Knife"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Maxentius"}
	sets.weapons.DualClubs = {main="Maxentius", sub="Kaja Rod"}
	sets.weapons.DualBlackHalo = {main="Maxentius",sub="Kaja Rod"}	
	sets.weapons.DualProcDaggers = {main="Aern Dagger II",sub="Aern Dagger"}
	
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
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.EnspellOnly = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- Dls. Torque +2 ear2="Hollow Earring",
		head="Umuthi Hat",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- Malignance Tabard
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ramuh Ring +1",
		back=gear.dw_jse_back, waist="Orpheus's Sash", legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Battlecast Gaiters"}
		
	sets.engaged.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Battlecast Gaiters"}
		
	sets.engaged.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Battlecast Gaiters"}
				
	sets.engaged.DW = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.FullAcc.DT = {ammo="Ginsen", --ammo="Aurgelmir Orb +1",
		-- ear1="Eabani Earring"
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		-- body="Malignance Tabard",hands="Malignance Gloves", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

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

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 003')
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 021')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 022')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 030')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 031')
	else
		windower.chat.input('/lockstyleset 032')
	end
end

autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',['DualEvisceration']='Evisceration',['DualClubs']='Black Halo',['DualAeolian']='Aeolian Edge',['EnspellDW']='Sanguine Blade'}

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