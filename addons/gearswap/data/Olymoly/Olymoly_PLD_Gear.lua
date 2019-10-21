function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Tank', 'DDTank', 'BreathTank', 'NoShellTank', 'Reraise', 'Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'PDT_HP', 'PDT_Reraise', 'Tank')
    state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Tank','Normal','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('Default','DDWeapons','DualWeapons')
	    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Twilight'}
	
	-- Augmented Capes
	gear.phalanx_jse_back 	= 	{name="Weard Mantle", augments={'VIT+1','DEX+1','Enmity+2','Phalanx +3',}}	
	gear.TP_jse_back 		= 	{name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.WS_jse_back 		= 	{name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.WS_Req_jse_back 	= 	{name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
	gear.WS_CDC_jse_back 	= 	{name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.Enmity_jse_back	= 	{name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}}
	gear.fastcast_jse_back 	= 	{name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	send_command('alias gear exec gearpld.txt')
	send_command('alias ungear gs equip naked;exec ungearpld.txt')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Paeapua",
		--  lear="Trux Earring", 
		head="Loess Barbuta +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		-- Apeile Ring +1
		body="Souv. Cuirass +1", hands=gear_yorium_hands_enmity, lring="Supershear Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
	
	sets.Enmity.SIRD = {ammo="Staunch Tathlum", -- Impatiens
		head="Souveran Schaller +1",neck="Moonbeam Necklace",ear1="Knightly Earring",ear2="Cryptic Earring",
		body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Enmity_jse_back,waist="Rumination Sash",legs="Founder's Hose",feet="Odyssean Greaves"}
    
	sets.Enmity.DT = {ammo="Paeapua",
		-- lear="Trux Earring", 
		head="Loess Barbuta +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		-- rring="Apeile Ring +1"
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Supershear Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +1"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Rev. Coronet +1", body="Cab. Surcoat +1"})
	
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +1"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons"})
   	
    -- Add MND for Chivalry
    sets.precast.JA['Chivalry'] = {
		--ear1="Nourish. Earring",
		head="Carmine Mask +1",neck="Phalaina Locket", ear1="Nourish. Earring +1",
		body="Cab. Surcoat +1",hands="Cab. Gauntlets +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs="Mes'yohi Slacks",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {lear="Knightly Earring", hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {lear="Knightly Earring",hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Carmine Mask +1",
		--body="Rev. Surcoat +3", ring2="Valseur's Ring",
		ring1="Asklepian Ring",
		waist="Chaac Belt",legs="Sulev. Cuisses +2"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
   
	-- ACC
    sets.precast.Step = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Regal Ring", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Eschan Stone", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
	-- Macc
	sets.precast.JA['Violent Flourish'] = {ammo="Ginsen",
        --head="Founder's Corona",
		head="Flam. Zucchetto +2", neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Found. Breastplate",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Olseni Belt",
        back=gear.TP_jse_back, waist="Eschan Stone", legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells    
    sets.precast.FC = {ammo="Staunch tathlum",
		head="Carmine Mask +1", neck="Voltsurge Torque", lear="Odnowa Earring +1", rear="Odnowa Earring",
		-- Reverence Surcoat +3
		body="Odyss. Chestplate", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Moonbeam Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.precast.FC.DT = {ammo="Staunch tathlum",
		head="Carmine Mask +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Odnowa Earring",
		-- Reverence Surcoat +3 
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Kishar Ring", rring="Prolix Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Telos Earring", rear="Digni. Earring",
		body="Lustr. Harness +1", hands="Lustr. Mittens +1", lring="Regal Ring", rring="Epaminondas's Ring",
		back=gear.WS_jse_back, waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}
	
    sets.precast.WS.DT = {ammo="Staunch Tathlum",
		head="Souveran Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.precast.WS.Acc = {ammo="Ginsen",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Telos Earring", rear="Digni. Earring",
		body="Lustr. Harness +1", hands="Lustr. Mittens +1", lring="Regal Ring", rring="Epaminondas's Ring",
		back=gear.WS_jse_back, waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Sulev. Gauntlets +2", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.WS_Req_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Carm. Sc. Mail +1", hands="Carmine Fin. Ga. +1", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.WS_Req_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Begrudging Ring",
		back=gear.WS_CDC_jse_back, waist="Chiner's Belt +1", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})	
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Hasty Pinion +1",
		head="Lustratio Cap +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Lustr. Mittens +1", lring="Epaminondas's Ring", rring="Begrudging Ring",
		back=gear.WS_CDC_jse_back, waist="Chiner's Belt +1", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		head=gear_valorous_wsd_head, neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Emicho Haubert +1", hands="Sulev. Gauntlets +2", lring="Regal Ring", rring="Epaminondas's Ring",
		back=gear.WS_jse_back, waist="Prosilio Belt +1", legs="Sulev. Cuisses +2", feet="Sulev. Leggings +2"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +2", hands="Sulev. Gauntlets +2", lring="Regal Ring", rring="Epaminondas's Ring",
		back=gear.WS_jse_back, waist="Prosilio Belt +1", legs="Carmine Cuisses +1", feet="Sulev. Leggings +2"})

	-- Macc
	sets.precast.WS['Flat Blade'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Gwati Earring", ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Regal Ring",ring2="Stikini Ring",
        back=gear.WS_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.precast.WS['Flat Blade'].Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Gwati Earring", ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Regal Ring",ring2="Stikini Ring",
        back=gear.WS_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	-- MAB
    sets.precast.WS['Sanguine Blade'] = {ammo="Paeapua",
        head="Jumalik Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Epaminondas's Ring",ring2="Archon Ring",
        back=gear.WS_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Founder's Greaves"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {ammo="Paeapua",
		head="Loess Barbuta +1", neck="Fotia Gorget", ear2="Moonshade Earring", ear2="Ishvara Earring",
		--body=gear.valorous_wsd_body, hands=gear.odyssean_wsd_hands,
		body="Flamma Korazin +2", hands="Lustr. Mittens +1", ring1="Moonbeam Ring", ring2="Epaminondas's Ring",
		back=gear.enmity_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2", feet="Sulev. Leggings +2"}

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']
	
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		-- Founder/obyssean
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		body=gear_odyssean_mab_body, hands="Founder's Gauntlets", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		-- WSD Legs
		back=gear.WS_jse_back, waist="Yamabuki-no-Obi", legs="Founder's Hose", feet="Sulev. Leggings +2"})
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring",}
	sets.AccMaxTP = {ear1="Telos Earring",ear2="Cessance Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {ammo="Incantor Stone",
		head="Chev. Armet +1", neck="Voltsurge Torque",ear1="Loquac. Earring", ear2="Enchntr. Earring +1",
        --body="Rev. Surcoat +3", 
		body="Odyss. Chestplate", hands="Leyline Gloves", ring1="Moonbeam Ring", ring2="Moonbeam Ring",
		--legs=gear.odyssean_fc_legs, 
        back=gear.fastcast_jse_back, waist="Tempus Fugit", legs="Carmine Cuisses +1", feet="Odyssean Greaves"}		
		
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        --body="Rev. Surcoat +3",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Regal Gauntlets 
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Moonbeam Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet="Odyssean Greaves"}

    sets.midcast.Cure.DT = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1", neck="Loricate Torque +1", ear1="Odnowa Earring +1",ear2="Odnowa Earring", 
        -- Regal Gauntlets 
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", rring="Moonbeam Ring",
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.midcast.Reprisal = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Regal Gauntlets 
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Moonbeam Ring",
		back="Reiki Cloak", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.Self_Healing = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Moonbeam Necklace", lear="Nourish. Earring +1", rear="Knightly Earring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Moonbeam Ring",
		back=gear.Enmity_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet="Odyssean Greaves"}
		
	sets.Self_Healing.DT = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		--  body="Rev. Surcoat +3", ring2=Moonbeam Ring
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {head="Souv. Schaller +1", hands="Souv. Handsch. +1",legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash",}--feet="Shab. Sabatons +1"

    sets.midcast['Enhancing Magic'] = {
		head="Souv. Schaller +1", neck="Incanter's Torque", lear="Augment. Earring", rear="Andoaa Earring",
		body="Souv. Cuirass +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Moonbeam Cape", waist="Olympus Sash", legs="Carmine Cuisses +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {ammo="Staunch Tathlum",
		-- Obyssean Helm Phalanx +5
		head="Carmine Mask +1", neck="Incanter's Torque", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- body="Shabti Cuirass", Apeile Ring +1
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Phalanx +5 
		back=gear.phalanx_jse_back, waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Souveran Schuhs +1"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		-- neck="Coatl Gorget +1",
		head="Jumalik Helm", neck="Loricate Torque +1", ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Sulev. Cuisses +2",feet="Souveran Schuhs +1"}

    -- Idle sets
    sets.idle = {ammo="Homiliary",
		-- neck="Coatl Gorget +1",
		head="Souveran Schaller +1", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Souveran Cuirass +1",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum",
		-- Combatant's Torque
		head="Souveran Schaller +1", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Thureous Earring",
		body="Souv. Cuirass +1", hands="Chev. Gauntlets +1", lring="Moonbeam Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Chev. Cuisses +1", feet="Souveran Schuhs +1"}

    sets.idle.MDT = {ammo="Staunch Tathlum",
		-- ear2="Sanare Earring",
		head="Jumalik Helm", neck="Warder's Charm +1", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Flume Belt",legs="Souv. Diechlings +1",feet="Founder's Greaves"}
		
	sets.idle.Refresh = {ammo="Homiliary",
		--neck="Coatl Gorget +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.idle.Tank = {ammo="Staunch Tathlum",
		-- ear1="Creed Earring", 
		head="Chev. Armet +1",neck="Loricate Torque +1", ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Shadow Ring",ring2="Defending Ring",
		-- feet="Hippo. Socks +1"
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Hippomenes Socks"}
		
    sets.idle.Reraise = {ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.Weak = {ammo="Staunch Tathlum",
		head="Souveran Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Thureous Earring",
		-- Moonbeam Ring
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {lring="Supershear Ring", rring="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	-- Weapon Set
	sets.weapons.Default = {main="Burtgang",sub="Aegis"}
	sets.weapons.DDWeapons = {main="Burtgang",sub="Aegis"}
    sets.weapons.DualWeapons = {main="Burtgang",sub="Naegling"}
	
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",ear2="Ethereal Earring",waist="Flume Belt"} -- neck="Coatl Gorget +1",
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"}
    sets.MagicalShield = {sub="Aegis"}
	
    sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Chev. Armet +1", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Odnowa Earring",
        --body="Rev. Surcoat +3", 
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring", ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Odnowa Earring",
		--body="Rev. Surcoat +3", 
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring", ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Etiolation Earring",
        --body="Rev. Surcoat +3", 
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",  ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Thureous Earring",
		-- hands="Macabre Gaunt. +1",
        body="Twilight Mail", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Defending Ring",
		-- legs="Arke Cosciales",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {ammo="Staunch Tathlum",
		-- ear2="Sanare Earring",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",
        body="Twilight Mail", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Defending Ring",
		--
		back="Reiki Cloak",waist="Flume Belt", legs="Souv. Diechlings +1", feet="Cab. Leggings +1"}

	sets.defense.BDT = {ammo="Staunch Tathlum",
		head="Souveran Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", ear2="Odnowa Earring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}			
	
	sets.defense.Tank = {ammo="Staunch Tathlum",
		-- ear1="Creed Earring", 
		head="Souv. Schaller +1",neck="Loricate Torque +1", lear="Odnowa Earring +1", ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1", ring1="Shadow Ring", ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		--Founder's Corona  ear2="Sanare Earring",
        head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Supershear Ring", ring2="Purity Ring",
		--waist="Asklepian Belt",
        back="Reiki Cloak",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
		-- Founder's Corona  ear2="Sanare Earring",
        head="Souv. Schaller +1",neck="Warder's Charm +1",lear="Odnowa Earring +1",ear2="Etiolation Earring",
		-- ring1="Warden's Ring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Shadow Ring",ring2="Defending Ring",
		-- waist="Asklepian Belt", legs=gear.odyssean_fc_legs,
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
		-- Founder's Corona  neck="Unmoving Collar +1", ear2="Sanare Earring",
        head="Souv. Schaller +1",neck="Moonbeam Necklace",lear="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Supershear Ring",ring2="Purity Ring",
		-- waist="Asklepian Belt"
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1",feet="Odyssean Greaves"}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {sub="Aegis", ammo="Staunch Tathlum",
		-- Spellbr. Earring  Sanare Earring
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",				
		back="Reiki Cloak", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.OchainNoShellMDT = {sub="Aegis", ammo="Staunch Tathlum",
		-- Founder's Corona  Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
		-- Flax Sash 
		back="Moonbeam Cape", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Cab. Leggings +1"}

    sets.defense.AegisMDT = {sub="Aegis", ammo="Staunch Tathlum",
		-- Founder's Corona Spellbr. Earring  Sanare Earring
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Merman's Earring", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",				
		back="Reiki Cloak", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.AegisNoShellMDT = {sub="Aegis", ammo="Staunch Tathlum",
		-- Founder's Corona  Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Merman's Earring", rear="Etiolation Earring",
		-- Lunette Ring +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
		--  Flax Sash 
		back="Moonbeam Cape", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Cab. Leggings +1"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Moonbeam Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Souv. Diechlings +1", feet="Carmine Greaves +1"}

    sets.engaged.Acc = { ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Regal Ring", rring="Moonbeam Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Sanctity Necklace",  lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Regal Ring", rring="Moonbeam Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Sanctity Necklace",  lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Regal Ring", rring="Moonbeam Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.BreathTank = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.Acc.BreathTank = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
	
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.NoShellTank = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.engaged.Acc.Tank = {ammo="Ginsen",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)

    sets.engaged.DW.Tank = set_combine(sets.engaged.DW, {neck="Loricate Torque +1",ring2="Defending Ring",ring1="Moonbeam Ring"})
    sets.engaged.DW.Acc.Tank = set_combine(sets.engaged.DW.Acc, {neck="Loricate Torque +1",ring2="Defending Ring",ring1="Moonbeam Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 16)
    elseif player.sub_job == 'RDM' then
        set_macro_page(5, 16)
    elseif player.sub_job == 'BLU' then
        set_macro_page(4, 16)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 16)
    else
        set_macro_page(3, 16) --War/Etc
    end
end

buff_spell_lists = {
	Auto = {	
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},
		{Name='Reprisal',	Buff='Reprisal',		SpellID=97,		When='Always'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
	},
	
	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Reprisal',	Buff='Reprisal',		SpellID=97,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Cocoon',		Buff='Defense Boost', 	SpellID=547,	Reapply=false},
	},
}