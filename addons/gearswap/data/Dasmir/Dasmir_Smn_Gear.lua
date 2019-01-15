-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat')

	-- Avatar Ammo - Sancus Sachet +1
	gear.avatar_ammo = {name="Idaraaja"}
	-- Staves
	gear.perp_staff = {name="Gridarvor"}
	gear.skill_staff = {name="Espiritus"}

	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
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
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {main=gear.skill_staff,sub="Vox Grip",ammo="Esper Stone +1",
		--neck="Incanter's Torque",
        head=gear_telchine_head_Siphon, neck="Caller's Pendant", ear1="Andoaa Earring",ear2="Gifted Earring",
        --hands="Baayami Cuffs",
		body=gear_telchine_body_Siphon, hands="Glyphic Bracers +1", ring1="Evoker's Ring",ring2="Stikini Ring",
        --waist="Kobo Obi",
		back="Conveyance Cape",waist="Cimmerian Sash", legs=gear_telchine_legs_Siphon, feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beckoner's Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo=gear.avatar_ammo,
		-- neck="Incanter's Torque", 
		head="Beckoner's Horn +1", neck="Caller's Pendant", ear1="Andoaa Earring", ear2="Evans Earring",
        -- hands="Baayami Cuffs",
		body="Con. Doublet +3", hands="Con. Bracers +1", ring1="Evoker's Ring", ring2="Stikini Ring",
        -- back="Conyeyance Cape", waist="Kobo Obi", legs="Baayami Slops", feet="Baayami Sabots"
		back="Astute Cape", waist="Cimmerian Sash", legs="Glyphic Spats +1", feet="Glyphic Pigaches +1"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells    
    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		-- ear2="Enchntr. Earring +1",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Loquac. Earring",
		body="Inyanga Jubbah +2",hands=gear_helios_hands_FC, ring1="Kishar Ring", ring2="Lebeche Ring",
		--back="Perimede Cape",
		back=gear.FC_jse_back, waist="Witful Belt",legs="Orvail Pants +1",feet="Regal Pumps"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- MP
    sets.precast.WS['Myrkr'] = {ammo=gear.avatar_ammo,
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        body="Con. Doublet +3",hands="Helios Gloves",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back="Conveyance Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Beck. Pigaches +1"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",
		--ear2="Enchntr. Earring +1",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Loquac. Earring",
		body="Inyanga Jubbah +2",hands=gear_helios_hands_FC,ring1="Kishar Ring", ring2="Lebeche Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Orvail Pants +1",feet="Regal Pumps"}
	
    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
		-- ear1="Mendicant's Earring",
        head="Vanya Hood",neck="Incanter's Torque",ear2="Gifted Earring",
        body="Vrikodara Jupon",hands=gear_telchine_hands_Cure,ring1="Janniston Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1",waist="Austerity Belt +1",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.Self_Healing = {}--neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {}--neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {head="Amalric Coif",}--back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",
		--ring1="Haoma's Ring",ring2="Haoma's Ring", 
		back="Tempered Cape +1", waist="Witful Belt"})
			
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Oranyan",sub="Clemency Grip"

	sets.midcast['Elemental Magic'] = {
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}
	sets.midcast['Elemental Magic'].Resistant = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}


    sets.midcast['Divine Magic'] = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

		
    sets.midcast['Dark Magic'] = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

	
	sets.midcast.Drain = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

		
    sets.midcast.Stun.Resistant = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

		
	sets.midcast['Enfeebling Magic'] = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

		
	sets.midcast['Enfeebling Magic'].Resistant = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring", rring="Shiva Ring",
		back=gear.FC_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +2"}

		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		--rear="Augment. Earring",
		head=gear_telchine_head_Duration, neck="Colossus's Torque", lear="Andoaa Earring", 
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--back="Merciful Cape", waist="Olympus Sash", 
		legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif", feet="Inspirited Boots"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",})--main="Vadose Rod",sub="Genmei Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})--neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    -- Avatar pact sets.  All pacts are Ability type.
    -- Skill - Goal 670
    sets.midcast.Pet.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo=gear.avatar_ammo,
		-- neck="Incanter's Torque",
        head="Beckoner's Horn +1", neck="Caller's Pendant", ear1="Andoaa Earring",ear2="Gifted Earring",
        -- hands="Baayami Cuffs",
		body="Beck. Doublet +1", hands="Glyphic Bracers +1", ring1="Evoker's Ring",ring2="Stikini Ring",
		-- waist="Kobo Obi", legs="Baayami Slops",feet="Baayami Sabots"
        back="Conveyance Cape", waist="Cimmerian Sash", legs="Beck. Spats +1", }
	
	-- Macc
    sets.midcast.Pet.DebuffBloodPactWard = {main="Espiritus",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Tali'ah Turban +1", neck="Adad Amulet", ear1="Andoaa Earring",ear2="Enmerkar Earring",
        body="Con. Doublet +3", hands="Tali'ah Gages +1", ring1="Evoker's Ring",ring2="Stikini Ring",
		back=gear.magic_jse_back, waist="Incarnation Sash", legs="Tali'ah Sera. +1",feet="Tali'ah Crackows +1"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
	-- 
	-- Blood Pact Rage	
	-- 
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor", sub="Elan Strap +1", ammo=gear.avatar_ammo,
		head=gear_helios_head_BP, neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_physpact_hands, ring1="Varar Ring +1", ring2="Varar Ring +1",
        --legs="Apogee Slacks +1", Path D feet=gear.phys_BP_feet
		back=gear.phys_jse_back, waist="Incarnation Sash", feet="Convo. Pigaches +3"}
		
	 -- Used for all physical pacts when AccMode is true	
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage,{
		feet="Convo. Pigaches +3"})

	sets.midcast.Pet.PhysicalBloodPactRage.AM = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {
		head="Apogee Crown +1"})
		
    sets.midcast.Pet.MagicalBloodPactRage = {main="Espiritus", sub="Elan Strap +1", ammo=gear.avatar_ammo,
		--main=gear.grioavolr_pet_staff,
		--head="Apogee Crown +1" neck="Summoner's Collar +2",
        neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1", ring2="Varar Ring +1",
        --waist="Regal Belt", legs="Enticer's Pants", feet=gear.phys_BP_feet
		back=gear.magic_jse_back, feet="Convo. Pigaches +3"}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

	sets.midcast.Pet['Flaming Crush'] = {main="Espiritus", sub="Elan Strap +1", ammo=gear.avatar_ammo,
		--main=gear.grioavolr_pet_staff,
		-- head="Apogee Crown +1",
		neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		-- waist="Regal Belt", legs="Apogee Slacks +1", Path D
        back=gear.phys_jse_back, feet=gear.magic_BP_feet}
		
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}

	 -- Physical pacts which benefit more from TP than Pet:DA (like single-hit BP)
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})-- legs="Enticer's Pants"
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {}) -- legs="Enticer's Pants"
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {}) -- legs="Enticer's Pants"

	 -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Gylphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Gylphic Spats +1"})

    sets.midcast.Pet['Elemental Magic'].Resistant = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Gylphic Spats +1"})
    
	--------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff", ammo="Staunch Tathlum",
        head="Beckoner's Horn +1", neck="Loricate Torque +1", ear1="Ethereal Earring", ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
        body="Shomonjijoe +1", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1", feet="Baayami Sabots"}
    
    -- Idle sets
    sets.idle = {main="Bolelabunga", sub="Genbu's Shield", ammo="Staunch Tathlum",
        head="Beckoner's Horn +1", neck="Loricate Torque +1", ear1="Ethereal Earring", ear2="Etiolation Earring",
        --hands=gear.merlinic_refresh_hands
		body="Shomonjijoe +1", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		--waist="Regal Belt", feet="Baayami Sabots"
        back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1", feet="Convo. Pigaches +3"}

    sets.idle.PDT = {main="Earth Staff", 
		--main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        -- body="Udug Jacket",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Dark Ring", ring2="Defending Ring",
        --waist="Regal Belt",
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	sets.idle.MDT = {main="Earth Staff", ammo="Staunch Tathlum",
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        -- body="Udug Jacket",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Dark Ring", ring2="Defending Ring",
        --waist="Regal Belt",
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

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
    -- Convo. Pigaches +3: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main=gear.perp_staff,ammo=gear.avatar_ammo,
		-- Nirvana Oneiros Grip 
		-- Con. Horn +3
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Evans Earring",
		--hands=gear.merlinic_refresh_hands,
        body="Beck. Doublet +1",ring1="Evoker's Ring",ring2="Defending Ring",
        back="Conveyance Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Avatar = {main="Gridarvor",ammo=gear.avatar_ammo,
		-- Nirvana Oneiros Grip 
		-- Con. Horn +3 
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Rimeice Earring",ear2="Evans Earring",
		-- hands=gear.merlinic_refresh_hands,
        body="Shomonjijoe +1", hands="Inyan. Dastanas +2", ring1="Evoker's Ring",ring2="Defending Ring",
        back="Umbra Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {main="Gridarvor",sub="Oneiros Grip",ammo=gear.avatar_ammo,
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- hands=gear.merlinic_refresh_hands,
        body="Shomonjijoe +1", hands="Inyan. Dastanas +2", ring1="Evoker's Ring",ring2="Inyanga Ring",
        back="Conveyance Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {main="Terra's Staff",sub="Oneiros Grip",ammo=gear.avatar_ammo,
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Evans Earring",
		-- hands=gear.merlinic_refresh_hands,
        body="Shomonjijoe +1", hands="Inyan. Dastanas +2", ring1="Dark Ring",ring2="Defending Ring",
        back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {})--neck="Chrys. Torque"
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {head="Beckoner's Horn +1"}
    sets.idle.Avatar.Engaged = {head="Beckoner's Horn +1"}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}-- hands="Asteria Mitts"
	sets.idle.Avatar.Engaged['Cait Sith'] = {}--hands="Lamassu Mitts"
        
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
    sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo=gear.avatar_ammo,
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body="Vrikodara Jupon",hands="Hagondes Cuffs +1", ring1="Dark Ring",ring2="Defending Ring",
        back="Umbra Cape",waist="Regal Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Terra's Staff",sub="Umbra Strap",ammo=gear.avatar_ammo,
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Lugalbanda Earring",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Dark Ring",ring2="Defending Ring",
        back="Umbra Cape",waist="Regal Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    sets.defense.MEVA = {main="Terra's Staff",sub="Enki Strap",ammo=gear.avatar_ammo,
        head="Amalric Coif",neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Lugalbanda Earring",
		body="Inyanga Jubbah +2",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Aurist's Cape +1",waist="Luminary Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--neck="Sacrifice Torque"
	
	sets.weapons = {main="Gridarvor", sub="Elan Strap +1"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Gridarvor",sub="Bloodrain Strap",ammo=gear.avatar_ammo,
		-- ear1="Digni. Earring", ear2="Telos Earring",
        head="Tali'ah Turban +1",neck="Shulmanu Collar", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- hands="Convo. Bracers +3"
        body="Con. Doublet +3", hands="Tali'ah Gages +1",ring1="Rajas Ring",ring2="Ramuh Ring",
		-- legs="Convo. Spats +3", feet="Convo. Pigaches +3"
        back=gear.phys_jse_back,waist="Olseni Belt",legs="Tali'ah Sera. +1",feet="Convo. Pigaches +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 7)
end
