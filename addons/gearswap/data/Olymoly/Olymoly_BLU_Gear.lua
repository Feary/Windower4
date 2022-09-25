function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','SIRD','Resistant','FullMacc','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Ambu','MagicWeapons','MeleeClubs','MaccWeapons','HybridWeapons','DualAmbu','DualMagicWeapons','DualMeleeClubs','DualMaccWeapons','HybridWeapons')--'Tizalmace','Sequence','Almace',

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
	user_job_lockstyle()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +3", feet="Hashishin Basmak +1"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1", feet="Assim. Charuqs +3"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +3"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- used for omen objectives
	-- //curecheat
	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flume Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {main="Bolelabunga",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Stikini Ring +1",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Carmine Cuisses +1",feet="Skaoi Boots"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +3"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Acc
	sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Odnowa Earring +1",ear2="Cessance Earring",
		body="Assim. Jubbah +3",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	-- Macc
	sets.precast.Flourish1 = {ammo="Hasty Pinion +1",
	   head="Assim. Keffiyeh +3", neck="Sanctity Necklace", ear1="Regal Earring",ear2="Digni. Earring",
	   body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
	   --
	   back=mab_jse_back,waist="Eschan Stone",legs="Luz. Shalwar +3",feet="Luhlaza Charuqs +3"}

	-- Fast cast sets for spells
	sets.precast.FC = {main="Vampirism",sub="Vampirism",
		head="Amalric Coif +1", neck="Orunmila's Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})--body="Passion Jacket"

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {main="Vampirism",sub="Vampirism",
		head="Amalric Coif +1", neck="Orunmila's Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Hashishin Mintan +1",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",-- Oshasha's Treatise
		-- Hashishin Kavuk +2 Nyame Helm Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		-- Nyame Gauntlets R20 lring Karieyah Ring +1
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Nyame Flanchard R20	Nyame Boots R20
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet}

	sets.precast.WS.Acc = {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet}

	sets.precast.WS.Fodder = {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {ear1="Moonshade Earring",})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Assim. Jubbah +3", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Assim. Jubbah +3", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {ammo="Ginsen", --Jukukik Feather
		-- Mirage's Stole +2 
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Assim. Jubbah +3", hands="Adhemar Wrist. +1", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Beithir Ring
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Sailfi Belt +1 
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Beithir Ring
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Sailfi Belt +1 
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Beithir Ring
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		-- Sailfi Belt +1 
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet=gear.herculean_ta_feet})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen", --ammo="Floestone", 
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen", --ammo="Floestone", 
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {--ammo="Floestone",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Epona's Ring",
		back=gear.crit_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Thereoid Greaves"})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {ammo="Ginsen",
		-- Lilith Headpiece  Mirage's Stole +2
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Ifrit Ring +1", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luh. Shalwar +3", feet="Jhakri Pigaches +2"})


	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		-- Baetyl Pendant
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Archon Ring",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Luh. Shalwar +3",feet="Amalric Nails +1"}

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Luh. Shalwar +3",feet="Jhakri Pigaches +2"}
	
	sets.precast.WS['Black Halo'] = {ammo="Pemphredo Tathlum",
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Moonshade Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		back=gear.wsd_jse_back,waist="Luminary Sash",legs="Luh. Shalwar +3",feet="Jhakri Pigaches +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Orunmila's Torque", ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Luh. Jubbah +3",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --
	sets.midcast['Blue Magic'].Physical = {ammo="Hasty Pinion +1",--ammo="Floestone",
		-- Mavi Stole +2 Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Luh. Jubbah +3", hands="Luh. Bazubands +3", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Physical.Resistant = {ammo="Hasty Pinion +1",--ammo="Floestone",
		--  Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Luh. Jubbah +3", hands="Luh. Bazubands +3", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Physical.Fodder = {ammo="Hasty Pinion +1",--ammo="Floestone",
		--  Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Caro Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Luh. Jubbah +3", hands="Luh. Bazubands +3", lring="Ifrit Ring +1", rring="Shukuyu Ring",
		back=gear.wsd_jse_back, waist="Prosilio Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Hasty Pinion +1",
		-- Mirage Stole +2
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Cornflower Cape", waist="Eschan Stone", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}		

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
	sets.midcast['Blue Magic'].Magical = {main="Maxentius", sub="Kaja Rod", ammo="Pemphredo Tathlum",
		--	Bunzi's Rod Ghastly Tathlum +1
		-- head=empty Sybil Scarf
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Cohort Cloak +1 hands="Hashi. Bazu. +2" 
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Hashi. Basmak +2
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Luh. Shalwar +3", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{
		main="Maxentius", sub="Kaja Rod", ammo="Pemphredo Tathlum",
		-- Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Luh. Shalwar +3", feet="Amalric Nails +1"})

	sets.midcast['Blue Magic'].Magical.Fodder = {main="Maxentius", sub="Kaja Rod", ammo="Pemphredo Tathlum",
		-- Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Luh. Shalwar +3", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring1="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Maxentius", sub="Kaja Rod",ammo="Pemphredo Tathlum",
		-- Sakpata's Sword
		head="Assim. Keffiyeh +3", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Hashi. Mintan +2 Hashi. Bazu. +2 
		body="Shamash Robe", hands="Regal Cuffs", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		-- Aurist's Cape +1  Hashi. Tayt +2 Hashi. Basmak +2
		back="Cornflower Cape", waist="Acuity Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
	sets.midcast['Blue Magic'].MagicAccuracy.DT = {main="Maxentius", sub="Kaja Rod",ammo="Staunch Tathlum +1",
		-- Mavi Stole +2 Hashi. Earring +2
		head="Malignance Chapeau", neck="Erra Pendant", lear="Regal Earring", rear="Digni. Earring",
		-- Hashi. Mintan +2 Hashi. Bazu. +2  Malignance Tabard Malignance Gloves 
		body="Shamash Robe", hands="Assim. Bazu. +3", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		-- Aurist's Cape +1 Hashi. Tayt +2
		back="Cornflower Cape", waist="Acuity Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.midcast['Blue Magic']['Dream Flower'] = sets.midcast['Blue Magic'].MagicAccuracy.DT
	
	sets.midcast['Blue Magic']['Reaving Wind'] = {main="Maxentius", sub="Kaja Rod",ammo="Sapience Orb",
		-- Sakpata Sword
		-- Mavi Stole +2
		head="Carmine Mask +1", neck="Erra Pendant", lear="Loquac. Earring", rear="Digni. Earring",
		-- Hash. Bazu. +2 
		body="Luhlaza Jubbah +3", hands="Regal Cuffs", lring="Metamor. Ring +1", rring="Kishar Ring",
		-- Aurist's Cape +1  Hashi. Basmak +2
		back="Cornflower Cape", waist="Acuity Belt +1", legs="Aya. Cosciales +2", feet="Malignance Boots"}
	sets.midcast['Blue Magic']['Feather Tickle'] = sets.midcast['Blue Magic']['Reaving Wind']

	-- Breath Spells --
	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		-- Hermetic Earring
		head="Assim. Keffiyeh +3", neck="Sanctity Necklace", lear="Regal Earring",rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Regal Cuffs", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Assim. Shalwar +3", feet="Amalric Nails +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --
	sets.midcast['Blue Magic'].Stun = {ammo="Pemphredo Tathlum",
		-- Mirage Stole +2
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Hasty Pinion +1",--main="Iris",sub="Iris",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Cornflower Cape", waist="Eschan Stone", legs="Ayanmo Cosciales +2", feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum", -- Egoist's Tathlum
		-- head=gear.telchine_head_curerecieved rear="Tuisto Earring"
		head="Adhemar Bonnet +1", neck="Unmoving Collar +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		-- Pinga Tunic +1 hands=gear.telchine_hands_curerecieved
		body="Assim. Jubbah +3", hands=gear.telchine_hands_Cure, lring="Ilabrat Ring", rring="Supershear Ring",
		-- Gold Mog Belt Oneiros Belt   Pinga Pants +1
		back="Moonbeam Cape", legs="Gyve Trousers", feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Staunch Tathlum +1", 
		sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Vrikodara Jupon",hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Luminary Sash", legs="Gyve Trousers", feet="Skaoi Boots"}

	--Overwrite certain spells with these pieces even if the day matches, because of resource inconsistencies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Chuq'aba Belt"}

	-- Occulation: Resulting in 12 shadows at 600 skill. Current 544 + (39 JPs) 583 - need 17 in gear
	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		-- Mavi Stole +2 lear="Havi. Earring +2" rear="Njordr Earring"
		head="Luh. Keffiyeh +3", neck="Incanter's Torque", lear="Gifted Earring", rear="Loquac. Earring",
		body="Assim. Jubbah +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Hashi. Tayt +2
		back="Cornflower Cape", waist="Flume Belt", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +3"}
	
	-- Duration Gear?
	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		main="Vampirism",sub="Vampirism",
		head="Luh. Keffiyeh +3", neck="Incanter's Torque", lear="Loquac. Earring", rear="Gifted Earring",
		-- Rawhide Gloves
		body="Assim. Jubbah +3", lring="Stikini Ring +1", ring1="Kishar Ring",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +3"}
	
	-- Refresh Received Gear
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1"})--back="Grapevine Cape",waist="Gishdubar Sash"
	
	-- Aquaveil Gear
	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",legs="Shedir Seraweels"})--waist="Emphatikos Rope",
	
	-- Non Blue Magic
	sets.midcast.Cure = {ammo="Pemphredo Tathlum", --Hydrocera
		main="Maxentius",sub="Nibiru Cudgel",
		head="Carmine Mask +1", neck="Phalaina Locket", lear="Regal Earring", rear="Mendi. Earring",
		body="Vrikodara Jupon", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Luminary Sash", legs="Gyve Trousers",feet="Skaoi Boots"}

	sets.midcast['Enfeebling Magic'] = {main="Maxentius", sub="Kaja Rod", ammo="Pemphredo Tathlum",
		head="Assim. Keffiyeh +2", neck="Erra Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Assim. Shalwar +3", feet="Amalric Nails +1"}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",--main="Nibiru Cudgel",sub="Nibiru Cudgel",
		head="Assim. Keffiyeh +2", neck="Erra Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Eschan Stone", legs="Assim. Shalwar +3", feet="Amalric Nails +1"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Vampirism", ammo="Hasty Pinion +1",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1", hands="Regal Cuffs",legs="Shedir Seraweels"}) --waist="Emphatikos Rope"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", legs="Shedir Seraweels"})--ear2="Earthcry Earring",

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {main="Maxentius", sub="Naegling", ammo="Pemphredo Tathlum",
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'] = {main="Maxentius", sub="Naegling", ammo="Pemphredo Tathlum",
		--Mavi Stole +2
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].Resistant = {main="Maxentius", sub="Naegling", ammo="Pemphredo Tathlum",
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Digni. Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.element.Dark = {head="Pixie Hairpin +1", ring2="Archon Ring"}
	sets.element.Earth = {} -- neck="Quanpur Necklace"
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Hasty Pinion +1",
		head="Malignance Chapeau", neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", ring1="Dark Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Idle sets
	-- Refresh
	sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Herc Refresh
		body="Shamash Robe", hands=gear.herculean_refresh_hands, lring="Dark Ring", rring="Defending Ring",
		-- Herc Refresh  Herc Refresh
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}		
		
	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {main="Mafic Cudgel", sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}			

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genmei Shield", ammo="Staunch Tathlum +1", 
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Genmei Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Shadow Mantle", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}	

	sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", neck="Warden's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}	

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Ethereal Earring", ear2="Suppanomimi"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Brutal Earring",ear2="Suppanomimi"}
	sets.DWMax = {body="Adhemar Jacket +1", rear="Suppanomimi", waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {body="Volte Jupon", hands="Volte Bracers"})
	
	-- Weapon Set
	--sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Ambu = {main="Naegling", sub="Kaja Sword"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Kaja Rod"}
	--sets.weapons.Almace = {main="Almace",sub="Sequence"}
	--sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.MaccWeapons ={main="Maxentius",sub="Kaja Rod"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}
	
	-- Dual Wield
	sets.weapons.DualAmbu = {main="Naegling", sub="Kaja Sword"}
	sets.weapons.DualMeleeClubs = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualMagicWeapons = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualMaccWeapons ={main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualHybridWeapons = {main="Vampirism",sub="Vampirism"}

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
		head="Malignance Chapeau", neck="Sanctity Necklace", ear1="Telos Earring", ear2="Digni. Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", ring1="Ilabrat Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Reiki Yotai", legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc.AM = {ammo="Ginsen",
		-- Mirage Stole +2
		head="Adhemar Bonnet +1",neck="Sanctity Necklace", ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring", ring2="Epona's Ring",
		back=gear.stp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.FullAcc = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.FullAcc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

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

	sets.engaged.DT = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Acc.DT.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.FullAcc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	
	sets.Self_Healing = {neck="Phalaina Locket",legs="Gyve Trousers",ring2="Kunaji Ring",}--waist="Gishdubar Sash", hands="Buremte Gloves",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",}--waist="Gishdubar Sash" hands="Buremte Gloves",
	sets.Self_Refresh = {back="Grapevine Cape"}--waist="Gishdubar Sash"
	sets.MagicBurst = {hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(7, 8)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 008')
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
	 zahak = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
}

function job_setup()

    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff['Azure Lore'] = buffactive['Azure Lore'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	state.Buff['Unbridled Wisdom'] = buffactive['Unbridled Wisdom'] or false
	
	state.LearningMode = M(false, 'Learning Mode')
	state.AutoUnbridled = M(false, 'Auto Unbridled Mode')
	autows = 'Chant Du Cygne'
	autofood = 'Soy Ramen'
	
    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods, if only for pDif.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave',
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Sickle Slash','Smite of Rage','Thrashing Assault','Vanity Dive',
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum',
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Helldive','Jet Stream',
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite',
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tearing Gust','Tem. Upheaval','Water Bomb','Molting Plumage',
		'Nectarous Deluge','Searing Tempest','Blinding Fulgor','Spectral Floe','Scouring Spate',
		'Anvil Lightning','Silent Storm','Entomb','Tenebral Crush','Palling Salvo'
    }

    -- Magical spells with a primary Mnd mod 
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }

    -- Magical spells with an Agi stat mod
    blue_magic_maps.MagicalAgi = S{
        'Crashing Thunder'
    }

    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Bad Breath', 'Blank Gaze','Blistering Roar','Blitzstrahl','Blood Drain','Blood Saber','Cesspool','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Cruel Joke','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Frost Breath','Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Radiant Breath','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Temporal Shift','Thunderbolt','Venom Shell','Voracious Trunk',
		'Yawn', 'Atra. Libations'
    }
        
    -- Breath-based spells that we don't care about the added effect of.
    blue_magic_maps.Breath = S{
        'Flying Hip Press','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Physical stun spells and physical added effect spells.
    blue_magic_maps.Stun = S{
        'Barbed Crescent','Battle Dance','Benthic Typhoon','Bilgestorm',
		'Feather Storm','Frypan','Head Butt','Hydro Shot','Pinecone Bomb','Queasyshroom',
		'Saurian Slide','Seedspray','Spiral Spin','Sprout Smack','Sub-zero Smash',
		'Sudden Lunge','Sweeping Gouge','Tail Slap','Terror Touch','Wild Oats','Whirl of Rage',
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Exuviation','Healing Breeze','Magic Fruit','Plenilune Embrace',
		'Pollen','Restoral','White Wind','Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill that don't cap very low.
    blue_magic_maps.SkillBasedBuff = S{
        'Diamondhide','Magic Barrier','Occultation','Plasma Charge','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Barrier Tusk','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Fantod','Feather Barrier','Harden Shell','Memento Mori','Metallic Body',
		'Mighty Guard','Nat. Meditation','Orcish Counterstance','Pyric Bulwark',
		'Refueling','Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promy.',
        'Zephyr Mantle'
    }
    
    aoe_blue_magic_healing = S{
        'Healing Breeze','White Wind'
    }
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool',
        'Crashing Thunder','Cruel Joke','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar',
        'Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'
    }

	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","LearningMode","CastingMode","TreasureMode"})
end
