-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga')

	gear.nuke_jse_back = 	{	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.FC_jse_back = 		{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}

	gear.obi_cure_back = gear.Cure_jse_back
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	
	-- Additional local binds 
	-- * = ctrl
	-- @ = windows
	-- ! = alt
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	--send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('alias Myrkr input /ws "Myrkr" <me>')
	
	send_command('alias imp input /ja "Penury" <me>;wait 1;input /ma "Impact" <stnpc>')
	
	send_command('alias ta input /targetnpc')
	send_command('alias at input /targetnpc; wait 1; input /attack <t>')
	   
	-- Embrava
	send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
	--Kaustra
	send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')

	send_command('alias gear exec gearsch.txt')
	send_command('alias ungear gs equip naked;exec ungearsch.txt')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"} --Peda. Pants +1
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {main="Oranyan", sub="Clerisy Strap +1",
		--main=gear.grioavolr_fc_staff,ammo="Impatiens",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        --body="Zendik Robe",
		body="Anhur Robe", hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Amalric Nails +1"}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkaro. Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})-- main="Serenity",sub="Clerisy Strap +1"

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		-- hands="Regal Cuffs", 
		body="Amalric Doublet +1", ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Fi Follet Cape +1",waist="Yamabuki-no-Obi",legs="Pedagogy Pants",feet="Skaoi Boots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",feet="Jhakri Pigaches +2"} --main="Akademos",
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main="Oranyan", sub="Clerisy Strap +1", ammo="Hasty Pinion +1",
		--main=gear.grioavolr_fc_staff,
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Zendik Robe",
		body="Anhur Robe", hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Amalric Nails +1"}
		
    sets.midcast.Cure = {main="Tamaxchi", sub="Sors Shield", ammo="Hasty Pinion +1",
		--main="Serenity",sub="Enki Strap",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Bishop's Sash",legs=gear_chironic_cure_legs,feet="Kaykaus Boots"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Enki Strap",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Hachirin-no-Obi",legs=gear_chironic_cure_legs,feet="Kaykaus Boots"}
		
    sets.midcast.LightDayCure = {main="Tamaxchi", sub="Sors Shield", ammo="Hasty Pinion +1",
		--main="Serenity",sub="Enki Strap",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back="Tempered Cape +1",waist="Hachirin-no-Obi",legs=gear_chironic_cure_legs,feet="Kaykaus Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {back="Grapevine Cape"}--waist="Gishdubar Sash",feet="Inspirited Boots"
	
	sets.midcast.Cursna = {main="Oranyan",ammo="Hasty Pinion +1",
		--sub="Clemency Grip",
		--neck="Debilis Medallion",
		head="Amalric Coif +1", ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",})--sub="Clemency Grip"

	-- 500 Skill
	sets.midcast['Enhancing Magic'] = {main="Kirin's Pole", sub="Fulcio Grip", ammo="Savant's Treatise",
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		head=gear_telchine_head_Duration,neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Augment. Earring",
		body=gear_telchine_body_Duration,hands=gear_telchine_hands_Duration,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Fi Follet Cape +1",waist="Olympus Sash",legs=gear_telchine_legs_Duration,feet=gear_telchine_feet_Duration}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.FC_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})--ear2="Earthcry Earring",legs="Shedir Seraweels"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",})--main="Vadose Rod",sub="Genbu's Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Amalric Doublet +1",hands="Volte Bracers",ring1="Kishar Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear_chironic_macc_legs,feet="Skaoi Boots"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Amalric Doublet +1",hands="Volte Bracers",ring1="Stikini Ring",ring2="Stikini Ring",		
        back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear_chironic_macc_legs,feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Barkaro. Earring",back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,})--waist="Acuity Belt +1"

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Luminary Sash", ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Luminary Sash", ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})

    sets.midcast['Dark Magic'] = {main="Rubicundity",ammo="Pemphredo Tathlum",
		--sub="Ammurapi Shield",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Volte Bracers",ring1="Stikini Ring",ring2="Stikini Ring",
		--waist="Acuity Belt +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs=gear_chironic_macc_legs,feet="Amalric Nails +1"}

	-- 300 INT
    sets.midcast.Kaustra = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main="Akademos", sub="Niobid Strap",
		--neck="Saevus Pendant +1",
        head="Pixie Hairpin +1",neck="Sanctity Necklace", ear1="Crematio Earring",ear2="Barkaro. Earring",
        body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.Kaustra.Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Niobid Strap",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- waist="Acuity Belt +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Rubicundity",ammo="Pemphredo Tathlum",
		-- sub="Ammurapi Shield"
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        --ring1="Evanescence Ring"
		body="Amalric Doublet +1",hands="Volte Bracers",ring1="Stikini Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs=gear_chironic_macc_legs,feet="Mallquis Clogs +2"}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",ammo="Pemphredo Tathlum",
		--sub="Ammurapi Shield",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs=gear_chironic_macc_legs,feet="Mallquis Clogs +2"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Oranyan",ammo="Hasty Pinion +1",
		--sub="Clerisy Strap +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        -- body="Zendik Robe",
		body="Anhur Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Stikini Ring",
		-- legs="Psycloth Lappas",
        back=gear.nuke_jse_back,waist="Witful Belt", legs=gear_chironic_macc_legs, feet="Amalric Nails +1"}

    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        -- body="Zendik Robe",
		body="Anhur Robe",hands="Volte Bracers",ring1="Stikini Ring",ring2="Stikini Ring",
		--waist="Acuity Belt +1",
        back=gear.nuke_jse_back,waist="Witful Belt",legs=gear_chironic_macc_legs,feet="Amalric Nails +1"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main="Akademos",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		--neck="Saevus Pendant +1",
        head=gear_merlinic_nuke_head,neck="Sanctity Necklace", ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Niobid Strap",
        head=gear_merlinic_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main="Akademos",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear_merlinic_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Amalric Doublet +1",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
		--main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
		--neck="Combatant's Torque",
        --head="Mall. Chapeau +2",
		neck="Lissome Necklace", ear1="Dedition Earring",ear2="Telos Earring",
        --body=gear_helios_body_occult,
		body="Amalric Doublet +1", hands=gear_helios_hands_Occult,ring1="Rajas Ring",ring2="Petrov Ring",
		--waist="Oneiros Rope",legs="Perdition Slops",
        back=gear.nuke_jse_back,feet=gear_helios_feet_occult}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",
		--main="Akademos",sub="Niobid Strap",
		head=gear_merlinic_nuke_head,neck="Sanctity Necklace", ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Niobid Strap",
		head=gear_merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		head=gear_merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"})

	sets.midcast.Helix = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main="Akademos",ammo="Dosis Tathlum",
		--neck="Saevus Pendant +1",
        head=gear_merlinic_nuke_head,neck="Sanctity Necklace", ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Refoccilation Stone
        back="Bookworm Cape",waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast.Helix.Resistant = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head=gear_merlinic_nuke_head,neck="Sanctity Necklace", ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- waist="Acuity Belt +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast.Helix.Burst = {main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head=gear_merlinic_nuke_head,neck="Sanctity Necklace", ear1="Regal Earring",ear2="Barkaro. Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- waist="Acuity Belt +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,
		--ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Amalric Doublet +1",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Amalric Nails +1"}

	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Acuity Belt +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi", legs=gear_chironic_macc_legs,feet="Amalric Nails +1"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff", ammo="Homiliary", -- sub="Oneiros Grip",
		--neck="Chrys. Torque",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet +1",hands=gear_merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- hands=gear_merlinic_refresh_hands,
        body="Jhakri Robe +2",hands="Volte Bracers", ring1="Defending Ring",ring2="Dark Ring",
		-- waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Amalric Nails +1"}

    sets.idle.PDT = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tathlum",
		-- sub="Oneiros Grip",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Volte Bracers",ring1="Defending Ring",ring2="Dark Ring",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {})--feet="Hippo. Socks +1"

    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		--hands=gear_merlinic_refresh_hands,
        body="Jhakri Robe +2",hands="Volte Bracers",ring1="Defending Ring",ring2="Dark Ring",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Amalric Nails +1"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

    -- Defense sets
    sets.defense.PDT = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tathlum",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.defense.MDT = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tathlum",
		--sub="Umbra Strap",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.defense.MEVA = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tathlum",
		--sub="Umbra Strap",
		--ear2="Sanare Earring",
        head=gear_merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",
        body="Amalric Doublet +1",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Purity Ring",
		--waist="Acuity Belt +1",
        back=gear.nuke_jse_back,legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Tokko Rod",sub="Genbu's Shield",ammo="Homiliary",
        head="Chironic Hat",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Digni. Earring",
		--hands=gear_merlinic_refresh_hands,
        body="Jhakri Robe +2",hands="Volte Bracers", ring1="Defending Ring",ring2="Dark Ring",
		--waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back, waist="Eschan Stone", legs="Assid. Pants +1",feet="Jhakri Pigaches +2"}
		
	sets.engaged.PDT = {main="Tokko Rod", sub="Genbu's Shield", ammo="Staunch Tathlum",
		-- sub="Oneiros Grip", 	
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		--hands=gear_merlinic_refresh_hands,
        body="Mallquis Saio +2", hands="Volte Bracers", ring1="Defending Ring",ring2="Dark Ring",
		--waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back, waist="Eschan Stone", legs="Assid. Pants +1",feet="Jhakri Pigaches +2"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet="Peda. Loafers"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers"}
	
	sets.HPDown = {
		head="Pixie Hairpin +1",ear1="Mendi. Earring",ear2="Evans Earring",
		--body="Zendik Robe",hands="Hieros Mittens", ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		
		back=gear.FC_jse_back,}--waist="Flax Sash",legs="Shedir Seraweels",feet=""
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {}--main="Akademos",sub="Niobid Strap"
	sets.weapons.Khatvanga = {}--main="Khatvanga",sub="Bloodrain Strap"
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(5, 9)
	elseif player.sub_job == 'BLM' then
		set_macro_page(3, 9)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 9)
	else
		set_macro_page(5, 9)
	end
end

function user_job_self_command(commandArgs, eventArgs)
	
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Combat'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}






