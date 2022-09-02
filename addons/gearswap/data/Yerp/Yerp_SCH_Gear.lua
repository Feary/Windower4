-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA','TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None', 'Default')

	gear.nuke_jse_back = {	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = 	{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
	gear.Cure_jse_back = {	name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.Macc_jse_back = {	name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	
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
	   	
	select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Enlightenment'] = {body="Pedagogy Gown"} 

    -- Fast cast sets for spells
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Achaq Grip", ammo="Incantor Stone",
		-- neck="Voltsurge Torque", ear2="Malignance Earring",
		head="Merlinic Hood", ear1="Enchntr. Earring +1", ear2="Loquac. Earring",
        -- rring="Kishr Ring"
		body="Zendik Robe", hands=gear.helios_hands_FC, ring1="Prolix Ring", ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Gyve Trousers",feet="Peda. Loafers +3"}
		
	sets.precast.FC.Arts = {feet="Academic's Loafers"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})-- waist="Siegel Sash"

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})--ear1="Barkaro. Earring" body="Mallquis Saio +2",

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Vadose Rod", sub="Sors Shield",})-- main="Serenity",

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {}

    -- Midcast Sets
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})-- hands="Volte Bracers", 
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {ring2="Locus Ring"} --main="Akademos", neck="Mizu. Kubikazari", hands="Amalric Gages", ring1="Mujin Band", feet="Jhakri Pigaches +2"
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {} -- head="Pixie Hairpin +1", ring2="Archon Ring"

	-- Midcast
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, ammo="Incanter Stone",
		--main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion",
		--head="Amalric Coif", ear2="Malignance Earring", 
		 head="Merlinic Hood", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", ear2="Loquac. Earring", 
		-- hands="Acad. Bracers +2", ring2="Kishar Ring",
		body="Zendik Robe", hands=gear.helios_hands_FC, ring1="Prolix Ring",
		-- Psycloth Lappas
		back=gear.FC_jse_back, waist="Witful Belt", legs="Give Trousers", feet="Peda. Loafers +3"}
		
		
	-- Healing Magic	
    sets.midcast.Cure = {main="Vadose Rod", sub="Sors Shield", ammo="Incanter Stone",
		--head="Gende. Caubeen +1", neck="Melic Torque", rear="Nourish. Earring",	
		head="Merlinic Hood", lear="Novia Earring", rear="Beatific Earring", 
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", ring2="Menelaus's Ring",
		back=gear.Cure_jse_back, waist="Austerity Belt", legs="Sifahir Slacks", feet="Skaoi Boots"}

    sets.midcast.LightWeatherCure = {main="Iridal Staff", sub="Achaq Grip", ammo="Incanter Stone",
		--head="Gende. Caubeen +1", neck="Melic Torque",  rear="Nourish. Earring",	
		head="Merlinic Hood", lear="Novia Earring", rear="Beatific Earring", 
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", ring2="Menelaus's Ring",
		back=gear.Cure_jse_back, waist="Austerity Belt", legs="Sifahir Slacks", feet="Skaoi Boots"}
		
    sets.midcast.LightDayCure = {main="Iridal Staff", sub="Achaq Grip", ammo="Incanter Stone",
		--head="Gende. Caubeen +1", neck="Melic Torque", rear="Nourish. Earring",	
		head="Merlinic Hood",  lear="Novia Earring", rear="Beatific Earring", 
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", ring2="Menelaus's Ring",
		back=gear.Cure_jse_back, waist="Austerity Belt", legs="Sifahir Slacks", feet="Skaoi Boots"}	

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring",}--waist="Gishdubar Sash" ring1="Kunaji Ring",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring",}--waist="Gishdubar Sash" ring1="Kunaji Ring",
	sets.Self_Refresh = {}-- back="Grapevine Cape"waist="Gishdubar Sash",feet="Inspirited Boots"
	
	sets.midcast.Cursna = {-- main="Oranyan", sub="Clemency Grip", ammo="Hasty Pinion",
		--head="Amalric Coif +1",neck="Debilis Medallion",
		ear1="Enchntr. Earring +1", ear2="Loquac. Earring",
		-- hands="Hieros Mittens",ring1="Haoma's Ring",
		body="Zendik Robe", ring2="Menelaus's Ring",
		--legs="Psycloth Lappas",feet="Vanya Clogs"
		back=gear.FC_jse_back,waist="Witful Belt",legs="Gyve Trousers"}
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})-- main="Oranyan", sub="Clemency Grip"

	-- 500 Skill
	sets.midcast['Enhancing Magic'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Savant's Treatise",
		--neck="Incantor's Torque", lear="Andoaa Earring", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Fi Follet Cape +1", 
		back=gear.FC_jse_back, waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}


    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.FC_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})-- waist="Siegel Sash", neck="Nodens Gorget", ear2="Earthcry Earring", legs="Shedir Seraweels"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {}) -- head="Amalric Coif +1"
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",})--sub="Ammurapi Shield" head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {--  sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash"  legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Casecade Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {--sub="Ammurapi Shield",
		main="Maxentius",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" waist="Ovate Rope", legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Casecade Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.nuke_jse_back,})--waist="Acuity Belt +1"

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.Macc_jse_back})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Macc_jse_back,})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}

	-- 300 INT
    sets.midcast.Kaustra = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Acuity Belt +1" legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}
		
    sets.midcast.Kaustra.Resistant = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}

    sets.midcast.Drain = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash"  legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}
		
    sets.midcast.Drain.Resistant = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Skaoi Boots"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Amalric Slops +1", feet="Peda. Loafers +3"}

    sets.midcast.Stun.Resistant = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head,lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash"  legs="Chironic Hose"
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Amalric Slops +1", feet="Peda. Loafers +3"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Maxentius", sub="Sors Shield", --  sub="Ammurapi Shield",
		-- lear="Regal Earring", 
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Novio Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring +1",
		-- 
		back=gear.nuke_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Peda. Loafers +3"}

    sets.midcast['Elemental Magic'].Resistant = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Jhakri Coronal +2  lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1",  lear="Novio Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- 
		back=gear.nuke_jse_back, waist="Cognition Belt", legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Jhakri Coronal +2  lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
    sets.midcast['Elemental Magic'].Proc = {main="Maxentius", --  sub="Ammurapi Shield",
		-- Jhakri Coronal +2  lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'],{
		main="Maxentius", sub="Ammurapi Shield",
		--main="Khatvanga", sub="Bloodrain Strap", ammo="Seraphic Ampulla",
		head="Mall. Chapeau +2", neck="Sanctity Necklace", ear1="Dedition Earring", ear2="Telos Earring",
        -- body="Amalric Doublet +1", body=gear.helios_body_occult,  hands=gear.helios_hands_Occult,
		body=gear.helios_body_occult,  hands=gear.helios_hands_Occult, ring1="Rajas Ring",ring2="Petrov Ring",
		--waist="Oneiros Rope 
        back=gear.nuke_jse_back, legs="Perdition Slops", feet=gear.helios_feet_occult})
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Maxentius", --  sub="Ammurapi Shield",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- Jhakri Coronal +2  lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Luminary Sash" legs="Chironic Hose"
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring 
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"})

	sets.midcast.Helix = {main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring 
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
	sets.midcast.Helix.Resistant = {main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring 
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}
	
	sets.midcast.Helix.Burst = {main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Mujin Ring Freke Ring 
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,
		-- lear="Regal Earring", rear="Malignance Earring",
		head=gear.merlinic_nuke_head, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring 
		body="Shamash Robe", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Peda. Loafers +3"}

	sets.midcast.Impact = {main="Maxentius", --  sub="Ammurapi Shield", --ammo="Pemphredo Tathlum",
		-- lear="Regal Earring", rear="Malignance Earring",
		head=empty, neck="Saevus Pendant +1", lear="Enchntr. Earring +1",
		-- Freke Ring 
		body="Twilight Cloak", hands="Jhakri Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist=gear.ElementalObi, legs="Amalric Slops +1", feet="Jhakri Pigaches"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Boonwell Staff", --  sub="Kaja Grip", ammo="Homiliary", sub="Oneiros Grip",
		--neck="Loricate Torque +1", ear2="Etiolation Earring",
		head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands,
		body="Shamash Robe", hands="Jhakri Cuffs", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		-- feet=gear.merlinic_refresh_feet
		back="Felicitas Cape +1", waist="Austerity Belt",legs="Assid. Pants +1",feet="Peda. Loafers +3"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown",  ear1="Ethereal Earring", 
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet=gear.merlinic_refresh_feet
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Peda. Loafers +3"}

    sets.idle.PDT = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1", ear2="Etiolation Earring",
        head="Befouled Crown",   ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
		
	sets.idle.MEVA = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {})--feet="Hippo. Socks +1"

    sets.idle.Weak = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1", ear2="Etiolation Earring",
        head="Befouled Crown",  ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

    -- Defense sets
    sets.defense.PDT = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}

    sets.defense.MDT = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
		
    sets.defense.MEVA = {main="Malignance Pole", sub="Achaq Grip", -- ammo="Homiliary",
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
		
    sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Maxentius",
		-- ammo="Homiliary", sub="Genmei Shield",ammo="Hasty Pinion", 
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown",  ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
	
	sets.engaged.DW = {main="Maxentius",
		-- ammo="Homiliary", sub="Genmei Shield",ammo="Hasty Pinion", 
		-- sub="Genmei Shield", neck="Loricate Torque +1",  ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}
	
	sets.engaged.PDT = {main="Maxentius",
		-- ammo="Homiliary", sub="Genmei Shield",ammo="Hasty Pinion", 
		-- sub="Genmei Shield", neck="Loricate Torque +1", ear1="Ethereal Earring", ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}

	sets.engaged.PDT.DW = {main="Maxentius",
		-- ammo="Homiliary", sub="Genmei Shield",ammo="Hasty Pinion", 
		-- sub="Genmei Shield", neck="Loricate Torque +1", ear2="Etiolation Earring",
        head="Befouled Crown", ear1="Ethereal Earring",
		--  hands=gear.merlinic_refresh_hands, 
        body="Shamash Robe", hands="Jhakri Cuffs", ring1="Defending Ring", ring2="Jhakri Ring",
		-- waist="Flax Sash",  legs="Assid. Pants +1", feet="Mallquis Clogs +2"
        back=gear.FC_jse_back, waist="Austerity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"}

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
		--ear1="Mendi. Earring", ear2="Evans Earring",
		--=head="Pixie Hairpin +1", 
		--body="Zendik Robe",hands="Hieros Mittens", 
		--ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",		
		back=gear.FC_jse_back,}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Academic's Pants"}
	sets.buff['Dark Arts'] = {body="Academic's Gown"} 

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Default = {main="Maxentius", sub="Sors Shield"}
	sets.weapons.DualClub = {main="Maxentius", sub="Kaja Rod"}
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

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 009')
end

function user_job_self_command(commandArgs, eventArgs)
	
end

	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
buff_spell_lists = {
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






