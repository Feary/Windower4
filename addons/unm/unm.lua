_addon.name = 'UNMv2'
_addon.author = 'Darkdoom'
_addon.version = '2.0'
_addon.command = 'unm'
_addon.commands = {'start', 'stop', 'help'}
_addon.language = 'english'


require('logger')
require('coroutine')
packets = require('packets')
res = require('resources')

running = false
target = windower.ffxi.get_mob_by_target('t')

mobs = S{"Prickly Pitriv","Bounding Belinda","Hugemaw Harold","Ironhorn Baldurno","Sleepy Mabel","Serpopard Ninlil","Abyssdiver","Immanibugard","Intuila",
	"Jester Malatrix","Orcfeltrap","Sybaritic Samantha","Valkurm Imperator","Cactrot Veloz","Emperor Arthro","Garbage Gel","Joyous Green","Keeper of Heiligtum",
	"Tiyanak","Voso","Warblade Beak","Woodland Mender","Arke","Ayapec","Azure-toothed Clawberry","Bakunawa","Beist","Centurio XX-I","Coca","Douma Weapon",
	"King Uropygid","Kubool Ja's Mhuufya","Largantua","Lumber Jill","Mephitas","Muut","Specter Worm","Strix","Vermillion Fishfly","Azrael","Borealis Shadow",
	"Camahueto","Carousing Celine","Grand Grenade","Vedrfolnir","Vidmapire","Volatile Cluster","Glazemane","Wyvernhunter Bambrox","Hidhaegg","Sovereign Behemoth",
"Tolba","Thu'ban","Sarama","Shedu","Tumult Curator"}


-- Watch log for capped sparks/out of accolades
function check_incoming_text(original)
	local org = original:lower()
	
	if org:find('sparks of eminence, and now possess a total of 99999') ~= nil then
		running = false
	elseif org:find('one or more party/alliance members do not have the required 200 unity accolades to join the fray') ~= nil then
		running = false
		end
end



function check()
  if running == true then
    
     	windower.send_command('setkey escape down')
        coroutine.sleep(0.5)
        windower.send_command('setkey escape up')
        coroutine.sleep(0.5)		
		
	 
		if windower.ffxi.get_mob_by_target('t') == nil or windower.ffxi.get_mob_by_target('t').name == nil then
		coroutine.sleep(24)
		junction()
		elseif mobs:contains(windower.ffxi.get_mob_by_target('t').name) then
			windower.add_to_chat(167, 'Target still alive, sleeping')
			coroutine.sleep(30)
			check()
		elseif windower.ffxi.get_mob_by_target('t') ~= 'Ethereal Junction' then
		 windower.add_to_chat(167, 'That aint no junction')
		 coroutine.sleep(5)
		 check()
end

end

end

function junction()
    if running == true then
    
    
    local Junct = windower.ffxi.get_mob_by_name('Ethereal Junction')
    
    
      if Junct then
        local target = windower.ffxi.get_mob_by_target('t')
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = Junct.id,
            ['Target Index'] = Junct.index,
        })
  
  packets.inject(p)
  

  coroutine.sleep(1)
 
  windower.add_to_chat(167, 'starting menu')
	windower.send_command('setkey up down')
	coroutine.sleep(0.5)
	windower.send_command('setkey up up')
	coroutine.sleep(0.5)
		
	windower.send_command('setkey enter down')
	coroutine.sleep(0.5)
	windower.send_command('setkey enter up')
	coroutine.sleep(0.5)
	
	windower.send_command('setkey up down')
	coroutine.sleep(0.5)
	windower.send_command('setkey up up')
	coroutine.sleep(0.5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(0.5)
	windower.send_command('setkey enter up')
	coroutine.sleep(0.5)
  windower.add_to_chat(167, 'Incoming!')
  
  coroutine.sleep(10)
	check()
          end
  
        end
  
    end
  
    
  
  function unm_command(...)
	if #arg > 3 then
		windower.add_to_chat(167, 'Invalid command. //unm help for valid options.')
	elseif #arg == 1 and arg[1]:lower() == 'start' then
		if running == false then
			running = true
			windower.add_to_chat(200, 'UNM - START')
			junction()
		else
			windower.add_to_chat(200, 'UNM is already running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'stop' then
		if running == true then
			running = false
			windower.add_to_chat(200, 'UNM - STOP')
		else
			windower.add_to_chat(200, 'UNM is not running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'help' then
		windower.add_to_chat(200, 'Available Options:')
		windower.add_to_chat(200, '  //unm start - turns on UNM and starts trying to spawn')
		windower.add_to_chat(200, '  //unm stop - turns off UNM')
	
		windower.add_to_chat(200, '  //unm help - displays this text')
	end
end


windower.register_event('addon command', unm_command)
windower.register_event('incoming text', function(new, old)
	local info = windower.ffxi.get_info()
	if not info.logged_in then
		return
	else
		check_incoming_text(new)
	end
end)

while(running == true) 
do
  check()
  end
