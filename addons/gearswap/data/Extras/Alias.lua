-- Global Alias
send_command('alias geodes exec geodes.txt')

-- Crafting Related
send_command('alias crafting exec  '..player.name..'/gear_craft.txt')
send_command('alias ucrafting exec  '..player.name..'/ungear_craft.txt')
send_command('alias crest exec craft/reset.txt')

-- Fast Follow 
send_command('alias fol ffo me')
send_command('alias ufol ffo stopall')

-- Send all Target
-- everyone do action
send_command('alias sas send @all')
-- everyone target
send_command('alias sa sat alltarget')
-- everyone 
send_command('alias saa sat allattack')
send_command('alias ass sat alltarget;wait 1;sat allcommand assault')

-- Gearing from Slips
send_command('alias getslip exec '..player.name..'/get_slips.txt')
send_command('alias putslip exec '..player.name..'/put_slips.txt') 
send_command('alias getslips exec '..player.name..'/get_slips.txt')
send_command('alias putslips exec '..player.name..'/put_slips.txt') 

-- Get and Pull Gear Per Job
send_command('alias gear exec '..player.name..'/gear'..player.main_job..'.txt')
send_command('alias ungear gs equip naked;exec '..player.name..'/ungear'..player.main_job..'.txt')

-- PortPacker
send_command('alias store naked;wait 1;po store '..player.main_job)
send_command('alias unstore po unpack '..player.main_job)

-- Naked
send_command('alias naked gs equip naked')

--send_command('alias ageo exec aniyah/geo.txt')
--send_command('alias tank input /ja "Pianissimo" <me>;wait 2;input /ma "Foe Sirvante" <p1>')


-- Binds
-- Follow
send_command('bind pageup ffo me')
send_command('bind pagedown ffo stopall')

send_command('bind numpad+ sat alltarget')
send_command('bind !numpad+ sat allattack')
send_command('bind ^numpad+ sat allattack')
send_command('bind @numpad+ sat allattack')
--send_command('bind numpadEnter sat allattack')