function user_setup()

	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','DualWeapons') --'Lionheart','DualWeapons'
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = 	{name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}	
	gear.tp_jse_back = 		{name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.da_jse_back = 		{name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.ws_jse_back = 		{name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	-- HP, Magic Eva, Enmity + and PDT -10%
	gear.hp_jse_back = 		{name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}	
	-- Hp fc meva
	gear.FC_jse_back = 		{name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}	

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons Epeolatry;gs c update')
	--send_command('bind !r gs c weapons Epeolatry;gs c update')
	send_command('bind !f11 gs c cycle IdleMode')
	send_command('bind @f11 gs c cycle ExtraDefenseMode')
	
	--Alias
	send_command('alias gear exec gearrun.txt')
	send_command('alias ungear gs equip naked;exec ungearrun.txt')
	
	send_command('alias fol ffo me')
	send_command('alias ufol ffo stopall')
	
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {ammo="Staunch Tathlum", -- Sapience Orb
		 -- Halitus Helm
	     head="Fu. Bandeau +1",neck="Moonbeam Necklace",ear1="Genmei Earring",ear2="Cryptic Earring",
	     body="Emet Harness +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		 -- Ahosi Leggings
		 back=gear.enmity_jse_back,waist="Goading Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		 
    sets.Enmity.SIRD = {ammo="Staunch Tathlum",
		 -- Halitus Helm
	     head="Fu. Bandeau +1",neck="Moonbeam Necklace",ear1="Genmei Earring",ear2="Cryptic Earring",
	     body="Emet Harness +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		 -- Ahosi Leggings
		 back=gear.enmity_jse_back,waist="Rumination Sash",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.Enmity.DT = {ammo="Staunch Tathlum",
        -- Halitus Helm
	     head="Fu. Bandeau +1",neck="Moonbeam Necklace",ear1="Genmei Earring",ear2="Cryptic Earring",
	     body="Emet Harness +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		 -- Ahosi Leggings
		 back=gear.enmity_jse_back,waist="Rumination Sash",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
		-- neck="Baetyl Pendant",
        head=gear.herculean_nuke_head,neck="Sanctity Necklace", ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Evasionist's Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet="Aya. Gambieras +2"}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
		head="Erilaz Galea +1",neck="Incanter's Torque",
		ring1="Stikini Ring",ring2="Stikini Ring",
		legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Moonbeam Necklace",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        --ring2="Valseur's Ring",
		body="Futhark Coat +1",hands="Meg. Gloves +2",ring1="Defending Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Rawhide Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {--ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Carmine Greaves +1"}
			
	sets.precast.FC.DT = {ammo="Staunch Tathlum",
        head="Rune. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist Coat +1",hands="Leyline Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads'})--back="Mujin Mantle"
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet})
    
    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{ammo="Knobkierrie",
            head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
            body="Lustr. Harness +1",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
            back=gear.ws_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lustra. Leggings +1"})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{ammo="Knobkierrie",
            head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
            body="Lustr. Harness +1",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.ws_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lustra. Leggings +1"})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {--ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Carmine Greaves +1"}
		
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Rune. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist Coat +1",hands="Leyline Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head="Erilaz Galea +1",neck="Incanter's Torque",ear1="Andoaa Earring", ear2="Augment. Earring",
		hands="Runeist Mitons +1",
		back=gear.FC_jse_back,waist="Olympus Sash",legs="Futhark Trousers +1"})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		head="Futhark Bandeau +1",
		body=gear.taeon_body_Phalanx,hands=gear.taeon_hands_Phalanx,
		legs=gear.taeon_legs_Phalanx,feet=gear.taeon_feet_Phalanx})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1", neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--ear2="Earthcry Earring",
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
        head="Rune. Bandeau +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Vrikodara Jupon",hands="Buremte Gloves",ring2="Janniston Ring",
		body="Erilaz Surcoat +1", hands="Kurys Gloves", ring1="Lebeche Ring", ring2="Moonbeam Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {}--hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {}--hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {ammo='Homiliary',
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		--hands=gear.herculean_refresh_hands
		body="Runeist Coat +1", hands="Kurys Gloves", ring1="Defending Ring",ring2="Dark Ring",
		--feet=gear.herculean_refresh_feet
		back="Moonbeam Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- hands="Turms Mittens +1"
		body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- feet="Turms Leggings +1"
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.idle.KiteTank = {ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- hands="Turms Mittens +1"
		body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- feet="Turms Leggings +1"
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	sets.idle.Weak = {ammo="Homiliary",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		-- hands="Turms Mittens +1"
		body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- feet="Turms Leggings +1"
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers", waist="Chaac Belt"})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}--Refined Grip +1
	sets.weapons.Epeolatry = {main="Epeolatry", sub="Utu Grip"}
	--sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {ammo="Staunch Tathlum",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	sets.defense.PDT_HP = {ammo="Staunch Tathlum",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.defense.MDT = {ammo="Yamarang",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
       		body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.defense.MDT_HP = {ammo="Staunch Tathlum",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.defense.BDT = {ammo="Staunch Tathlum",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.defense.BDT_HP = {ammo="Staunch Tathlum",
			head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		-- Volte Cap Futhark Torque
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Hearty Earring",
		body="Runeist Coat +1",hands="Volte Bracers",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Engraved Belt
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
		-- Volte Cap Futhark Torque
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Runeist Coat +1",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.Death = {ammo="Staunch Tathlum",
       	-- Volte Cap Futhark Torque
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Runeist Coat +1",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum",
       	-- Volte Cap Futhark Torque
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Runeist Coat +1",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.Charm = {ammo="Staunch Tathlum",
      	-- Volte Cap Futhark Torque
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Runeist Coat +1",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	--------------------------------------
	-- Engaged sets
	--------------------------------------
	-- TP
    sets.engaged = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Ilabrat Ring",
            back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Digni. Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Ilabrat Ring",
            back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	-- Hybrid
	sets.engaged.DTLite = {ammo="Staunch Tathlum",
            head="Aya. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
    sets.engaged.Acc.DTLite = {ammo="Staunch Tathlum",
           head="Aya. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
			-- Turms Mittens +1
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	-- Tank
    sets.engaged.Tank = {ammo="Staunch Tathlum",
            head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
			body="Futhark Coat +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Moonbeam Ring",
            back=gear.enmity_jse_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Aya. Gambieras +2"}
	
	sets.engaged.Acc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--head="Frenzy Sallet"
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(10, 15)
	elseif player.sub_job == 'RDM' then
		set_macro_page(10, 15)
	elseif player.sub_job == 'SCH' then
		set_macro_page(10, 15)
	elseif player.sub_job == 'BLU' then
		set_macro_page(5, 15)
	elseif player.sub_job == 'WAR' then
		set_macro_page(6, 15)
	elseif player.sub_job == 'SAM' then
		set_macro_page(7, 15)
	elseif player.sub_job == 'DRK' then
		set_macro_page(8, 15)
	elseif player.sub_job == 'NIN' then
		set_macro_page(9, 15)
	else
		set_macro_page(5, 15)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
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