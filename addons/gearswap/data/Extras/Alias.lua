-- Global Alias

send_command('alias geodes exec geodes.txt')

-- Fast Follow 
send_command('alias fol ffo me')
send_command('alias ufol ffo stopall')

-- Crafting Gear
send_command('alias crafting exec '..player.name..'/gear_craft.txt')
send_command('alias uncrafting exec '..player.name..'/ungear_craft.txt')

-- Gearing from Slips
send_command('alias getslip exec '..player.name..'/get_slips.txt')
send_command('alias putslip exec '..player.name..'/put_slips.txt') 

-- Get and Pull Gear Per Job
send_command('alias gear exec '..player.name..'/gear'..player.main_job..'.txt')
send_command('alias ungear gs equip naked;exec '..player.name..'/ungear'..player.main_job..'.txt')

-- PortPacker
send_command('alias store po store '..player.main_job)
send_command('alias unstore po unpack '..player.main_job)