function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Fodder','Normal','Acc')
	state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','Acc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Default','None','MagicWeapons','MaccWeapons','HybridWeapons')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'MP','SuppaBrutal', 'DWEarrings','DWMax'}

	--Ambuscade Cape
	gear.da_jse_back = 		{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.stp_jse_back =	 	{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.dw_jse_back =	 	{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	gear.crit_jse_back = 	{name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = 	{name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.mab_jse_back = 	{name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = 		{name="Rosmerta's Cape",augments={'HP+60','"Fast Cast"+10','Damage taken-5%',}}
	gear.cure_jse_back = 	{name="Rosmerta's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Ovate Rope"
	gear.obi_nuke_waist = "Ovate Rope"

--[[Additional binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key]]	
	
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
	
	-- aset spellset Zahak
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
	--
	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +2", feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1", feet="Luhlaza Charuqs +1"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +1"}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}

	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}--legs="Dashing Subligar"

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Acc
	sets.precast.Step = {}

	-- Macc
	sets.precast.Flourish = {}

	-- Fast cast sets for spells
	sets.precast.FC = {
		-- ammo="Impatiens", 
		-- neck="Orunmila's Torque", rear="Enchantr. Earring +1",
		head="Carmine Mask", neck="Voltsurge Torque", lear="Loquac. Earring",
		body="Luhlaza Jubbah +1", hands="Leyline Gloves", lring="Kishar Ring", rring="Prolix Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})--body="Passion Jacket"

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		-- Adhemar Bonnet 
		head="Carmine Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Adhemar Jacket", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Ifrit Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.precast.WS.Acc = {
		head="Carmine Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Ifrit Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves"}
		
	sets.precast.WS.Fodder = {
		head="Carmine Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Adhemar Jacket", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Ifrit Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {	
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {	
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})	
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Jukukik Feather",
		-- Adhemar Bonnet +1 Path B Mirage Stole +2 Mache Earring +1 Mache Earring +1
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Abnoba lring="Begrudging Ring"
		body="Ayanmo Corazza +2", hands="Adhemar Wristbands", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {
		-- Adhemar Bonnet +1 Path B Mirage Stole +2 Mache Earring +1 Mache Earring +1
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Abnoba lring="Begrudging Ring"
		body="Assim. Jubbah +2", hands="Adhemar Wristbands", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Assim. Charuqs +2"})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], { 
		-- Adhemar Bonnet +1 Path B Mirage Stole +2 Mache Earring +1 Mache Earring +1
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Abnoba lring="Begrudging Ring"
		body="Ayanmo Corazza +2", hands="Adhemar Wristbands", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {--ammo="Floestone",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Epaminondas's Ring Rufescent Ring
		body="Assim. Jubbah +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Luhlaza Shalwar +3 Herculean Boots WSD STR
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Sanguine Blade'] = {-- Ammo="Pemphredo Tahtlum",
		-- Pixie Hairpin +1 Baetyl Pendant
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Archon Ring  Epaminondas's Ring
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Shiva Ring", rring="Shiva Ring",
		-- waist="Orpheus's Sash", legs="Luhlaza Shalwar +3", feet="Amalric Nails +1"
		back=gear.wsd_jse_back, waist="Warwolf Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
		
	sets.precast.WS['Flash Nova'] = {
		head="Jhakri Coronal +2", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
		body="Adhemar Jacket", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		back=gear.wsd_jse_back, waist="Warwolf Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Brutal Earring", rear="Zennaroi Earring",}
	sets.AccMaxTP = {lear="Brutal Earring", rear="Zennaroi Earring",}

	-- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.precast.FC,{hands="Hashi. Bazu. +1"})

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --
	sets.midcast['Blue Magic'].Physical = {-- ammo="Floestone",
		-- Luhlaza Keffiyeh +3 Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +2", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
		-- Luhlaza Jubbah +3 Luh. Bazubands +3 Shukuyu Ring Ifrit Ring +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Prosilio Belt +1 Luhlaza Charuqs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Resistant = {-- ammo="Floestone",
		-- Luhlaza Keffiyeh +3 Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +2", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
		-- Luhlaza Jubbah +3 Luh. Bazubands +3 Shukuyu Ring Ifrit Ring +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Prosilio Belt +1 Luhlaza Charuqs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Fodder = {-- ammo="Floestone",
		-- Luhlaza Keffiyeh +3 Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +2", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
		-- Luhlaza Jubbah +3 Luh. Bazubands +3 Shukuyu Ring Ifrit Ring +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Prosilio Belt +1 Luhlaza Charuqs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].PhysicalAcc = {-- ammo="Floestone",
		-- Luhlaza Keffiyeh +3 Caro Necklace Tati Earring +1 Tati Earring +1
		head="Jhakri Coronal +2", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
		-- Luhlaza Jubbah +3 Luh. Bazubands +3 Shukuyu Ring Ifrit Ring +1
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Ifrit Ring", rring="Ifrit Ring",
		-- Prosilio Belt +1 Luhlaza Charuqs +3
		back=gear.wsd_jse_back, waist="Prosilio Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}


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
	sets.midcast['Blue Magic'].Magical = {
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1 Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Yamabuki-no-obi Amalric Slops +1 Amalric Nails +1
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Amalric Nails"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1 Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Yamabuki-no-obi Amalric Slops +1 Amalric Nails +1
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Amalric Nails"})

	sets.midcast['Blue Magic'].Magical.Fodder = {
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1 Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Yamabuki-no-obi Amalric Slops +1 Amalric Nails +1
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Amalric Nails"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {	
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		-- Amalric Doublet +1 Amalric Gages +1 Shiva Ring +1 Shiva Ring +1
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		-- Yamabuki-no-obi Amalric Slops +1 Amalric Nails +1
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Amalric Nails"})
		
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {
		-- lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Assim. Keffiyeh +2", neck="Sanctity Necklace",  lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring", 
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

		-- Breath Spells --
	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh", neck="Erra Pendant",  lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Assim. Jubbah +1", hands="Luh. Bazubands +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --
	sets.midcast['Blue Magic'].Stun = {ammo="Mavi Tathlum",
		-- lear="Regal Earring", rear="Enchntr. Earring +1",
		head="Jhakri Coronal +2", neck="Erra Pendant",  lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Stun.Resistant = {
		-- lear="Regal Earring", rear="Enchntr. Earring +1",
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --
	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		head="Carmine Mask", neck="Phalaina Locket", lear="Loquac. Earring", rear="Gifted Earring",
		-- body="Vrikodara Jupon" lring="Kunaji Ring", 
		body="Luhlaza Jubbah +1", hands=gear_telchine_hands_Cure, rring="Asklepian Ring", 
		-- legs="Gyve Trousers" feet="Medium's Sabots"
		back=gear.ElementalCape, waist=gear.ElementalObi, legs="Carmine Cuisses +1", feet="Carmine Greaves"}
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
		head="Carmine Mask", neck="Phalaina Locket", lear="Loquac. Earring", rear="Gifted Earring",
		-- body="Vrikodara Jupon" lring="Kunaji Ring", 
		body="Luhlaza Jubbah +1", hands=gear_telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring",
		-- legs="Gyve Trousers" feet="Medium's Sabots"
		back=gear.ElementalCape, waist=gear.ElementalObi, legs="Carmine Cuisses +1", feet="Carmine Greaves"}
		
	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back=gear.cure_jse_back, waist="Ovate Rope"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		-- main="Iris",sub="Iris"
		--neck="Incanter's Torque"
		head="Luhlaza Keffiyeh", neck="Mavi Scarf", lear="Loquac. Earring", rear="Gifted Earring",
		-- hands="Rawhide Gloves"
		body="Assim. Jubbah +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		-- neck="Incanter's Torque"
		head="Luhlaza Keffiyeh", neck="Mavi Scarf", lear="Loquac. Earring", rear="Gifted Earring",
		body="Assim. Jubbah +1", hands="Hashi. Bazu. +1", ring1="Kishar Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {})--head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar Sash"

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {})--head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast['Enfeebling Magic'] = {
		-- lear="Regal Earring", rear="Enchntr. Earring +1",
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
		
	sets.midcast['Dark Magic'] = {
		-- lear="Regal Earring", rear="Enchntr. Earring +1",
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.mab_jse_back, waist="Ovate Rope", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.midcast['Enhancing Magic'] = {}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif"

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})--ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})--ring2="Sheltered Ring"

	sets.midcast['Divine Magic'] = {
		-- neck="Eddy Necklace",
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Regal Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.mab_jse_back, waist="Warwolf Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'] = {
		-- neck="Eddy Necklace",
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Regal Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.mab_jse_back, waist="Warwolf Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

	sets.midcast['Elemental Magic'].Resistant = {
		-- neck="Eddy Necklace",
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Regal Earring", rear="Friomisi Earring",
		body="Jhakri Robe +2", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.mab_jse_back, waist="Warwolf Belt", legs="Jhakri Slops +2", feet="Amalric Nails"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.element.Dark = {}--head="Pixie Hairpin +1",ring2="Archon Ring"
	sets.element.Earth = {}--neck="Quanpur Necklace"
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {
		--neck="Incanter's Torque",
		head="Carmine Mask", lear="Loquac. Earring",
		hands=gear_telchine_hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		back=gear.ElementalCape, waist=gear.ElementalObi, legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +1"}

	-- Resting sets
	sets.resting = {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},
		-- Herculean Head 
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest  Herculean Hands
		body="Jhakri Robe +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		-- Herculean Boots 
		back="Repulse Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Idle sets - Refresh
	sets.idle =  {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},
		-- Herculean Head 
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest  Herculean Hands
		body="Jhakri Robe +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		-- Herculean Boots 
		back="Repulse Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.idle.PDT =  {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},
		-- Herculean Head 
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest Herculean Hands
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		-- Herculean Boots 
		back="Repulse Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Defense sets
	sets.defense.PDT =  {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},
		-- Herculean Head
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest Herculean Hands
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		-- Herculean Boots 
		back="Repulse Mantle", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT =  {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},
		-- Herculean Head 
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest  Herculean Hands
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		--  Herculean Boots 
		back="Felicitas Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}			

    sets.defense.MEVA =  {main={name="Kaja Sword", priority=2}, sub={name="Tanmogayi +1", priority=1},	
		-- Herculean Head
		head="Aya. Zucchetto +2",  neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		-- Herculean Vest Herculean Hands
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Vocane Ring", rring="Defending Ring",
		--  Herculean Boots 
		back="Felicitas Cape", waist="Flume Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}			

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Ethereal Earring", ear2="Suppanomimi"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Assault = {}
	
	-- Weapons sets
	sets.weapons.Default = {main="Kaja Sword",sub="Tanmogayi +1"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Kaja Sword"}
	sets.weapons.MagicWeapons = {main="Maxentius",sub="Kaja Sword"}
	sets.weapons.MaccWeapons = {main="Kaja Sword",sub="Tanmogayi +1"} --main="Iris",sub="Iris"
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets
	sets.engaged =  {main="Kaja Sword", sub="Tanmogayi +1",
		head="Carmine Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Reiki Yotai", legs="Samnuha Tights", feet="Carmine Greaves"}

	sets.engaged.Acc = {
		head="Carmine Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Petrov Ring", rringl="Epona's Ring",
		back=gear.da_jse_back, waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}
		
	sets.engaged.Fodder = {
		head="Carmine Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Reiki Yotai", legs="Samnuha Tights", feet="Carmine Greaves"}

	sets.engaged.DTLite = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back=gear.da_jse_back, waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.PDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.Acc.DTLite = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.Acc.PDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.Fodder.DTLite = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Samnuha Tights", feet="Carmine Greaves"}

	sets.engaged.Fodder.PDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Brutal Earring", rear="Zennaroi Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Samnuha Tights", feet="Carmine Greaves"}

	sets.engaged.MDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.Acc.MDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Carmine Cuisses +1", feet="Carmine Greaves"}

	sets.engaged.Fodder.MDT = {
		head="Carmine Mask", neck="Loricate Torque +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Vocane Ring", rring="Defending Ring",
		back="Repulse Mantle", waist="Reiki Yotai", legs="Samnuha Tights", feet="Carmine Greaves"}

	sets.Self_Healing = {lring="Vocane Ring",}
	sets.Cure_Received = {lring="Vocane Ring",}
	sets.Self_Refresh = {}
	sets.MagicBurst = {hands="Amalric Gages", legs="Assim. // +2", ring1="Mujin Band"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
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
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
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
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
}