function user_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','PDT','PetTank','BothDD')
	state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('None','PetPDTAxe','DualWeapons','DualPetPDTAxe')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Knockback','Suppa','DWEarrings'}

	-- ACC 25 Snoworb  pet dbl leaf orb TP 200 Duskorb
	gear.PHYKumbha1 = {name="Kumbhakarna",  augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Pet: TP Bonus+180',}}
	-- ACC 25 TP 200 Snoworb  pet dbl leaf orb TP 200 Duskorb
	gear.PHYKumbha2 = {name="Kumbhakarna", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: TP Bonus+200',}}
	-- PETMAB TP 200 Snoworb  PDT leaforb -1~4% TP 200 Duskorb
	gear.PDTMABKumbha = {name="Kumbhakarna",  augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: Damage taken -3%','Pet: TP Bonus+200',}}
	-- pet MAB Snoworb tp bonus 200 Duskorb
	gear.MABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -2%','Pet: TP Bonus+180',}}

	-- Capes 
	-- DA
	gear.tp_jse_back = 			"Artio's Mantle" 
	-- DA
	gear.ws_jse_back = 			"Artio's Mantle" 
	-- Macc wsd
	gear.magic_ws_jse_back = 	"Artio's Mantle" 
	-- MND Macc meva FC
	gear.FC_jse_back = 			"Artio's Mantle" 
	-- Pet Accuracy Attack Haste
	gear.Pet_acc_jse_back =  	{name="Artio's Mantle",  augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
	-- Pet Macc Haste
	gear.Pet_macc_jse_back = 	{name="Artio's Mantle",   augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Accuracy+20 Attack+20','Pet: Mag. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
	-- Pet Tank Pet: Regen acc  pet dt
	gear.Pet_regen_jse_back =  	{name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	-- CHR Macc
	gear.Charm_jse_back =  	"Artio's Mantle" 
	
	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode', 'ScissorlegXerin','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar'}
	send_command('bind ^f7 gs c cycle JugMode')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','Tank','DD'}
	send_command('bind @f7 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind @f8 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')

	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'
	ready_moves.default.ScissorlegXerin = 'Tegmina Buffet'
	
	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
	sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm"} --head="Ankusa Helm +1"
	sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves +1"} -- body="Mirke Wardecors",
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
	sets.precast.JA.Tame = {head="Totemic Helm +1"}
	sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae"}
	sets.SpurAxe = {main="Skullrender"}
	sets.SpurAxesDW = {main="Skullrender",sub="Skullrender"}

	-- Macc
	sets.precast.JA['Feral Howl'] = {ammo="Pemphredo Tathlum",
		--head="Malignance Chapeau", neck="Bst. Collar +2", rear="Gwati Earring",
		head="Tali'ah Turban +2", neck="Sanctity Necklace", lear="Digni. Earring", rear="Enchntr. Earring +1",
		-- Ankusa Jackcoat Malignance Gloves
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Malignance Trousers  Malignance Boots
		back=gear.FC_jse_back, waist="Eschan Stone", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2"}
		
	-- MND Mod
	sets.precast.JA.Reward = {
		-- head="Stout Bonnet"  neck="Phalaina Locket", ear2="Domesticator's Earring",
		head="Meghanada Visor +2", ear1="Lifestorm Earring",
		-- Malignance Gloves
		body="Totemic Jackcoat +1", hands="Meg. Gloves +2", ring1="Stikini Ring", ring2="Stikini Ring",
		-- waist="Klouskap Sash", legs="Ankusa Trousers +3",
		back=gear.FC_jse_back, legs="Tot. Trousers +2", feet="Ankusa Gaiters"}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})

	-- Charm = CHR
	sets.precast.JA.Charm = {
		-- neck=Unmoving Collar +1", rear="Enchanter's Earring
		head="Totemic Helm +1", lear="Enchntr. Earring +1",
		-- Carb. Ring +1
		body="Ankusa Jackcoat", hands="Ankusa Gloves +1",
		back=gear.Charm_jse_back, waist="Chaac Belt", legs="Ankusa Trousers", feet="Ankusa Gaiters"}

	-- CURING WALTZ - CHR
	sets.precast.Waltz = {}

	-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

	-- STEPS
	sets.precast.Step = {}

	-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {ammo="Pemphredo Tathlum",
		--head="Malignance Chapeau", neck="Bst. Collar +2", rear="Gwati Earring",
		head="Tali'ah Turban +2", neck="Sanctity Necklace", lear="Digni. Earring", 
		-- Ankusa Jackcoat Malignance Gloves
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Malignance Trousers  Malignance Boots
		back=gear.magic_ws_jse_back, waist="Eschan Stone", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2"}
	sets.precast.Flourish1['Violent Flourish'] = {ammo="Pemphredo Tathlum",
		--head="Malignance Chapeau", neck="Bst. Collar +2", rear="Gwati Earring",
		head="Tali'ah Turban +2", neck="Sanctity Necklace", lear="Digni. Earring", 
		-- Ankusa Jackcoat Malignance Gloves
		body="Tali'ah Manteel +2", hands="Tali'ah Gages +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Malignance Trousers  Malignance Boots
		back=gear.magic_ws_jse_back, waist="Eschan Stone", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2"}

	sets.precast.FC = {ammo="Impatiens",
		head="Tali'ah Turban +2", neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		-- Sacro Breastplate
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

	-- MIDCAST SETS
	sets.midcast.FastRecast = {
		head="Tali'ah Turban +2",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Tempus Fugit",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Cure = {
		head="Tali'ah Turban +2",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Tempus Fugit",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	sets.midcast.Stoneskin = sets.midcast.FastRecast

	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

	sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

	-- WEAPONSKILLS
	-- Default weaponskill sets.
	sets.precast.WS = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

	sets.precast.WS.SomeAcc = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

	sets.precast.WS.Acc = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

	sets.precast.WS.FullAcc = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

	sets.precast.WS.Fodder = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}

	-- Specific weaponskill sets.
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {ammo="Focal Orb",
		-- Argosy Celeta +1
		head=gear.valorous_wsd_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
		-- Argosy Hauberk +1 Argosy Mufflers +1 Gere Ring
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		-- Argosy Breeches +1 Argosy Sollerets +1
		back=gear.ws_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"})
		
	sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Decimation'] = {ammo="Paeapua",
		-- Skormoth Mask
		head=gear.valorous_wsd_head, neck="Fotia Gorget", lear="Sherida Earring", rear="Brutal Earring",
		-- Gere Ring
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- feet="Argosy Sollerets +1"
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Lustra. Leggings +1"}
	
	sets.precast.WS['Rampage'] = {ammo="Ginsen",
		-- head="Heyoka Cap +1" neck="Bst. Collar +2",
		head=gear.valorous_wsd_head, neck="Fotia Gorget", lear="Moonshade Earring", rear="Sherida Earring",
		-- Gere Ring
		body="Meg. Cuirie +2", hands="Tali'ah Gages +2", lring="Regal Ring", rring="Begrudging Ring",
		-- legs="Heyoka Subligar +1", feet="Argosy Sollerets +1"
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet="Thereoid Greaves"}
		
	sets.precast.WS['Mistral Axe'] = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}
	
	sets.precast.WS['Calamity'] = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", rear="Thud Earring"
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Ankusa Jackcoat +3 Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- waist="Metalsinger Belt", legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}
	
	sets.precast.WS['Onslaught'] = {ammo="Ginsen", 
		-- Ankusa Helm +3 neck="Bst. Collar +2", Thud Earring 
		head="Lustratio Cap +1", neck="Sanctity Necklace", lear="Cessance Earring", rear="Ishvara Earring",
		-- Totemic Gloves +3
		body="Tali'ah Manteel +2", hands="Meg. Gloves +2", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- legs="Ankusa Trousers +3" feet="Ankusa Gaiters +3"
		back=gear.ws_jse_back, waist="Grunfeld Rope", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1"}
		
	sets.precast.WS['Onslaught'].SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS['Onslaught'].Acc = set_combine(sets.precast.SomeAcc, {})
	sets.precast.WS['Onslaught'].FullAcc = set_combine(sets.precast.Acc, {})
	sets.precast.WS['Onslaught'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Primal Rend'] = {ammo="Pemphredo Tathlum",
		-- Ankusa Helm +3 Bst. Collar +2
		head="Jumalik Helm",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Sherida Earring",
		-- Sacro Breastplate 
		body="Jumalik Mail",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Epaminondas's Ring",
		back=gear.magic_ws_jse_back,waist="Fotia Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {mmo="Pemphredo Tathlum",
		head=gear.valorous_wsd_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Tali'ah Manteel +2",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Epaminondas's Ring",
		back=gear.magic_ws_jse_back,waist="Fotia Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {main=gear.PHYKumbha1,sub=gear.PHYKumbha2,
		--  head="Emicho Coronet +1", neck="Beast Collar +2", ear2="Domesticator's Earring", ammo="Voluspa Tathlum",
		head="Nuk. Cabasset +1", neck="Shulmanu Collar", ear1="Enmerkar Earring", ear2="Kyrene's Earring",
		-- rring="C. Palug Ring"
		body="Tali'ah Manteel +2",hands="Nukumi Manoplas +1",ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.Pet_acc_jse_back,waist="Incarnation Sash",legs="Tot. Trousers +2",feet="Tot. Gaiters +2"}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {})
				
	sets.midcast.Pet.MagicReady = {main=gear.MABKumbha,sub=gear.PDTMABKumbha,ammo="Demonry Core",
		-- head="Emicho Coronet +1" Bst. Collar +2 ear1="Domesticator's Earring",
		--head=gear.valorous_pet_head,
		head="Tali'ah Turban +2", neck="Adad Amulet", ear1="Enmerkar Earring", ear2="Kyrene's Earring",
		body="Emicho Haubert +1",hands="Nukumi Manoplas +1", ring1="Tali'ah Ring",ring2="Varar Ring +1",
		-- legs=gear.valorous_magical_pet_legs,feet=gear.valorous_magical_pet_feet
		back=gear.Pet_macc_jse_back,waist="Incarnation Sash",legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2"}

	sets.midcast.Pet.ReadyRecast = {}-- legs="Desultor Tassets"
	sets.midcast.Pet.ReadyRecastDW = {} -- legs="Desultor Tassets"
	sets.midcast.Pet.Neutral = {head="Totemic Helm +1"}
	sets.midcast.Pet.Favorable = {head="Nuk. Cabasset +1"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1"}

	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	-- RESTING
	sets.resting = {}

	sets.idle = {main="Izizoeksi",sub=gear.PDTMABKumbha, ammo="Staunch Tathlum",
		-- Bathy Collar +1 Infused Earring Dawn Earring
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Merman's Earring",
		-- Sacro Breastplate Paguroidea Ring
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.FC_jse_back, waist="Flume Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.idle.Refresh = set_combine(sets.idle, {head="Jumalik Helm", body="Jumalik Mail",}) -- Ogier's Gauntlets, Stearc Subligar, Ogier's Leggings
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	-- Pet Out No one engaged
	sets.idle.Pet = {main="Izizoeksi",sub=gear.PDTMABKumbha,ammo="Demonry Core",
		-- head="Anwig Salade",
		head="Meghanada Visor +2", neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tot. Jackcoat +1",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Pet_regen_jse_back,waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Ankusa Gaiters"}

	-- Pet Engaged Only - Path C
	sets.idle.Pet.Engaged = {-- main="Skullrender",sub="Skullrender", Ammo="Voluspa Tathlum",
		-- neck="Beast Collar +2", ear2="Domesticator Earring", 
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		-- body="An. Jackcoat +3", hands="Emicho Gauntlets +1" Path C
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Varar Ring +1",ring2="Varar Ring +1",
		-- legs="Ankusa Trousers +3", feet Valorous Greaves Pet DA Fern stone
		back=gear.Pet_acc_jse_back,waist="Incarnation Sash",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	-- DEFENSE SETS
	sets.defense.PDT = {ammo="Staunch Tathlum",
		-- head="Genmei Kabuto",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		-- Sacro Breastplate Malignance Gloves Paguroidea Ring
		body="Tartarus Platemail",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- legs="Malignance Tights"
		back=gear.FC_jse_back, waist="Flume Belt",legs="Meg. Chausses +2", feet="Amm Greaves"}

	sets.defense.PetPDT = {--ammo="Demonry Core",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Pet_regen_jse_back,waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.defense.PetMDT = {ammo="Demonry Core",
		head="Tali'ah Turban +2",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Pet_regen_jse_back,waist="Isa Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +1"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm", body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Tali'ah Turban +2",neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tartarus Platemail",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Pet_regen_jse_back,waist="Flume Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.defense.MEVA = {
		head="Tali'ah Turban +2",neck="Warder's Charm +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.Pet_regen_jse_back,waist="Flume Belt",legs="Tali'ah Sera. +2",feet="Tali'ah Crackows +2"}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +1"})

	sets.Kiting = {}--feet="Skadi's Jambeaux"
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {main="Kerehcatl", ammo="Ginsen",
		-- Malignance Chapeau
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves  Gere Ring
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.SomeAcc = {main="Kerehcatl", ammo="Ginsen",
		-- Malignance Chapeau
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves  Gere Ring
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	sets.engaged.Acc = {main="Kerehcatl", ammo="Ginsen",
		-- Malignance Chapeau
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves  Gere Ring
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.FullAcc = {main="Kerehcatl", ammo="Ginsen",
		-- Malignance Chapeau
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves  Gere Ring
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.Fodder = {main="Kerehcatl", ammo="Ginsen",
		-- Malignance Chapeau
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves  Gere Ring
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = {ammo="Staunch Tathlum",
		-- Malignance Chapeau lear="Ebani Earring",
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum",
		-- Malignance Chapeau lear="Ebani Earring",
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
		-- Malignance Chapeau lear="Ebani Earring",
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
		-- Malignance Chapeau lear="Ebani Earring",
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		-- Malignance Chapeau lear="Ebani Earring",
		head="Meghanada Visor +2",neck="Anu Torque",ear1="Dedition Earring",ear2="Sherida Earring",
		-- Malignance Gloves 
		body="Tali'ah Manteel +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Moonbeam Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {ammo="Ginsen",
		-- Malignance Chapeau  lear="Ebani Earring", rear="Sherida Earring",
		head="Gavialis Helm", neck="Anu Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- Malignance Gloves Gere Ring
		body="Taliah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.DW.SomeAcc = {ammo="Ginsen",
		-- Malignance Chapeau  lear="Ebani Earring", rear="Sherida Earring",
		head="Gavialis Helm", neck="Anu Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- Malignance Gloves Gere Ring
		body="Taliah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.DW.Acc = {ammo="Ginsen",
		-- Malignance Chapeau  lear="Ebani Earring", rear="Sherida Earring",
		head="Gavialis Helm", neck="Anu Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- Malignance Gloves Gere Ring
		body="Taliah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.DW.FullAcc = {ammo="Ginsen",
		-- Malignance Chapeau  lear="Ebani Earring", rear="Sherida Earring",
		head="Gavialis Helm", neck="Anu Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- Malignance Gloves Gere Ring
		body="Taliah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.engaged.DW.Fodder = {ammo="Ginsen",
		-- Malignance Chapeau  lear="Ebani Earring", rear="Sherida Earring",
		head="Gavialis Helm", neck="Anu Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		-- Malignance Gloves Gere Ring
		body="Taliah Manteel +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		-- Malignance Tights Malignance Boots
		back=gear.tp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {ear1="Dudgeon Earring",ear2="Heartseeker Earring",})
	sets.engaged.DW.SomeAcc.PDT = set_combine(sets.engaged.SomeAcc.PDT, {ear1="Dudgeon Earring",ear2="Heartseeker Earring",})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc.PDT, {ear1="Dudgeon Earring",ear2="Heartseeker Earring",})
	sets.engaged.DW.FullAcc.PDT = set_combine(sets.engaged.FullAcc.PDT, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{})
	sets.engaged.BothDD.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.BothDD.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.BothDD.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{})
	sets.engaged.PetTank.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.PetTank.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.PetTank.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.BothDD.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.BothDD.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.BothDD.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.PetTank.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.PetTank.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.PetTank.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt",hands="Volte Bracers"})
	sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	
	-- Weapons sets
	sets.weapons.PetPDTAxe = {main="Izizoeksi", sub="Kaidate"}
	sets.weapons.DualWeapons = {main=gear.PHYKumbha1,sub=gear.PHYKumbha2}
	sets.weapons.DualPetPDTAxe = {main="Izizoeksi",sub=gear.PDTMABKumbha}
	sets.weapons.Fodder = {main="Hunahpu",sub="Hatxiik"}

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 14)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 14)
	elseif player.sub_job == 'THF' then
		set_macro_page(3, 14)
	elseif player.sub_job == 'RUN' then
		set_macro_page(4, 14)
	else
		set_macro_page(1, 14)
	end
end