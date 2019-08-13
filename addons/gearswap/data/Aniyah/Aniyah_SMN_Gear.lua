-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.Weapons:options('None','Gridarvor','Nirvana')

	-- Avatar Ammo - 
	gear.avatar_ammo = {name="Sancus Sachet +1"}
	-- Staves 
	gear.perp_staff = {name="Nirvana"}
	gear.skill_staff = {name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}
	gear.phys_BP_Staff = {name="Nirvana"}
	-- Grioavolr BPD +10  
	gear.magic_BP_Staff = {name="Nirvana"}
	gear.macc_BP_Staff = {name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}
	
	gear.magic_jse_back = {name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.phys_jse_back = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+10 /Mag. Eva.+10','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.FC_jse_back = {name="Campestres's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = {name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.phys_BP_feet = {name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
	gear.magic_BP_feet = {name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	
	
	--[[Global binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
	]]
	
	-- Additional Binds
    send_command('bind !` gs c toggle PactSpamMode')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	
	send_command('alias fol send @others follow Aniyah')
	send_command('alias aoe input /targetnpc;send @all /ma "Thunderspark" <t>')
	send_command('alias stun input /targetnpc;send @all /ma "Thunderspark" <t>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {main=gear.skill_staff, sub="Vox Grip", 
		-- ammo="Esper Stone +1",
		--neck="Incanter's Torque"
        head=gear_telchine_head_Siphon, neck="Caller's Pendant", ear1="Andoaa Earring",ear2="Gifted Earring",
		-- hands="Baayami Cuffs"
        body=gear_telchine_body_Siphon, hands="Glyphic Bracers +1", ring1="Evoker's Ring", ring2="Stikini Ring",
		-- waist="Kobo Obi",
		back="Conveyance Cape", legs=gear_telchine_legs_Siphon, feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
	-- 
    sets.precast.BloodPactWard = {main=gear.skill_staff,sub="Vox Grip",ammo=gear.avatar_ammo,
		-- neck="Incanter's Torque",
		head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Evans Earring",
        -- hands="Baayami Cuffs",
		body="Con. Doublet +3", hands="Glyphic Bracers +1", ring1="Evoker's Ring",ring2="Stikini Ring",
        -- waist="Kobo Obi", legs="Baayami Slops", feet="Baayami Sabots"
		back="Conveyance Cape", legs="Glyphic Spats +1", feet="Glyphic Pigaches +1"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells    
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", 
		--ammo="Impatiens",
		--ar2="Enchntr. Earring +1",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", 
		body="Inyanga Jubbah +2", hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring",
		gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})--main="Serenity",sub="Clerisy Strap +1"
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
      sets.precast.WS = {
		 head="Welkin Crown", neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Witching Robe", hands="Amalric Gages", ring1="Shiva's Ring", ring2="Shiva's Ring",
		back=gear.ws_jse_back, waist="Cascade Belt", legs="Tali'ah Sera. +2", feet="Amalric Nails"}

    -- Specific weaponskill sets.  
	sets.precast.WS['Garland of Bliss'] = {ammo=gear.avatar_ammo, 
        head="Welkin Crown", neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Witching Robe", hands="Amalric Gages", ring1="Shiva's Ring", ring2="Shiva's Ring",
		back=gear.ws_jse_back, waist="Cascade Belt", legs="Tali'ah Sera. +2", feet="Amalric Nails"}
	  
	sets.precast.WS['Shattersoul'] = {ammo=gear.avatar_ammo, 
		 head="Welkin Crown", neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Witching Robe", hands="Amalric Gages", ring1="Shiva's Ring", ring2="Shiva's Ring",
		back=gear.ws_jse_back, waist="Cascade Belt", legs="Tali'ah Sera. +2", feet="Amalric Nails"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found. MP + Gear
    sets.precast.WS['Myrkr'] = {ammo=gear.avatar_ammo,
		-- neck="Sanctity Necklace",
        head="Beckoner's Horn +1", ear1="Etiolation Earring",ear2="Gifted Earring",
        -- hands="Lamassu Mitts", 
		body="Con. Doublet +3", ring1="Evoker's Ring", ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		-- waist="Luminary Sash",
		back="Conveyance Cape",  legs="Beck. Spats +1", feet="Beck. Pigaches +1"}
	
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Hasty Pinion",
		head="Haruspex Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Lebeche Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails"}
	
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion",
		-- head="Vanya Hood", neck="Incanter's Torque", ear1="Mendicant's Earring",
		head="Haruspex Hat",neck="Phalaina Locket", ear2="Gifted Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Stikini Ring",ring2="Sirona's Ring",
		--feet="Vanya Clogs" legs="Gyve Trousers",
        back=gear.Cure_jse_back,waist="Austerity Belt", feet="Amalric Nails"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}-- waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		-- neck="Debilis Medallion",
		-- hands="Hieros Mittens", ring1="Haoma's Ring", ring2="Haoma's Ring", 
		-- back="Tempered Cape +1",
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"

	sets.midcast['Elemental Magic'] = {main="Kaja Rod", sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast['Elemental Magic'].Resistant = {main="Kaja Rod", sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Shiva Ring",ring2="Shiva Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
    sets.midcast['Divine Magic'] = {main="Kaja Rod", sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
    sets.midcast['Dark Magic'] = {main="Kaja Rod", sub="Ammurapi Shield",
		-- Incanter's Torque ear2="Enchntr. Earring +1",
        head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Gwati Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast.Drain = {main="Kaja Rod", sub="Ammurapi Shield",
		-- head="Pixie Hairpin +1", Incanter's Torque ear1="Digni. Earring",
        neck="Voltsurge Torque", ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back,waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Amalric Nails"}
		
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main=gear_grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion",
		-- ear2="Enchntr. Earring +1",
		head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet="Amalric Nails"}
		
    sets.midcast.Stun.Resistant = {main=gear_grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion",
		-- ear2="Enchntr. Earring +1",
		head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Gwati Earring",
		body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Prolix Ring",
		back=gear.Cure_jse_back,waist="Witful Belt",legs="Inyanga Shalwar +2",feet="Amalric Nails"}
		
	sets.midcast['Enfeebling Magic'] = {main="Kaja Rod", sub="Ammurapi Shield",
		--Incanter's Torque  ear1="Digni. Earring", ear2="Enchntr. Earring +1",
        head="Inyanga Tiara +2",neck="Voltsurge Torque", ear1="Gwati Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Kaja Rod", sub="Ammurapi Shield",
		--Incanter's Torque  ear1="Digni. Earring",ear2="Enchntr. Earring +1",
        head="Inyanga Tiara +2",neck="Voltsurge Torque", ear1="Gwati Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring",ring2="Stikini Ring",
		-- waist="Luminary Sash",
		back=gear.Cure_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {
		--neck="Incanter's Torque",
		head=gear_telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear_telchine_body_Duration,hands=gear_telchine_hands_Duration,ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.FC_jse_back,waist="Cascade Belt",legs=gear_telchine_legs_Duration,feet=gear_telchine_feet_Duration}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif +1"
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",})--sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    -- Avatar pact sets.  All pacts are Ability type.
    -- Skill
    sets.midcast.Pet.BloodPactWard = {main=gear.skill_staff,sub="Vox Grip",ammo=gear.avatar_ammo,
        --neck="Incanter's Torque"
		head="Beckoner's Horn +1",beck="Caller's Pendant",ear1="Andoaa Earring",ear2="Gifted Earring",
		--hands="Baayami Cuffs", hands="Lamassu Mitts",
        body="Beck. Doublet +1", hands="Glyphic Bracers +1", ring1="Evoker's Ring", ring2="Stikini Ring",
        --  legs="Baayami Slops", feet="Baayami Sabots"
		back="Conveyance Cape", legs="Beck. Spats +1", feet="Rubeus Boots"}
	
	-- Pet Macc/Skill
    sets.midcast.Pet.DebuffBloodPactWard = {main=gear.macc_BP_Staff,sub="Vox Grip",ammo=gear.avatar_ammo,
		-- neck="Summoner's Collar +2", 
		head="Convoker's Horn +3", neck="Adad Amulet", ear1="Lugalbanda Earring", ear2="Enmerkar Earring",
		-- hands="Apogee Mitts +1", Path D
		body="Con. Doublet +3", hands="Tali'ah Gages +2", ring1="Evoker's Ring",ring2="Stikini Ring",
        back=gear.magic_jse_back, waist="Regal Belt", legs="Convo. Spats +3", feet="Convo. Pigaches +3"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main=gear.phys_BP_Staff,sub="Elan Strap +1", ammo=gear.avatar_ammo,
        -- neck="Summoner's Collar +2", 
		head=gear_helios_head_BP, neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear_merlinic_physpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet=gear.phys_BP_feet}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {main=gear.phys_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
		-- neck="Summoner's Collar +2", ear1="Kyrene's Earring", 
        head=gear_helios_head_BP, neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear_merlinic_physpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet="Convo. Pigaches +3"}
		
	-- Magical BloodPactRage
    sets.midcast.Pet.MagicalBloodPactRage = {main=gear.magic_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
		-- Nirvana
        -- Path A neck="Summoner's Collar +2", 
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring", 
        -- body="Apo. Dalmatica +1", Path A
        body="Con. Doublet +3", hands=gear_merlinic_magpact_hands, ring1="Varar Ring +1", ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Enticer's Pants", feet=gear.phys_BP_feet}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}
	
	sets.midcast.Pet['Flaming Crush'] = {main=gear.phys_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
        --  Path A neck="Summoner's Collar +2", 
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3",hands=gear_merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Apogee Slacks +1", feet=gear.magic_BP_feet}
	
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Glyphic Spats +1"})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}	

	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Boonwell Staff", sub="Kaja Grip", ammo=gear.avatar_ammo,
		head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    -- Idle sets
    sets.idle = {main=gear.perp_staff,sub="Kaja Grip", ammo=gear.avatar_ammo,
		-- Contemp staff
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- Stikini Ring +1
        body="Shomonjijoe +1",hands=gear_merlinic_refresh_hands,ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    sets.idle.PDT = {main=gear.perp_staff,sub="Kaja Grip",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	sets.idle.MDT = {main=gear.perp_staff,sub="Irenic Strap +1",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	sets.idle.MEVA = {main=gear.perp_staff,sub="Irenic Strap +1",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {}) -- neck="Chrys. Torque"

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic Horn +1: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convo. Pigaches +3 +1: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main=gear.perp_staff, sub="Kaja Grip", ammo=gear.avatar_ammo,
		head="Convoker's Horn +3",neck="Caller's Pendant", ear1="Enmerkar Earring", ear2="Evans Earring",
		-- Apo. Dalmatica +1 Path D ring2="Stikini Ring +1",
        body="Glyphic Doublet +3", hands="Asteria Mitts +1", ring1="Evoker's Ring",ring2="Defending Ring",
        -- feet="Bayaami Sabots +1"
		back=gear.magic_jse_back, waist="Isa Belt", waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Avatar = {main=gear.perp_staff, sub="Kaja Grip",ammo=gear.avatar_ammo,
		-- ear2="Handler's Earring +1",
		head="Convoker's Horn +3",neck="Caller's Pendant", ear1="Enmerkar Earring", ear2="Evans Earring",
		-- Apo. Dalmatica +1 Path D ring2="Stinkini Ring +1",
        body="Glyphic Doublet +3",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Defending Ring",
        -- feet="Bayaami Sabots +1"
		back=gear.magic_jse_back, waist="Isa Belt", legs="Assid. Pants +1", feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {main=gear.perp_staff,sub="Kaja Grip",ammo=gear.avatar_ammo,
		head="Convoker's Horn +3",neck="Caller's Pendant",  ear1="Enmerkar Earring", ear2="Evans Earring",
		-- Apo. Dalmatica +1 Path D ring2="Stikini Ring +1",
        body="Glyphic Doublet +3",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Defending Ring",
        -- feet="Bayaami Sabots +1"
		back=gear.magic_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {main=gear.perp_staff, sub="Kaja Grip", ammo=gear.avatar_ammo,
		-- ear2="Handler's Earring +1",
		head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Enmerkar Earring", ear2="Evans Earring",
		-- Apo. Dalmatica +1 Path D ring2="Stinkini Ring +1",
        body="Glyphic Doublet +3", hands="Asteria Mitts +1", ring1="Evoker's Ring",ring2="Defending Ring",
        -- feet="Bayaami Sabots +1"
		back=gear.magic_jse_back, waist="Isa Belt", legs="Assid. Pants +1", feet="Convo. Pigaches +3"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {})--neck="Chrys. Torque"
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {head="Beckoner's Horn +1"}
    sets.idle.Avatar.Engaged = {head="Beckoner's Horn +1"}
	
	sets.idle.Avatar.Engaged.Carbuncle = {hands="Asteria Mitts +1"}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}--hands="Lamassu Mitts +1"
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridarvor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {hands="Asteria Mitts +1"}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
	sets.perp.Odin = sets.midcast.Pet.BloodPactWard
	
	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {main="Gridarvor", sub="Kaja Grip", ammo=gear.avatar_ammo,
		-- ear1="Handler's Earring +1", ear2="Handler's Earring",
        head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Rimeice Earring", 
		-- Udug Jacket
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MDT = {main="Gridarvor", sub="Kaja Grip", ammo=gear.avatar_ammo,
		--ear1="Handler's Earring +1",ear2="Handler's Earring",
        head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Rimeice Earring", 
        -- Udug Jacket
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MEVA = {main="Gridarvor", sub="Enki Strap", ammo=gear.avatar_ammo,
		--ear1="Handler's Earring +1",ear2="Handler's Earring",
		head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Rimeice Earring", 
        --  Udug Jacket
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Vocane Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--[[sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=gear.FC_jse_back,legs="Apogee Slacks +1",feet="Apogee Pumps +1"]]
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Gridarvor =  	{main="Gridarvor", sub="Kaja Grip", ammo=gear.avatar_ammo}
	sets.weapons.Nirvana = 		{main="Nirvana", sub="Kaja Grip", ammo=gear.avatar_ammo}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Nirvana", sub="Kaja Grip", ammo=gear.avatar_ammo,
		-- ear1="Digni. Earring",ear2="Telos Earring",
        head="Convoker's Horn +3", neck="Shulmanu Collar", 
		body="Con. Doublet +3", hands="Convo. Bracers +2", ring1="Varar Ring +1", ring2="Varar Ring +1",
        --waist="Olseni Belt", 
		back=gear.FC_jse_back, waist="Windbuffet Belt", legs="Convo. Spats +3", feet="Convo. Pigaches +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
		set_macro_page(1, 7)
    end
    
    -- Default macro set/book
    set_macro_page(1, 7)
end
