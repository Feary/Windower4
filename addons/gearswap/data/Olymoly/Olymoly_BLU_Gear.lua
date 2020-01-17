function user_setup()
	-- Options: Override default values
	-- F9
    state.OffenseMode:options('Fodder','Normal','Acc')
	state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','Acc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Ambu','MagicWeapons','MeleeClubs','MaccWeapons','HybridWeapons')--'Tizalmace','Sequence','Almace',

    
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'MP','SuppaBrutal', 'DWEarrings','DWMax'}
	
	-- 'DEX+20','Accuracy+20 Attack+20','"Dbl. Atk. +10',}}
	gear.da_jse_back = 		{name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.stp_jse_back =		{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.dw_jse_back = 		{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}}
	gear.crit_jse_back = 	{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}} 
	gear.wsd_jse_back = 	{name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.mab_jse_back =		{name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = 		{name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}
	gear.cure_jse_back =	{name="Rosmerta's Cape",augments={'MND+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Chuq'aba Belt"
	gear.obi_nuke_waist = "Eschan Stone"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')
	
	-- Gearing Commands
	send_command('alias gear exec gearblu.txt')
	send_command('alias ungear gs equip naked;exec ungearblu.txt')
	
	send_command('alias store po store blu')
	send_command('alias unstore po unpack blu')
	
	
	send_command('alias bludd aset spellset dd100')
	send_command('alias blureset lua reload azureset')
	send_command('alias bluddnin aset spellset zahak;input /macro set 1')
	send_command('alias bluddwar aset spellset zahak;input /macro set 2')
	send_command('alias bluddrdm aset spellset zahak;input /macro set 3')
	send_command('alias bludddnc aset spellset zahak;input /macro set 4')
	send_command('alias bluaoe aset spellset aoe;input /macro set 7')
	send_command('alias blucleaving aset spellset cleaving;input /macro set 7')
	send_command('alias bludynamis aset spellset Dynamis;input /macro set 6')
	send_command('alias light input /ja "Chain Affinity" <me>;wait 1;input /ws "Savage Blade" <t>;wait 4;input /ja "Efflux" <me>;wait 2;input /ma "Thrashing Assault" <t>')
	send_command('alias dark input /ja "Chain Affinity" <me>;wait 1;input /ws "Requiescat" <t>;wait 4;input /ja "Efflux" <me>;wait 2;input /ma "Quad. Continuum" <t>')
	send_command('alias vw1 aset spellset vw1')
	send_command('alias vw2 aset spellset vw2')
	
	-- Omen 
	-- 30k CDC > Req > BA > Tenebral
	send_command('alias 30k gs c cycle MagicBurstMode;wait 1;input /ws "Chant Du Cygne" <t>;wait 5;input /ws "Requiescat" <t>;wait 2;input /ja "Burst Affinity" <me>;wait 2;input /ma "Tenebral Crush" <t>')
	send_command('alias 15k input /ja "Burst Affinity" <me>;wait 2;input /ma "Spectral Floe" <t>')

	update_combat_form()
	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +1", feet="Hashishin Basmak +1"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1", feet="Assim. Charuqs +1"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- used for omen objectives
	-- //curecheat
	sets.HPDown = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Acc
	sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Odnowa Earring +1",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	-- Macc
	sets.precast.Flourish1 = {ammo="Hasty Pinion +1",
	   head="Carmine Mask +1", neck="Sanctity Necklace", ear1="Regal Earring",ear2="Digni. Earring",
	   body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
	   back="Cornflower Cape",waist="Kentarch Belt +1",legs="Aya. Cosciales +2",feet="Jhakri Pigaches +2"}

	-- Fast cast sets for spells
	sets.precast.FC = {main="Vampirism",sub="Vampirism",
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Luhlaza Jubbah +1",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})--body="Passion Jacket"

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {main="Vampirism",sub="Vampirism",
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Hashishin Mintan +1",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"}

	sets.precast.WS.Acc = {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"}

	sets.precast.WS.Fodder = {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {ear1="Moonshade Earring",})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 Mache Earring +1 Mache Earring +1
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Abnoba Kaftan", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 Mache Earring +1 Mache Earring +1
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 Mache Earring +1 Mache Earring +1
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Abnoba Kaftan", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"})	
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Rawhide Boots"})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {--ammo="Floestone",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Assim. Jubbah +3 
		body="Abnoba Kaftan", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Assim. Jubbah +3 
		body="Abnoba Kaftan", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {--ammo="Floestone",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Assim. Jubbah +3 
		body="Abnoba Kaftan", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		-- Luh. Shalwar +3
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Thereoid Greaves"})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})	
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})	
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Assim. Jubbah +3 
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +2"})


	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		-- Baetyl Pendant
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Archon Ring",
		-- Orpheus's Sash Luh. Shalwar +3
		back=gear.mab_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1",feet="Amalric Nails +1"}

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
		-- Assim. Jubbah +3
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Jhakri Pigaches +2"}
	
	sets.precast.WS['Black Halo'] = {ammo="Pemphredo Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Moonshade Earring",
		-- Assim. Jubbah +3
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		-- Luh. Shalwar +3
		back=gear.wsd_jse_back,waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Jhakri Pigaches +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Luhlaza Jubbah +1",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --
	sets.midcast['Blue Magic'].Physical = {ammo="Hasty Pinion +1",--ammo="Floestone",
		-- Luh. Keffiyeh +3 Tati Earring +1 Tati Earring +1
		head="Adhemar Bonnet +1", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		-- Luh. Jubbah +3 Luh. Bazubands +3
		body="Adhemar Jacket +1", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		-- Luh. Charugs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Hasty Pinion +1",--ammo="Floestone",
		--  Luh. Keffiyeh +3 Tati Earring +1 Tati Earring +1
		head="Adhemar Bonnet +1", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		-- Luh. Jubbah +3 Luh. Bazubands +3
		body="Adhemar Jacket +1", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		-- Luh. Charugs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Fodder = {ammo="Hasty Pinion +1",--ammo="Floestone",
		--  Luh. Keffiyeh +3 Tati Earring +1 Tati Earring +1
		head="Adhemar Bonnet +1", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		-- Luh. Jubbah +3 Luh. Bazubands +3
		body="Adhemar Jacket +1", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		-- Luh. Charugs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Ayanmo Cosciales +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Hasty Pinion +1",
		-- Mirage Stole +2
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Aya. Gambieras +2"}		

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
		-- Kaja Rod
		main="Kaja Rod", sub="Naegling",
		-- Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Hachirin-no-obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{ammo="Pemphredo Tathlum",
		main="Naegling", sub="Nibiru Cudgel",
		-- Baetyl Pendant
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Yamabuki-no-Obi", legs="Amalric Slops +1", feet="Amalric Nails +1"})

	sets.midcast['Blue Magic'].Magical.Fodder = {ammo="Pemphredo Tathlum",
		main="Naegling", sub="Nibiru Cudgel",
		-- Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Hachirin-no-obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring1="Stikini Ring",ring2="Stikini Ring",waist="Luminary Sash"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Naegling",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		-- Assim +3 
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Jhakri Robe +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Aya. Gambieras +2"}

	sets.midcast['Enfeebling Magic'] = {main="Naegling",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		-- Assim +3 
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Assim Legs +3
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		-- Assim +3 
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Assim legs
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Vampirism",
		ammo="Hasty Pinion +1",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"}) --hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--ear2="Earthcry Earring", ,legs="Shedir Seraweels"

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})-- legs="Shedir Seraweels"
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		main="Kaja Rod", sub="Naegling",
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Yamabuki-no-Obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
		main="Kaja Rod", sub="Naegling",
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Yamabuki-no-Obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Pemphredo Tathlum",
		main="Kaja Rod", sub="Naegling",
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Yamabuki-no-Obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.element.Dark = {head="Pixie Hairpin +1", ring2="Archon Ring"}
	sets.element.Earth = {} -- neck="Quanpur Necklace"
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {ammo="Pemphredo Tathlum",
		main="Kaja Rod",sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Regal Earring", rear="Enchntr. Earring +1",
		-- Vrikodata Jupon 
		body=gear.telchine_body_CureRecieved, hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.cure_jse_back, waist="Luminary Sash", legs="Gyve Trousers",feet="Skaoi Boots"}

	-- Breath Spells --
	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		-- Assim +3 Hermetic Earring
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring",rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Assim legs
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --
	sets.midcast['Blue Magic'].Stun = {ammo="Pemphredo Tathlum",
		-- Mirage Stole +2
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Aya. Gambieras +2"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Hasty Pinion +1",--main="Iris",sub="Iris",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Aya. Gambieras +2"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		-- Dualism Collar +1
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Odnowa Earring +1", rear="Odnowa Earring",
		--gear.telchine_body_Cured Recieved Pinga Tunic
		body="Assim. Jubbah +1", hands=gear.telchine_hands_Cure, lring="Ilabrat Ring", rring="Supershear Ring",
		-- Oneiros Belt   Pinga Pants
		back=gear.cure_jse_back, waist=gear.ElementalObi, legs="Gyve Trousers", feet="Skaoi Boots"}

	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Staunch Tathlum", 
		sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Regal Earring", rear="Enchntr. Earring +1",
		-- Vrikodata Jupon body=gear.telchine_body_CureRecieved, 
		body="Assim. Jubbah +1",hands=gear.telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.cure_jse_back, waist="Luminary Sash", legs="Gyve Trousers", feet="Skaoi Boots"}

	--Overwrite certain spells with these pieces even if the day matches, because of resource inconsistencies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Chuq'aba Belt"}

	-- Occulation: Resulting in 12 shadows at 600 skill. Current 544 + (39 JPs) 583 - need 17 in gear
	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		--main="Iris",sub="Iris",
		--Luh. Keffiyeh +3
		head="Luh. Keffiyeh +1", neck="Incanter's Torque", lear="Gifted Earring", rear="Loquac. Earring",
		-- Assim. Jubbah +3 +4 Rawhide Gloves +10  +3 +3
		body="Assim. Jubbah +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Luhlaza Charuqs +3 +4
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +1"}
	
	-- Duration Gear?
	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		main="Vampirism",sub="Vampirism",
		head="Luh. Keffiyeh +1", neck="Incanter's Torque", lear="Loquac. Earring", rear="Gifted Earring",
		-- Rawhide Gloves
		body="Assim. Jubbah +1", lring="Stikini Ring", ring1="Kishar Ring",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +1"}
	
	-- Refresh Received Gear
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1"})--back="Grapevine Cape",waist="Gishdubar Sash"
	
	-- Aquaveil Gear
	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1"})--,hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +1"}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",ammo="Hasty Pinion +1",
		head="Rawhide Mask", neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
		body="Jhakri Robe +2", hands="Aya. Manopolas +2", ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	-- Idle sets
	-- Refresh
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Rawhide Mask", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		-- Assim. Jubbah +3 Herc Refresh
		body="Jhakri Robe +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Herc Refresh  Herc Refresh
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}		
		
	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}			

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",})--feet="Hippo. Socks +1"

	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield", ammo="Staunch Tathlum",
		-- Genmei Shield 
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Genmei Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}			

	sets.defense.MEVA = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
      	head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}			

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Ethereal Earring", ear2="Suppanomimi"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Brutal Earring",ear2="Suppanomimi"}
	sets.DWMax = {body="Adhemar Jacket +1", rear="Suppanomimi", waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Weapon Set
	--sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Ambu = {main="Naegling", sub="Tanmogayi +1"}
	sets.weapons.MeleeClubs = {main="Kaja Rod",sub="Nibiru Cudgel"}
	--sets.weapons.Almace = {main="Almace",sub="Sequence"}
	--sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Naegling", sub="Kaja Rod"} --
	sets.weapons.MaccWeapons = {main="Naegling", sub="Kaja Rod"}--main="Iris",sub="Iris"
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets
	sets.engaged = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.sk_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.AM = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Acc = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Carmine Mask +1", neck="Sanctity Necklace", ear1="Telos Earring", ear2="Digni. Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", ring1="Ilabrat Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Reiki Yotai", legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

	sets.engaged.Acc.AM = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.AM = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.DTLite = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.DTLite.AM = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Acc.DTLite = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1", ring1="Epona's Ring", ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.DTLite = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.DTLite.AM = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.MDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Acc.MDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.MDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Dedition Earring",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.dw_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.Self_Healing = {neck="Phalaina Locket",legs="Gyve Trousers",ring2="Kunaji Ring",}--waist="Gishdubar Sash", hands="Buremte Gloves",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",}--waist="Gishdubar Sash" hands="Buremte Gloves",
	sets.Self_Refresh = {back="Grapevine Cape"}--waist="Gishdubar Sash"
	sets.MagicBurst = {hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 8)
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
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

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
	
	 aoe = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
}