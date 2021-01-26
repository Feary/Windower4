-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Evole', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Twashtar','LowBuff','Omen')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	gear.DA_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.DW_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.stp_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.wsd_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.crit_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.fc_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	-- haste 30
	sets.DWEarrings = {body="Adhemar Jacket +1", back=gear.DW_jse_back, waist="Reiki Yotai", ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	-- 15% haste
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	
	-- Weapons sets
	sets.weapons.Twashtar = {main="Twashtar", sub="Kaja Knife"}--Blurred Knife +1
	sets.weapons.LowBuff = {main="Twashtar", sub="Blurred Knife +1"}
	sets.weapons.Omen = {main="Pugiunculus", sub="Demersal Degen"}
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +1"}
    sets.precast.JA['Trance'] = {head="Horos Tiara +1"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
		-- Etoile Collar +2 neck="Unmoving Collar +1",
        head="Mummu Bonnet +2",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
		-- Carbuncle Ring +1 Carbuncle Ring +1
        body="Maxixi Casaque",hands="Regal Gloves",ring1="Defending Ring",ring2="Valseur's Ring",
        back="Toetapper Mantle",waist="Chaac Belt",legs="Dashing Subligar",feet="Maxixi Toe Shoes"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara", back=gear.stp_jse_back}

    sets.precast.Jig = {legs="Horos Tights +1", feet="Maxixi Toe Shoes"}

    sets.precast.Step = {ammo="Yamarang",
		-- Mache Earring +1 
        head="Maxixi Tiara",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Digni. Earring",
		-- Maxixi Casaque +3 Maxixi Bangles +3 Chirich Ring +1
        body="Maxixi Casaque",hands="Maxixi Bangles",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Maxixi Tights +1",feet="Horos Toe Shoes +1"}
		
    sets.Enmity = {ammo="Paeapua",
        --head="Halitus Helm", neck="Unmoving Collar +1",
		ear1="Friomisi Earring",ear2="Cryptic Earring",
        -- Horos Bangles +3
		body="Emet Harness +1",hands="Horos Bangles +1",ring1="Petrov Ring",ring2="Supershear Ring",
        back="Reiki Cloak",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Malignance Boots"}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Digni. Earring",
        -- Horo Casaque +3
		body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Horos Tights +3
        back=gear.stp_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Mummu Gamashes +2"}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Digni. Earring",
		-- Chirich Ring +1  Chirich Ring +1
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.fc_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet="Mummu Gamashes +2"}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle", hands="Maculele Bangles"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Maculele Casaque +1"}
    sets.precast.Flourish3['Climactic Flourish'] = {}

    -- Fast cast sets for spells    
    sets.precast.FC = {ammo="Impatiens",
		head="Herculean Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Yamarang",
        head="Lustratio Cap +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Lustra. Leggings +1"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {ammo="Yamarang",
        head="Lustratio Cap +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Samnuha Tights",feet="Lustra. Leggings +1"})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Yamarang",
        head="Lustratio Cap +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Lustra. Leggings +1"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Yamarang",
        head="Lustratio Cap +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Lustra. Leggings +1"})
	sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Maculele Tiara",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	
	sets.precast.WS["Dancing Edge"] = set_combine(sets.precast.WS, {ammo="Charis Feather",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Horos Casaque +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Dancing Edge"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Horos Casaque +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Dancing Edge"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Horos Casaque +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS["Dancing Edge"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Horos Casaque +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS["Dancing Edge"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="Charis Feather",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Horos Casaque +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",
        -- Etoile Gorget +2 Odr Earring
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- lring="Gere Ring"
		body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Odr Earring
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Odr Earring
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Charis Feather",
        -- Etoile Gorget +2 Odr Earring
		head="Mummu Bonnet +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Mummu Wrists +2",ring1="Ilabrat Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {ammo="Ginsen",
        -- Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        -- Horo Casaque +3 Gere Ring 
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epaminondas's Ring",ring2="Epona's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Lustra. Leggings +1"})
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Ginsen",
        -- Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        -- Horo Casaque +3 Gere Ring 
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epaminondas's Ring",ring2="Epona's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Lustra. Leggings +1"})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
        -- Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        -- Horo Casaque +3 Gere Ring 
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epaminondas's Ring",ring2="Epona's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Lustra. Leggings +1"})
	sets.precast.WS['Pyrrhic Kleos'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Ginsen",
        -- Etoile Gorget +2 Mache Earring +1
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        -- Horo Casaque +3 Gere Ring 
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epaminondas's Ring",ring2="Epona's Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Lustra. Leggings +1"})
	sets.precast.WS['Pyrrhic Kleos'].Fodder = set_combine(sets.precast.WS['Pyrrhic Kleos'], {})

    sets.precast.WS['Aeolian Edge'] = {head=empty, body=empty, hands=empty, legs=empty, feet=empty}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}-- ear1="Mache Earring +1"
	
    sets.Skillchain = {hands="Maculele Bangles"} 
    
    
    -- Midcast Sets    
    sets.midcast.FastRecast = {}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {body="Turms Harness"}
    

    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
        -- Malignance Tabard  Malignance Gloves 
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		-- Malignance Tights
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}
	 sets.idle.Evasion = {ammo="Staunch Tathlum",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
        -- Malignance Tabard Malignance Gloves 
		body="Turms Harness",hands="Turms Mittens +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		-- Malignance Tights
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}	
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
    
    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        -- Malignance Tabard Malignance Gloves 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", ring1="Defending Ring", ring2="Moonbeam Ring",
		-- Malignance Tights 
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Malignance Chapeau",neck="Loricate Torque +1", ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		-- Turms Harness +1
		body="Turms Harness",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Purity Ring",
		-- Malignance Tights
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Yamarang",
		-- rear="Sanare Earring"
        head="Turms Cap +1",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
        -- Turms Harness +1
		body="Turms Harness", hands="Turms Mittens +1", ring1="Defending Ring",ring2="Purity Ring",
		-- Malignance Tights
        back=gear.stp_jse_back,waist="Flume Belt",legs="Mummu Kecks +2", feet="Turms Leggings +1"}

    sets.Kiting = {feet="Tandava Crackows"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense mod6es.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.DTLite = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.SomeAcc = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
	sets.engaged.Acc = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.FullAcc = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.Fodder = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.PDT = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.SomeAcc.PDT = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.Acc.PDT = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.FullAcc.PDT = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.Fodder.PDT = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Gere Ring 
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs="Horos Tights +1"} 
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",
        -- Etoile Gorget +2
		head="Maculele Tiara +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        -- Maxixi Bangles +3
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Epaminondas's Ring",ring2="Regal Ring",
		-- Horo Tights +3
        back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 18)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 18)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 18)
    else
        set_macro_page(2, 18)
    end
end