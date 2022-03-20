--Place you can overwrite specific functions and settings with your preferences.
--Extra user functions to change how gearswap functions across jobs.

--Time Related Settings
--To determine your offset the first time, uncomment time_offset and set time_test to true,
--Once you see delay numbers start spamming your chat, (Must be outside of town.)
--(Also you can't have Commitment or Dedication Buffs) then Equip to ring1 and use "Capacity Ring",
--(Not a Trizek or Calibur ring, "specifically Capacity Ring") your time_offset should appear in chat.
--Set time_offset to the number mentioned in your chat and reload.
--If the number spammed in your chat matches up with the seconds remaining on
--your Capacity Ring's recast, your time_offset is correct, set time_test to false and reload.

--time_offset = 0
--time_test = false
--framerate = 75
--latency = .75

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Display related settings.
state.DisplayMode = M(true, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the values to edit the display's look.
displayx = 480
displayy = 750
--displayfont = 'Arial'
--displaysize = 12
--displaybold = true
--displaybg = 0
--displaystroke = 2
--displaytransparancy = 192
--state.DisplayColors = {
    -- h='\\cs(255, 0, 0)', -- Red for active booleans and non-default modals
    -- w='\\cs(255,255,255)', -- White for labels and default modals
    -- n='\\cs(192,192,192)', -- White for labels and default modals
    -- s='\\cs(96,96,96)' -- Gray for inactive booleans
--}

--Options for automation.
state.ReEquip 			= M(true, 'ReEquip Mode') --Set this to false if you don't want it to reequip sets.Weapons when you aren't wearing any weapons.
state.AutoArts 			= M(true, 'AutoArts') --Set this to false if you don't want it to automatically try to keep up Solace/Arts.
state.CancelStoneskin	= M(true, 'Cancel Stone Skin') --Set this to false if you don't want it to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 	= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	 	= M(true, 'Notify Buffs')  --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)


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

send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c toggle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Allows automatic weaponskilling if the job is setup to handle it.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
send_command('bind ^- gs c toggle selectnpctargets') --Change targets automatically.
send_command('bind ^= gs c cycle pctargetmode') --Change targets automatically.
send_command('bind ~r gs c weapons Default') --Requips weapons and gear.
send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
--send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind !t input /target <bt>') --Targets the battle target.
--send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind @p gs equip sets.Sheltered') --Equip sheltered ring, for when being Pro/Shelled.
send_command('bind !p gs equip sets.Cure_Received') --Equip Cure Potency Received set for when being cured.
send_command('bind @m gs c mount Raptor')
send_command('bind !@^m sa gs c mount Raptor')
send_command('alias ambuseal input /item "Abdhaljs Seal" <me>')
send_command('alias rads temps buy Radialens')
send_command('alias molli temps buy Mollifier')

--Place to override Tables and other definitions you may want to.

bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

NotifyBuffs = S{'doom','petrification'}