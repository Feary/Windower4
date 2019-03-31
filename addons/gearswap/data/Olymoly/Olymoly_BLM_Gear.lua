function user_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal','Resistant','Fodder','Proc','OccultAcumen')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'TPEat','DTHippo')
	state.Weapons:options('None','NukeWeapons','Malevolence') --'Khatvanga'

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_low_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	
	-- Staves 
	-- gear.grioavolr_nuke_staff 
	gear.nuke_staff = {"Lathi"}
	gear.grioavolr_Death_staff = {"Lathi"}
	
	-- Capes 
	gear.nuke_jse_back	= {name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back 	= {name="Taranus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	--gear.stp_jse_back
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') 
	send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode;gs c reset DeathMode;gs c reset MagicBurstMode')
	send_command('bind !r gs c set DeathMode Single;gs c set MagicBurstMode Single')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir III" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.NukeWeapons = {main="Lathi",sub="Enki Strap"}
	--sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Malevolence = {main="Malevolence",} --sub="Ammurapi Shield"
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=gear.nuke_jse_back,feet="Wicce Sabots +1"}

    sets.precast.JA.Manafont = {body="Arch. Coat +1"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells
    sets.precast.FC = {main="Oranyan",
		-- main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Amalric Coif +1", neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		-- body="Zendik Robe", hands="Volte Gloves"
		body="Anhur Robe", hands=gear_helios_hands_FC, ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Amalric Nails +1"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {waist="Siegel Sash"})

	-- Switching out quick magic gear
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {head="Wicce Petasos +1", ear1="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"}) --main="Serenity",sub="Clerisy Strap +1",

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Death = {main=gear.grioavolr_Death_staff, 
		--  sub="Niobid Strap",ammo="Psilomene",
		head="Amalric Coif +1", neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
		-- body="Zendik Robe", hands="Volte Gloves",ring1="Mephitas's Ring +1", rring2="Rahab Ring",
		body="Merlinic Jubbah", hands=gear_helios_hands_FC, ring1="Kishar Ring",ring2="Prolix Ring",
        -- waist="Channeler's Stone", legs="Psycloth Lappas", Path D 
		back=gear.FC_jse_back, waist="Witful Belt",legs="Lengo Pants", feet="Amalric Nails +1"}
		
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		--ammo="Dosis Tathlum",
		head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {
		--ammo="Dosis Tathlum",
		--head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		--body="Zendik Robe",hands="Hagondes Cuffs +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		--back=gear.nuke_jse_back,waist="Fotia Belt",legs="Hagondes Pants +1",feet=gear.merlinic_nuke_feet
		}

    sets.precast.WS['Myrkr'] = {
		--ammo="Staunch Tathlum",
		--head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		--body="Amalric Doublet",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		--back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"
		}
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {main="Oranyan",
		--sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		--body="Zendik Robe",hands="Volte Gloves",
		body="Merlinic Jubbah", hands=gear_helios_hands_FC, ring1="Kishar Ring",ring2="Prolix Ring",
		--legs="Psycloth Lappas", Path D
		back=gear.FC_jse_back,waist="Witful Belt",legs="Lengo Pants",feet="Amalric Nails +1"}

    sets.midcast.Cure = {main="Tamaxchi", sub="Sors Shield",ammo="Hasty Pinion +1",
		--main=gear.gada_healing_club,
		-- neck="Incanter's Torque",
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Zendik Robe",
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Gyve Trousers",feet="Medium's Sabots"}
		
    sets.midcast.LightWeatherCure = {main="Tamaxchi", sub="Sors Shield",ammo="Hasty Pinion +1",
		--main=gear.gada_healing_club,
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Zendik Robe",
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back=gear.FC_jse_back,waist="Hachirin-no-Obi",legs="Gyve Trousers",feet="Medium's Sabots"}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Tamaxchi", sub="Sors Shield",ammo="Hasty Pinion +1",
		--main=gear.gada_healing_club,
		-- neck="Incanter's Torque",
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Zendik Robe",
		body="Heka's Kalasiris", hands=gear_telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back=gear.FC_jse_back,waist="Hachirin-no-Obi",legs="Gyve Trousers",feet="Medium's Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Haoma's Ring"
		})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		--main="Marin Staff +1",sub="Clemency Grip"
		})

	sets.midcast['Enhancing Magic'] = {
		-- main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- neck="Incanter's Torque"
		ammo="Hasty Pinion +1",
		head=gear_telchine_head_Duration, neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear_telchine_body_Duration,hands=gear_telchine_hands_Duration,ring1="Stikini Ring","Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs=gear_telchine_legs_Duration,feet=gear_telchine_feet_Duration}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
			--neck="Nodens Gorget",ear2="Earthcry Earring", legs="Shedir Seraweels"
			waist="Siegel Sash",})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--head="Amalric Coif +1"
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		--main="Vadose Rod",sub="Genbu's Shield",
		--head="Amalric Coif +1",hands="Regal Cuffs",
		--waist="Emphatikos Rope",legs="Shedir Seraweels"
		})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"

    sets.midcast['Enfeebling Magic'] = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Regal Earring",
        -- body="Spaekona Coat +3", hands="Regal Cuffs"
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- Psycloth Lappas
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Medium's Sabots"}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Regal Earring",
        -- body="Spaekona Coat +3", hands="Regal Cuffs"
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Jhakri Pigaches +2"}		
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
		main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Regal Earring",
        -- body="Spaekona Coat +3",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- feet="Spaekona Sabots +2"
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Jhakri Pigaches +2"})
		
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Regal Earring",
        -- body="Spaekona Coat +3",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		-- feet="Spaekona Sabots +2"
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Jhakri Pigaches +2"})
	
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1", ear1="Barkaro. Earring"})--waist="Acuity Belt +1"}
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear1="Barkaro. Earring",})--waist="Acuity Belt +1"

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
		--sub="Ammurapi Shield",
		main="Rubicundity",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1", ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2", feet="Jhakri Pigaches +2"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1", neck="Incanter's Torque",ear1="Barkaro. Earring",ear2="Regal Earring",
		--ring1="Evanescence Ring",
		body="Amalric Doublet +1",hands="Amalric Gages +1", ring1="Stikini Ring", ring2="Archon Ring",	
		-- feet=gear.merlinic_aspir_feet
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2", feet="Jhakri Pigaches +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main="Lathi", sub="Elder's Grip +1", ammo="Pemphredo Tathlum",
		-- main=gear.grioavolr_nuke_staff, Psilomene		
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Barkaro. Earring",ear2="Regal Earring",
		--ring1="Evanescence Ring", ring2="Mephitas Ring +1"
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Stikini Ring", ring2="Stikini Ring", 
		--  feet=gear.merlinic_aspir_feet
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Amalric Slops +1", feet="Amalric nails +1"}
	
	-- Death
	sets.midcast.Death = {main="Lathi", sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- gear.grioavolr_nuke_staff, Psilomene
		-- Niobid Strap
		-- Static Earring
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear1="Barkaro. Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Mujin Band",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.midcast.Stun = {main="Oranyan",sub="Enki Strap",ammo="Hasty Pinion +1",
		-- Spae. Petasos +3 Barkaro
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
        --body="Spaekona's Coat +3", hands="Spae. Gloves +3",
		body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Stikini Ring",ring2="Stikini Ring",
		-- Spae. Tonbon +3 Spae. Sabots +3
        back=gear.nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2", feet="Amalric nails +1"}
		
    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Hasty Pinion +1",
		-- Spae. Petasos +3
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
        --body="Spaekona's Coat +3", hands="Spae. Gloves +3",
		body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Stikini Ring",ring2="Stikini Ring",
		-- Spae. Tonbon +3 Spae. Sabots +3
        back=gear.nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2", feet="Amalric nails +1"}
		
    sets.midcast.BardSong = {--sub="Clerisy Strap +1",
		main="Oranyan", sub="Enki Strap", ammo="Pemphredo Tathlum",
        head="Amalric Coif +1", neck="Sanctity Necklace", ear1="Digni. Earring",ear2="Regal Earring",
		--body="Zendik Robe",hands="Regal Cuffs",
		body="Merlinic Jubbah", hands="Jhakri Cuffs +2", ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.nuke_jse_back, waist="Luminary Sash", legs="Lengo Pants", feet="Medium's Sabots"}
		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Regal Earring",
		-- hands="Regal Cuffs"
		body="Twilight Cloak",hands="Jhakri Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    -- Elemental Magic sets    
	-- Low Tier
    sets.midcast['Elemental Magic'] = {main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
    	-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}

	-- High Tier 
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
         head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].Resistant.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
		-- Niobid Strap
		-- Arch. Petasos +3 neck="Saevus Pendant", 
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
        -- Arch. Coat +3 Arch. Gloves +3
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		-- Eschan Stone Arch. Tonbon +3 Arch. Sabots +3
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Amalric Coif +1",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Regal Earring",
        --body="Spaekona's Coat +3",
		body="Spaekona's Coat +1", hands=gear_helios_hands_FC, ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Assid. Pants +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
		--main="Khatvanga",sub="Bloodrain Strap", ammo="Seraphic Ampulla",
		--neck="Combatant's Torque",
        head="Amalric Coif +1", ear1="Dedition Earring", ear2="Telos Earring",
        --body=gear_helios_body_occult, 
		body="Mallquis Saio +2", hands=gear_helios_hands_Occult, ring1="Rajas Ring", ring2="Petrov Ring",
		-- waist="Oneiros Rope",legs="Perdition Slops",
        back=gear.stp_jse_back, feet=gear_helios_feet_occult}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
		--sub="Oneiros Grip", neck="Chrys. Torque", ear2="Sanare Earring",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring", ear2="Etiolation Earring",
		-- body="Vrikodara Jupon", hands=gear.merlinic_refresh_hands Stikini Ring +1 Stikini Ring +1
		Body="Jhakri Robe +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Refoccilation Stone", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, legs="Assid. Pants +1", feet="Mallquis Clogs +2"}
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main={name="Lathi",priority=2}, sub={name="Enki Strap", priority=1}, ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Jhakri Robe +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Flax Sash", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Earth Staff", sub={name="Enki Strap", priority=1}, ammo="Staunch Tathlum",
		--sub="Oneiros Grip",
        head="Jhakri Coronal +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
        Body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
        --waist="Flax Sash",
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {}) --feet="Hippo. Socks +1"

	-- Death
	sets.idle.Death = {main="Lathi", sub="Elder's Grip +1", ammo="Staunch Tathlum",
		--main=gear.grioavolr_nuke_staff,sub="Elder's Grip +1",ammo="Psilomene",
		head="Amalric Coif +1",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Etiolation Earring",
		-- ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		back="Bane Cape", waist="Fucho-no-obi", legs="Amalric Slops +1", feet="Amalric Nails +1"}

    sets.idle.Weak = {main="Lathi",sub="Enki Strap",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Jhakri Robe +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Flax Sash", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

    -- Defense sets
    sets.defense.PDT = {main="Earth Staff",ammo="Staunch Tathlum",
		--sub="Umbra Strap",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Flax Sash", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

    sets.defense.MDT = {main="Earth Staff",ammo="Staunch Tathlum",
		--sub="Umbra Strap",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Flax Sash", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
    sets.defense.MEVA = {main="Earth Staff",ammo="Staunch Tathlum",
		--sub="Umbra Strap",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Mallquis Saio +2", hands="Amalric Gages +1", ring1="Dark Ring",ring2="Defending Ring",
		-- waist="Flax Sash", feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back, waist="Fucho-no-obi", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}--feet=gear.merlinic_refresh_feet
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {}
		--head="Pixie Hairpin +1",ear1="Genbu's Earring",ear2="Evans Earring",
		--body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		--back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"
	sets.HPCure = {}
		--main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
		--head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		--body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Meridian Ring",
		--back="Tempered Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {back=gear.FC_jse_back,feet="Wicce Sabots +1"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat +1"}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", ring1="Mujin Band",feet="Jhakri Pigaches +2"} --legs="Ea Slops", head="Ea Hat",body="Ea Houppelande",hands="Amalric Gages +1",
	sets.ResistantMagicBurst = {neck="Mizu. Kubikazari", ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat",body="Ea Houppelande",hands="Amalric Gages +1", legs="Ea Slops",
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Spaekona's Coat +1",ring1="Mujin Band",feet="Jhakri Pigaches +2"} --head="Ea Hat",  legs="Ea Slops", hands="Amalric Gages +1",
	sets.ResistantRecoverBurst = {hands="Amalric Gages +1",body="Spaekona's Coat +1",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat",neck="Mizu. Kubikazari",body="Spaekona's Coat +3"body="Spaekona's Coat +3",legs="Ea Slops",
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Lathi",
		--neck="Combatant's Torque",
        head="Jhakri Coronal +2",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",
		--back=gear.stp_jse_back,waist="Olseni Belt"
		legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",} --waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",}--waist="Gishdubar Sash"
	sets.Self_Refresh = {back="Grapevine Cape",}--waist="Gishdubar Sash",feet="Inspirited Boots"
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end