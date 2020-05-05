-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','Reraise')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDTReraise')
	state.MagicalDefenseMode:options('MDT','MDTReraise')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')
	state.Weapons:options('GreatKatana','Polearm','Omen','Quint','ProcWeapon','Bow') --'Dojikiri',

	gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !@^` gs c cycle Stance')
	send_command('bind !r gs c set skipprocweapons false;gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
	send_command('bind ^r gs c set skipprocweapons true;gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
	--send_command('bind ^q gs c weapons Bow;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +1",back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
    sets.precast.Step = {
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Founder's Greaves"}
    sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Flam. Zucchetto +2",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Asklepian Ring",ring2="Valseur's Ring",
        waist="Chaac Belt",legs="Wakido Haidate +3",feet="Sak. Sune-Ate +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}
	   
    -- Ranged snapshot gear
    sets.precast.RA = {}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Flam. Gambieras +2"}
   
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {feet="Wakido Sune. +3"})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Wakido Kabuto +3",body="Sakonji Domaru +3",feet="Wakido Sune. +3"})
    
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {head="Wakido Kabuto +3",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",body="Sakonji Domaru +3",hands="Wakido Kote +3",ring1="Ramuh Ring +1",feet="Wakido Sune. +3"})
    
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	sets.precast.WS.Proc = {ammo="Hasty Pinion +1",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Shoha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Shoha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Rana'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Rana'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Kasha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Kasha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Kasha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Kasha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Gekko'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Gekko'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Gekko'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Gekko'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Yukikaze'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Yukikaze'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Ageha'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.precast.WS['Tachi: Hobaku'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
		head=gear.valorous_magical_wsd_head,ear1="Friomisi Earring",
		body="Found. Breastplate", hands="Founder's Gauntlets",
		feet="Founder's Greaves"})

    sets.precast.WS['Apex Arrow'] = {
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.precast.WS['Apex Arrow'].SomeAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].FullAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Fodder = set_combine(sets.precast.WS['Apex Arrow'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Thrud Earring",ear2="Moonshade Earring",}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
		
    -- Ranged gear
    sets.midcast.RA = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.midcast.RA.Acc = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
    sets.idle = {ammo="Staunch Tathlum +1",
        -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = {ammo="Staunch Tathlum +1",
       -- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Acc = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {aammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    
	sets.engaged.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Acc.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Defending Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder.PDT = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.DTLite = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	sets.engaged.SomeAcc.DTLite = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Acc.DTLite = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc.DTLite = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder.DTLite = {ammo="Ginsen",
		-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Windbuffet Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)		
    sets.engaged.SomeAcc.Reraise = set_combine(sets.engaged.SomeAcc, sets.Reraise)		
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)		
    sets.engaged.FullAcc.Reraise = set_combine(sets.engaged.FullAcc, sets.Reraise)		
    sets.engaged.Fodder.Reraise = set_combine(sets.engaged.Fodder, sets.Reraise)		
        
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
--[[Right now Adoulin sets are the same as non-Adoulin.
	sets.engaged.Adoulin = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands=gear.valorous_wsd_hands,ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.SomeAcc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
	sets.engaged.Adoulin.Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.FullAcc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.Fodder = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Flam. Manopolas +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
    sets.engaged.Adoulin.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.SomeAcc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}	
		sets.engaged.Adoulin.Acc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.FullAcc.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Letalis Mantle",waist="Olseni Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Adoulin.Fodder.PDT = {ammo="Staunch Tathlum +1",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands=gear.valorous_wsd_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Wakido Haidate +3",feet="Amm Greaves"}
		
	sets.engaged.Adoulin.DTLite = sets.engaged.DTLite
    sets.engaged.Adoulin.SomeAcc.DTLite = sets.engaged.SomeAcc.DTLite
    sets.engaged.Adoulin.Acc.DTLite = sets.engaged.Acc.DTLite
    sets.engaged.Adoulin.FullAcc.DTLite = sets.engaged.FullAcc.DTLite
    sets.engaged.Adoulin.Fodder.DTLite = sets.engaged.Fodder.DTLite
    sets.engaged.Adoulin.Reraise = set_combine(sets.engaged.Adoulin, sets.Reraise)		
    sets.engaged.Adoulin.SomeAcc.Reraise = set_combine(sets.engaged.Adoulin.SomeAcc, sets.Reraise)		
    sets.engaged.Adoulin.Acc.Reraise = set_combine(sets.engaged.Adoulin.Acc, sets.Reraise)		
    sets.engaged.Adoulin.FullAcc.Reraise = set_combine(sets.engaged.Adoulin.FullAcc, sets.Reraise)		
    sets.engaged.Adoulin.Fodder.Reraise = set_combine(sets.engaged.Adoulin.Fodder, sets.Reraise)
]]--Right now Adoulin sets are the same as non-Adoulin.

	-- Weapons sets
	sets.weapons.Omen = {main="Norifusa",sub="Kaja Grip"}
	sets.weapons.GreatKatana = {main="Norifusa",sub="Kaja Grip"}
	sets.weapons.Quint = {main="Quint Spear",sub="Kaja Grip"}
	sets.weapons.Polearm = {main="Kaja Lance",sub="Kaja Grip"}
	sets.weapons.ProcWeapon = {main="Norifusa",sub="Kaja Grip"}
	sets.weapons.Bow = {main="Norifusa",sub="Utu Grip",range="Cibitshavore",ammo="Eminent Arrow"}
	-- Proc Weapons 
	sets.weapons.ProcDagger = {main="Chicken Knife II",sub=empty}
	sets.weapons.ProcSword = {main="Ibushi Shinai",sub=empty}
	sets.weapons.ProcGreatSword = {main="Montante",sub="Kaja Grip"}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub="Kaja Grip"}
	sets.weapons.ProcPolearm = {main="Pitchfork",sub="Kaja Grip"}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub="Kaja Grip"}
	sets.weapons.ProcClub = {main="Rounsey Wand",sub=empty}
	sets.weapons.ProcStaff = {main="Earth Staff",sub="Kaja Grip"}
	
	-- Buff sets
	sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",legs="Flamma Dirs +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {hands="Wakido Kote +3",legs="Unkai Haidate +2"}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
    sets.buff.Sengikori = {feet="Unkai Sune-Ate +2"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 17)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 17)
    elseif player.sub_job == 'NIN' then
        set_macro_page(4, 17)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 17)
    else
        set_macro_page(1,17)
    end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
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
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
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