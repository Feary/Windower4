-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor')
	
	-- Avatar Ammo - Sancus Sachet +1
	gear.avatar_ammo = {name="Idaraaja"}
	-- Staves
	-- Nirvana
	gear.perp_staff = {name="Gridarvor"}
	gear.skill_staff = {name="Espiritus"}
	gear.phys_BP_Staff = {name="Gridarvor"}
	-- Nirvana grioavolr
	gear.magic_BP_Staff = {name="Gridarvor"}

	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.FC_jse_back = {name="Campestres's Cape",augments={'"Fast Cast"+10',}}
	gear.Cure_jse_back = {}
	
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
	
	send_command('alias fol send @others follow Olymoly')
	send_command('alias aoe input /targetnpc;send @all /ma "Thunderspark" <t>')
	send_command('alias stun input /targetnpc;send @all /ma "Thunderspark" <t>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Volte Bracers"})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {main="Gridarvor", sub="Vox Grip", ammo="Esper Stone +1",
		-- neck="Incanter's Torque"
        head=gear_telchine_head_Siphon, neck="Caller's Pendant", ear1="Andoaa Earring",ear2="Gifted Earring",
		-- hands="Baayami Cuffs"
        body=gear_telchine_body_Siphon, hands="Glyphic Bracers +1", ring1="Evoker's Ring", ring2="Stikini Ring",
        back="Conveyance Cape",waist="Lucidity Sash", legs=gear_telchine_legs_Siphon,feet="Beck. Pigaches"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
	-- 
    sets.precast.BloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,--ammo="Sancus Sachet +1",
		-- neck="Incanter's Torque",
		head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Evans Earring",
        -- body="Con. Doublet +3", hands="Baayami Cuffs",
		body="Con. Doublet +3", hands="Glyphic Bracers +1", ring1="Evoker's Ring",ring2="Stikini Ring",
        -- legs="Baayami Slops", feet="Baayami Sabots"
		back="Conveyance Cape", waist="Lucidity Sash", legs="Glyphic Spats +1", feet="Glyph. Pigaches +1"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells    
    sets.precast.FC = {main="Oranyan", ammo="Impatiens",
		-- main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		head="Merlinic Hood",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		-- Zendik Robe
		body="Inyanga Jubbah +2", hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring",
		gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})--main="Serenity",sub="Clerisy Strap +1"
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found. MP + Gear
    sets.precast.WS['Myrkr'] = {ammo=gear.avatar_ammo, 
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        -- ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		body="Con. Doublet +3",hands="Lamassu Mitts",ring1="Evoker's Ring",ring2="Prolix Ring",
		back="Conveyance Cape", waist="Luminary Sash", legs="Beck. Spats +1", feet="Beck. Pigaches"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2", hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
	
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
		-- neck="Incanter's Torque",
		head="Vanya Hood", neck="Colossus's Torque", ear1="Mendicant's Earring", ear2="Gifted Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Stikini Ring",ring2="Sirona's Ring",
		--feet="Vanya Clogs"
        back=gear.Cure_jse_back,waist="Austerity Belt",legs="Gyve Trousers", feet="Regal Pumps +1"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}-- waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {back="Grapevine Cape",}--waist="Gishdubar Sash",feet="Inspirited Boots"
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",
		--hands="Hieros Mittens", ring1="Haoma's Ring", ring2="Haoma's Ring", 
		back=gear.Cure_jse_back,waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"

	sets.midcast['Elemental Magic'] = {main="Gridarvor",sub="Enki Strap",
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops",feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Gridarvor",sub="Enki Strap",ammo="Dosis Tathlum",
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops",feet="Amalric Nails"}

    sets.midcast['Divine Magic'] = {main="Gridarvor",sub="Enki Strap",
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops",feet="Amalric Nails"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Incanter's Torque
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops",feet="Amalric Nails"}
		
	sets.midcast.Drain = {main="Rubicundity",sub="Genbu's Shield",
       	--Ammurapi Shield Incanter's Torque
        head="Pixie Hairpin +1",neck="Sanctity Necklace", ear1="Digni. Earring", ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back,waist="Fucho-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
		
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main="Gridarvor",sub="Enki Strap",ammo="Hasty Pinion +1",
		head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs=gear_chironic_macc_legs,feet="Regal Pumps +1"}
		
    sets.midcast.Stun.Resistant = {main="Gridarvor",sub="Enki Strap",ammo="Hasty Pinion +1",
		head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Prolix Ring",
		back=gear.Cure_jse_back,waist="Witful Belt",legs="Amalric Slops",feet="Regal Pumps +1"}
		
	sets.midcast['Enfeebling Magic'] = {main="Gridarvor",sub="Enki Strap",
		--Ammurapi Shield Incanter's Torque 
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back, waist="Luminary Sash",legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Gridarvor",sub="Enki Strap",
		--Ammurapi Shield Incanter's Torque 
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.Cure_jse_back, waist="Luminary Sash",legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main=empty,sub="Genbu's Shield",ammo="Hasty Pinion +1",
		--neck="Incanter's Torque",
		head=gear_telchine_head_Duration,ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear_telchine_body_Duration,hands=gear_telchine_hands_Duration,ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.FC_jse_back,waist="Olympus Sash",legs=gear_telchine_legs_Duration,feet=gear_telchine_feet_Duration}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif +1"
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    -- Avatar pact sets.  All pacts are Ability type.
    -- Skill
    sets.midcast.Pet.BloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
        --neck="Incanter's Torque"
		head="Beckoner's Horn +1", beck="Caller's Pendant", ear1="Andoaa Earring", ear2="Gifted Earring",
		--hands="Baayami Cuffs",
        body="Beck. Doublet +1", hands="Lamassu Mitts", ring1="Evoker's Ring", ring2="Stikini Ring",
        -- legs="Baayami Slops",feet="Baayami Sabots"
		back="Conveyance Cape", waist="Lucidity Sash", legs="Beck. Spats +1", feet="Rubeus Boots"}
	
	-- Pet Macc/Skill
    sets.midcast.Pet.DebuffBloodPactWard = {main="Gridarvor",sub="Vox Grip", ammo=gear.avatar_ammo,
		-- Apogee Mitts +1 Path D
        head="Convoker's Horn +3", neck="Adad Amulet", ear1="Lugalbanda Earring", ear2="Enmerkar Earring",
        body="Con. Doublet +3", hands="Convo. Bracers +2",ring1="Evoker's Ring", ring2="Stikini Ring",
        back=gear.magic_jse_back, waist="Regal Belt", legs="Convo. Spats +2", feet="Convo. Pigaches +3"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
	-- Physical 
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head=gear_helios_head_BP, neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear_merlinic_physpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet=gear.phys_BP_feet}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {main="Gridarvor",sub="Elan Strap +1",ammo=gear.avatar_ammo,
        head="Apogee Crown +1", neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear_merlinic_physpact_hands, ring1="Varar Ring +1", ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet="Convo. Pigaches +3"}
 
	-- Magical 
    sets.midcast.Pet.MagicalBloodPactRage = {main="Eminent Pole",sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Enticer's Pants", feet=gear.magic_BP_feet}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

	sets.midcast.Pet['Flaming Crush'] = {main="Gridarvor",sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Enticer's Pants", feet=gear.magic_BP_feet}
	
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}
   
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

	 -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Glyphic Spats +1"})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Vox Grip",ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    -- Idle sets
    sets.idle = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    sets.idle.PDT = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        -- Udug Jacket
		body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Regal Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
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
    
    sets.idle.Avatar = {main=gear.perp_staff, sub="Vox Grip",ammo=gear.avatar_ammo,
		-- Nirvana Oneiros Grip 
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Defending Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
	sets.idle.PDT.Avatar = {main=gear.perp_staff, sub="Vox Grip",ammo=gear.avatar_ammo,
		-- Nirvana Oneiros Grip 
        head="Convoker's Horn +3",neck="Loricate Torque +1",ar1="Handler's Earring +1",ear2="Handler's Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Regal Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {main=gear.perp_staff,sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Sheltered Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {main=gear.perp_staff, sub="Vox Grip",ammo=gear.avatar_ammo,
		head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Lucidity Sash",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {})--neck="Chrys. Torque"
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {head="Beckoner's Horn +1"}
    sets.idle.Avatar.Engaged = {head="Beckoner's Horn +1"}
	
	sets.idle.Avatar.Engaged.Carbuncle = {hands="Asteria Mitts +1"}
	sets.idle.Avatar.Engaged['Cait Sith'] = {hands="Lamassu Mitts"}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}--hands="Asteria Mitts"
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        -- Udug Jacket
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MDT = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MEVA = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Inyanga Jubbah +2", hands="Inyanga Dastanas +2",ring1="Dark Ring",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--[[sets.HPDown = {head="Apogee Crown +1 +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=gear.FC_jse_back,legs="Apogee Slacks +1",feet="Apogee Pumps +1"]]
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap +1"}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Gridarvor",sub="Elan Strap +1",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3", neck="Shulmanu Collar", ear1="Digni. Earring", ear2="Telos Earring",
        body="Con. Doublet +3", hands="Convo. Bracers +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        --waist="Olseni Belt",
		back=gear.phys_jse_back, waist="Windbuffet belt +1", legs="Convo. Spats +2",feet="Convo. Pigaches +3"}
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
