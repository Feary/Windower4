-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor')

    gear.perp_staff = {name="Gridarvor"}
	--gear.grioavolr_fc_staff
	--gear.grioavolr_nuke_staff
	
	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	gear.FC_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    
    sets.precast.JA['Elemental Siphon'] = {main="Gridarvor", sub="Vox Grip", ammo="Esper Stone +1",
		--neck="Incanter's Torque"
        head=gear_telchine_head_Siphon,neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Gifted Earring",
		--gear_telchine_body_Siphon hands="Baayami Cuffs"
        body="Telchine Chasuble",ring1="Evoker's Ring",ring2="Stikini Ring",
		-- gear_telchine_legs_Siphon waist="Kobo Obi",
        back="Conveyance Cape",waist="Cimmerian Sash", legs="Telchine Braconi",feet="Beck. Pigaches"}

    sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo="Eminent Sachet",--ammo="Eminent Sachet",
		-- neck="Incanter's Torque",
		head="Beckoner's Horn",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Evans Earring",
        --body="Con. Doublet +3" ,hands="Baayami Cuffs",
		body="Glyphic Doublet", hands="Glyphic Bracers",ring1="Evoker's Ring",ring2="Stikini Ring",
        --waist="Kobo Obi",legs="Baayami Slops",feet="Baayami Sabots"
		back="Conveyance Cape", waist="Cimmerian Sash", legs="Glyphic Spats", feet="Glyphic Pigaches"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Magavan Gloves",ring2="Prolix Ring",
		gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants", feet="Almaric Nails"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})--main="Serenity",sub="Clerisy Strap +1"
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found. MP + Gear
    sets.precast.WS['Myrkr'] = {ammo="Eminent Sachet",
		--neck="Sanctity Necklace"
        head="Beckoner's Horn",neck="Dualism Collar",ear1="Etiolation Earring",ear2="Gifted Earring",
        -- Con. Doublet +3 ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		body="Beckoner's Doublet",hands="Lamassu Mitts",ring1="Evoker's Ring",ring2="Prolix Ring",
        --waist="Luminary Sash",
		back="Conveyance Cape", waist="Fucho-no-obi", legs="Beckoner's Spats", feet="Beck. Pigaches"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Loquacious Earring", ear2="Enchntr. Earring +1",
		-- ring1="Kishar Ring",
		body="Inyanga Jubbah +2", hands="Magavan Gloves", ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps"}
	
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Hasty Pinion +1",
		-- head="Vanya Hood",neck="Incanter's Torque", ear1="Mendicant's Earring",
		head="Nahtirah Hat", neck="Colossus's Torque", ear1="Roundel Earring", ear2="Gifted Earring",
        body="Heka's Kalasiris",hands=gear_telchine_hands_Cure,ring1="Stikini Ring",ring2="Sirona's Ring",
		--,feet="Vanya Clogs"
        back="Tempered Cape +1",waist="Austerity Belt",legs="Gyve Trousers"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}-- waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {}--back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",
		--hands="Hieros Mittens", ring1="Haoma's Ring", ring2="Haoma's Ring", 
		back="Tempered Cape +1",waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"

	sets.midcast['Elemental Magic'] = {main="Gridarvor",sub="Elder Grip +1",ammo="Dosis Tathlum",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Amalric Slops",feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Gridarvor",sub="Elder Grip +1",ammo="Dosis Tathlum",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Amalric Slops",feet="Amalric Nails"}

    sets.midcast['Divine Magic'] = {main="Gridarvor",sub="Elder Grip +1",ammo="Dosis Tathlum",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Amalric Slops",feet="Amalric Nails"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Incanter's Torque
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Amalric Slops",feet="Amalric Nails"}
		
	sets.midcast.Drain = {main="Rubicundity",sub="Genbu's Shield",
       	--Ammurapi Shield head="Pixie Hairpin +1", Incanter's Torque ear1="Digni. Earring",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Fucho-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
		
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main="Gridarvor",sub="Elder Grip +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps"}
		
    sets.midcast.Stun.Resistant = {main="Gridarvor",sub="Elder Grip +1",ammo="Hasty Pinion +1",
		head="Inyanga Tiara +2",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Prolix Ring",
		back="Ogapepo Cape",waist="Witful Belt",legs="Amalric Slops",feet="Regal Pumps"}
		
	sets.midcast['Enfeebling Magic'] = {main="Gridarvor",sub="Elder Grip +1",
		 	--Ammurapi Shield head="Pixie Hairpin +1", Incanter's Torque ear1="Digni. Earring",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Fucho-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Gridarvor",sub="Elder Grip +1",
		--Ammurapi Shield head="Pixie Hairpin +1", Incanter's Torque ear1="Digni. Earring",
        head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Fucho-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main=empty,sub="Genbu's Shield",ammo="Hasty Pinion +1",
		--neck="Incanter's Torque",
		head=gear_telchine_head_Duration,ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear_telchine_body_Duration,hands=gear_telchine_hands_Duration,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Ogapepo Cape",waist="Olympus Sash",legs=gear_telchine_legs_Duration,feet=gear_telchine_feet_Duration}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif +1"
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    -- Avatar pact sets.  All pacts are Ability type.
    -- Skill
    sets.midcast.Pet.BloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo="Eminent Sachet",
        --neck="Incanter's Torque"
		head="Beckoner's Horn",beck="Caller's Pendant",ear1="Andoaa Earring",ear2="Gifted Earring",
		--hands="Baayami Cuffs",
        body="Beckoner's Doublet",hands="Lamassu Mitts", ring1="Evoker's Ring",ring2="Stikini Ring",
        --waist="Kobo Obi" legs="Baayami Slops",feet="Baayami Sabots"
		back="Conveyance Cape",waist="Cimmerian Sash",legs="Beckoner's Spats", feet="Rubeus Feet"}
	
	-- Pet Macc/Skill
    sets.midcast.Pet.DebuffBloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo="Eminent Sachet",
		--neck="Adad Amulet",ear2="Enmerkar Earring",
        head="Tali'ah Turban +1", neck="Caller's Pendant", ear1="Andoaa Earring",
		--
        body="Tali'ah Manteel +1",hands="Tali'ah Gages +1",ring1="Evoker's Ring",ring2="Stikini Ring",
		--waist="Incarnation Sash",
        back=gear.magic_jse_back,waist="Cimmerian Sash", legs="Tali'ah Sera. +1",feet="Tali'ah Crackows +1"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan Strap",ammo="Eminent Sachet",
        -- neck="Shulmanu Collar", ear2="Lugalbanda Earring",
		head="Apogee Crown",ear1="Gelos Earring",
        -- body="Con. Doublet +3", ring1="Varar Ring",ring2="Varar Ring",
		body="Beckoner's Doublet",hands="Tali'ah Gages +1",
		-- waist="Incarnation Sash", legs="Apogee Slacks +1"  feet="Apogee Pumps +1"
        back=gear.phys_jse_back, waist="Cimmerian Sash", legs="Tali'ah Sera. +1", feet="Inyan. Crackows +2"}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {main="Gridarvor",sub="Elan Strap",ammo="Eminent Sachet",
		-- neck="Shulmanu Collar", ear2="Lugalbanda Earring",
        head="Apogee Crown", ear1="Gelos Earring",
        --body="Con. Doublet +3", ring1="Varar Ring",ring2="Varar Ring",
		body="Beckoner's Doublet", hands="Tali'ah Gages +1", 
		-- waist="Incarnation Sash",legs="Apogee Slacks +1", feet="Con. Pigaches +3"
        back=gear.phys_jse_back,waist="Cimmerian Sash",legs="Tali'ah Sera. +1", feet="Inyan. Crackows +2"}

    sets.midcast.Pet.MagicalBloodPactRage = {main="Eminent Pole",sub="Elan Strap",ammo="Eminent Sachet",
        -- neck="Adad Amulet", ear2="Lugalbanda Earring",
		head="Apogee Crown", ear1="Gelos Earring",
        --body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring",ring2="Varar Ring",
        body="Shomonjijoe +1", hands="Tali'ah Gages +1", 
		-- waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"
		back=gear.magic_jse_back, waist="Cimmerian Sash", legs="Tali'ah Sera. +1", feet="Inyan. Crackows +2"}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {}-- feet="Con. Pigaches +3"

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Flaming Crush'] = {main="Gridarvor",sub="Elan Strap",ammo="Eminent Sachet",
        -- neck="Adad Amulet", ear2="Lugalbanda Earring",
		head="Apogee Crown", ear1="Gelos Earring",
        --body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring",ring2="Varar Ring",
        body="Shomonjijoe +1", hands="Tali'ah Gages +1", 
		-- waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"
		back=gear.magic_jse_back, waist="Cimmerian Sash", legs="Tali'ah Sera. +1", feet="Tali'ah Crackows +1"}
	
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Con. Pigaches"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
		-- feet="Baayami Sabots"
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    -- Idle sets
    sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
		-- feet="Baayami Sabots"
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Hagondes Coat +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Dark Ring",
		--waist="Regal Belt",
        back="Moonbeam Cape",waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
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
    -- Glyphic Horn: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Con. Pigaches +1: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Gridarvor",sub="Vox Grip",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Evoker's Ring",ring2="Dark Ring",
        --waist="Lucidity Sash",
		back="Conveyance Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Con. Pigaches"}
		
    sets.idle.PDT.Avatar = {main="Mafic Cudgel", sub="Genbu's Shield",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
        -- waist="Regal Belt",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Con. Pigaches"}

    sets.idle.Spirit = {main="Gridarvor",sub="Vox Grip",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Evoker's Ring",ring2="Sheltered Ring",
        --waist="Lucidity Sash",
		back="Conveyance Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Con. Pigaches"}
		
    sets.idle.PDT.Spirit = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Shomonjijoe +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Inyanga Ring",
        --waist="Lucidity Sash",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {})--neck="Chrys. Torque"
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {head="Caller's Horn"}
    sets.idle.Avatar.Melee = {head="Caller's Horn"}
	
	sets.idle.Avatar.Melee.Carbuncle = {}
	sets.idle.Avatar.Melee['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Hagondes Coat +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Dark Ring",
		--waist="Regal Belt",
        back="Moonbeam Cape",waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Hagondes Coat +1",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Dark Ring",
		--waist="Regal Belt",
        back="Moonbeam Cape",waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Eminent Sachet",
        head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Defending Ring",ring2="Dark Ring",
		--waist="Regal Belt",
        back="Moonbeam Cape",waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
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
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Gridarvor",sub="Bloodrain Strap",ammo="Eminent Sachet",
		-- neck="Shulmanu Collar", ear1="Digni. Earring",ear2="Telos Earring",
        head="Tali'ah Turban +1",neck="Iqabi Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Tali'ah Manteel +1",hands="Tali'ah Gages +1",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        --waist="Olseni Belt",
		back=gear.phys_jse_back,waist="Windbuffet belt +1", legs="Assid. Pants +1",feet="Tali'ah Crackows +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 7)
end
