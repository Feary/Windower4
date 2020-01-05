require 'tables'
require 'sets'
res = require 'resources'
packets = require('packets')

_addon.version = '2.00'
_addon.name = 'AutoMB'
_addon.author = 'Havion'
_addon.commands = {'amb','automb'}

settings = T{}

language = 'english'
auto = 'on'

casting = false
castingoutsidemb = false
skillchaindetected = false
targetid = 0

-- Statuses that stop you from casting.
statusblock = T{'Dead','Event','Charmed'}

-- Nuking jobs
nuking_main_jobs = T{'BLM','RDM','SCH','GEO','DRK'}
nuking_sub_jobs = T{'BLM'}

-- Aliases for tellback mode.
on = T{'on', 'yes', 'true'}
off = T{'off', 'no', 'false'}

-- Skillchains that result in damage to the target
skillchains = T{[768]='Umbra',[767]='Radiance',[288]='Light',[289]='Darkness',[290]='Gravitation',[291]='Fragmentation',[292]='Distortion',[293]='Fusion',[294]='Compression',[295]='Liquefaction',[296]='Induration',[297]='Reverberation',[298]='Transfixion',[299]='Scission',[300]='Detonation',[301]='Impaction',[302]='Cosmic Elucidation'}
skillchain_element = T{['Umbra']='Ice',['Radiance']='Lightning',['Light']='Lightning',['Darkness']='Ice',['Gravitation']='Earth',['Fragmentation']='Lightning',['Distortion']='Ice',['Fusion']='Fire',['Compression']='Dark',['Liquefaction']='Fire',['Induration']='Ice',['Reverberation']='Water',['Transfixion']='Light',['Scission']='Earth',['Detonation']='Wind',['Impaction']='Lightning',['Cosmic Elucidation']='Lightning'}

windower.register_event('action',function (act)
	player = windower.ffxi.get_player()
	
	if statusblock:contains(player['status_id']) or (auto == 'off') then return end
	if not nuking_main_jobs:contains(player.main_job) and not nuking_sub_jobs:contains(player.sub_job) then return end
	
	magicBurst(act)
end)

windower.register_event('addon command',function (command, ...)
	local args = T{...}
	
    -- Turns status on or off
	if command == 'auto' then
		local status = args[1]
		status = status:lower()
		if on:contains(status) then
			auto = 'on'
			windower.add_to_chat(4,'AutoMB turned on.')
		elseif off:contains(status) then
			auto = 'off'
			windower.add_to_chat(4,'AutoMB turned off.')
		else
			error('Invalid status:', args[1])
			return
		end
	end
end)

function magicBurst(act)
	-- category 3 is Finish weaponskill, category 4 is Finish spell casting, category 11 is Finish TP move (npcs)
	if T{3,4,11,13}:contains(act.category) and act.target_count > 0 then
		local actor = windower.ffxi.get_mob_by_id(act.actor_id)
		if not checkInParty(actor) then return end
		
		if player == act.actor_id then
			--casting outside
			if act.category == 8 and not skillchaindetected then
				castingoutsidemb = true
			end
			
			--finished casting outside
			if act.category == 4 then
				castingoutsidemb = false
				
				--i finished casting
				if skillchaindetected then
					casting = false
					windower.add_to_chat(4, 'mb casting finished')
				end
			end
		end
		
		if act.targets[1].actions ~= nil then
			local action = act.targets[1].actions[1]
			if action.has_add_effect then
				local msgId = action.add_effect_message
				--windower.add_to_chat(4, 'Category: '..act.category..' | Msg ID: '..msgId)
				
				--skillchain detected
				if skillchains[msgId] then
					windower.add_to_chat(4, 'skillchain detected')
					skillchain = skillchains[msgId]
					spellcount = 0
					targetid = act.targets[1].id
					skillchaindetected = true
				end
				
			end
		end
	end
end

function castSpell(skillchain, targetid)
	if not player.target or (not player.target.id == targetid) then
		packets.inject(packets.new('incoming', 0x058, {
			['Player'] = player.id,
			['Target'] = targetid,
			['Player Index'] = player.index,
		}))
		coroutine.sleep(.6)
	end

	windower.send_command('gs c set elementalmode '..skillchain_element[skillchain]..';gs c elemental nuke')
end

function checkInParty(target)
	if target.in_party or target.in_alliance then
		return true
	else
		if target.is_npc then
			return checkPetInParty(target)
		end
	end
end

function checkPetInParty(target)
	local petIndex = target.index
	local party = windower.ffxi.get_party()
	for i=0,5 do
		if party['p'..i] then
			if party['p'..i].mob then
				if party['p'..i].mob.pet_index == petIndex then
					return true
				end
			end
		end
	end
	for i=10,15 do
		if party['a'..i] then
			if party['a'..i].mob then
				if party['a'..i].mob.pet_index == petIndex then
					return true
				end
			end
		end
	end
	for i=20,25 do
		if party['a'..i] then
			if party['a'..i].mob then
				if party['a'..i].mob.pet_index == petIndex then
					return true
				end
			end
		end
	end
	
	return false
end

function mainthread()
	while true do
		if skillchaindetected then
			if castingoutsidemb then
				windower.add_to_chat(4, 'casting when skillchain detected, waiting')
				while castingoutsidemb do
					coroutine.sleep(.1)
				end
			else
				windower.send_command('gs c set magicburstmode single')
				windower.add_to_chat(4, 'casting spell')
				castSpell(skillchain, targetid)
				casting = true
				skillchaindetected = false
			end
		end

		coroutine.sleep(.1)
	end
end

co = coroutine.create(mainthread())
coroutine.start(co,0)