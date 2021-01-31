function user_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
	state.OffenseMode:options('None', 'Normal')
	state.IdleMode:options('Normal', 'PDT', 'TPEat','DTHippo')
	state.Weapons:options('None','NukeWeapons','MeleeStaff','MeleeClubs','Death')
	
	--Jse Capes
	gear.fastcast_jse_back = {name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	gear.Nuke_jse_back = {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.cure_jse_back = {name="Taranus's Cape", augments={'MP+30','Mag. Acc+16 /Mag. Dmg.+16','"Fast Cast"+9',}}
	gear.TP_jse_back = {name="Taranus's Cape", augments={'MP+30','Mag. Acc+16 /Mag. Dmg.+16','"Fast Cast"+9',}}
	gear.WS_jse_back = {name="Taranus's Cape", augments={'MP+30','Mag. Acc+16 /Mag. Dmg.+16','"Fast Cast"+9',}}
	
	gear.obi_cure_waist = "Witful Belt"
	gear.obi_low_nuke_waist = "Austerity Belt"
	gear.obi_high_nuke_waist = "Austerity Belt"

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir II" <t>')
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
	
	sets.weapons.NukeWeapons = {main="Kaja Rod",sub="Ammurapi Shield"}
	sets.weapons.MeleeStaff = {main="Kaja Rod",sub="Ammurapi Shield"}
	sets.weapons.MeleeClubs =  {main="Kaja Rod",sub="Ammurapi Shield"}
	sets.weapons.Death = {main="Kaja Rod",sub="Ammurapi Shield"}
	
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape",feet="Wicce Sabots +1"}

    sets.precast.JA.Manafont = {body="Arch. Coat"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", -- ammo="Impatiens",
		head="Amalric Coif", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", eear2="Loquacious Earring",
		--body="Zendik Robe",
		body="Vanir Cotehardie", hands="Helios Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		-- legs="Psycloth Lappas",
		back=gear.fastcast_jse_back,waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ammo="Staunch Tathlum",ring2="Prolix Ring",waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Staunch Tathlum",ring2="Prolix Ring"}) --ear1="Barkaro. Earring"

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {sub="Clerisy Strap +1", legs="Doyen Pants"}) -- main="Serenity", body="Heka's Kalasiris", 

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Death = {}
		
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {}

    sets.precast.WS['Myrkr'] = {}
    
    ---- Midcast Sets ----
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", eear2="Loquacious Earring",
		--body="Zendik Robe",
		body="Acad. Gown +2", hands="Helios Gloves", ring1="Kishar Ring",ring2="Lebeche Ring",
		-- legs="Psycloth Lappas",
		back=gear.fastcast_jse_back,waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails"}

    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        --head="Vanya Hood",
		head="Haruspex Hat", neck="Voltsurge Torque",ear1="Regal Earring",ear2="Novia Earring",
        body="Witching Robe",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
		-- legs="Psycloth Lappas",
        back=gear.Cure_jse_back,waist="Luminary Sash", legs="Lengo Pants", feet="Medium's Sabots"}
		
    sets.midcast.LightWeatherCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        --head="Vanya Hood",
		head="Haruspex Hat", neck="Voltsurge Torque",ear1="Regal Earring",ear2="Novia Earring",
        body="Witching Robe",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
		-- legs="Psycloth Lappas",
        back=gear.Cure_jse_back,waist="Hachirin-no-Obi", legs="Lengo Pants", feet="Medium's Sabots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        --head="Vanya Hood",
		head="Haruspex Hat", neck="Voltsurge Torque",ear1="Regal Earring",ear2="Novia Earring",
        body="Witching Robe",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Sirona's Ring",
		-- legs="Psycloth Lappas",
        back=gear.Cure_jse_back, waist="Hachirin-no-Obi", legs="Lengo Pants", feet="Medium's Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head=gear.telchine_head_Duration,neck="Colossus's Torque",ear1="Andoaa Earring",ear2="Augment. Earring",
		body=gear.telchine_body_Duration,hands=gear.telchine_hands_Duration,ring1="Stikini Ring","Stikini Ring",
		back=gear.fastcast_jse_back,waist="Olympus Sash",legs=gear.telchine_legs_Siphon,feet=gear.telchine_feet_Duration}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.midcast['Enfeebling Magic'] = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Befouled Crown",neck="Erra Pendant",ear2="Regal Earring",
        body="Vanya Robe",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.cure_jse_back,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Befouled Crown",neck="Erra Pendant",ear2="Regal Earring",
        body="Vanya Robe",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.cure_jse_back,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Nuke_jse_back})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring", 
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
	
	sets.midcast.Death = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Stun = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
         -- head="Spae. Petasos +3", ear1="Barkaro. Earring",
		head="Mallquis Chapeau +2",neck="Erra Pendant", ear2="Regal Earring",
		-- body="Spae. Coat +3", hands="Spae. Gloves +3",
		body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        -- legs="Spae. Tonban +3", feet="Spae. Sabots +3"
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.Stun.Resistant = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        -- head="Spae. Petasos +3", ear1="Barkaro. Earring",
		head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
		-- body="Spae. Coat +3", hands="Spae. Gloves +3",
		body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        -- legs="Spae. Tonban +3", feet="Spae. Sabots +3"
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.BardSong = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
	sets.midcast.Impact = {main="Kaja Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head=empty,neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring",
        body="Twilight Cloak",hands="Mallquis Cuffs +2",ring1="Stikini Ring", ring2="Stikini Ring",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    -- Elemental Magic sets    
    sets.midcast['Elemental Magic'] = {main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast['Elemental Magic'].Resistant = {main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Lathi",sub="Kaja Grip",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Jhakri Ring",ring2="Freke Ring",
        back=gear.Nuke_jse_back,waist=gear.ElementalObi,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Kaja Grip", ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.fastcast_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main=gear.grioavolr_refresh_staff ,sub="Kaja Grip",--ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.fastcast_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet="Wicce Sabots +1"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Mallquis Saio +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.fastcast_jse_back,waist="Austerity Belt",legs="Assid. Pants +1",feet="Wicce Sabots +1"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})--feet="Hippo. Socks +1"

	sets.idle.Death = {main=gear.grioavolr_nuke_staff,sub="Kaja Grip",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Wicce Sabots +1"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2=gear.DarkRing,
		back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Wicce Sabots +1"}

    -- Defense sets
    sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Defending Ring", ring2=gear.DarkRing,
        back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.defense.MDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Defending Ring", ring2=gear.DarkRing,
        back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Warder's Charm +1",ear1="Lugalbanda Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Defending Ring", ring2=gear.DarkRing,
        back=gear.fastcast_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {} -- feet=gear.merlinic_refresh_feet
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	-- HP- Gear
	sets.HPDown = {head="Pixie Hairpin +1", ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		feet="Jhakri Pigaches +2"}
		
	-- HP+ Gear
	sets.HPCure = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {back="Taranus's Cape",feet="Wicce Sabots +1"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat"} -- body="Spaekona's Coat +3"
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",hands="Amalric Gages",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat",body="Ea Houppelande", legs="Ea Slops"
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Spaekona's Coat",hands="Amalric Gages",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat", 
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1"}--,ring2="Archon Ring"

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Staunch Tathlum",
        head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Zennaroi Earring", -- ear2="Telos Earring",	
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Petrov Ring",ring2="Ramuh Ring",
		back=gear.TP_jse_back,waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Self_Refresh = {feet="Inspirited Boots"}-- back="Grapevine Cape",waist="Gishdubar Sash",
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end

function user_job_precast(spell, spellMap, eventArgs)
	if spell.english == "Impact" then
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[35] == 0 and not buffactive['amnesia'] then
			cancel_spell()
			send_command('@input /ja "Manawell" <me>;wait 1;input /ma Impact '..spell.target.raw..'')
			return
		end
	end
end