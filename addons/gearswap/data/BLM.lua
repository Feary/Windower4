-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end

function job_setup()

	state.Buff['Mana Wall'] = buffactive['Mana Wall'] or false
	state.Buff['Manafont'] = buffactive['Manafont'] or false
	state.Buff['Manawell'] = buffactive['Manawell'] or false

    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}
		
    AutoManawellSpells = S{'Impact'}
	AutoManawellOccultSpells = S{'Impact','Meteor','Thundaja','Blizzaja','Firaja','Thunder VI','Blizzard VI',}

	state.DeathMode 	  = M{['description'] = 'Death Mode', 'Off', 'Single', 'Lock'}
	state.AutoManawell = M(true, 'Auto Manawell Mode')
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	autows = 'Vidohunir'
	autofood = 'Pear Crepe'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoManawell","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoBuffMode",},{"Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)

end

function job_pretarget(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.AutoManawell.value and (AutoManawellSpells:contains(spell.english) or (state.CastingMode.value == 'OccultAcumen' and AutoManawellOccultSpells:contains(spell.english) and actual_cost(spell) > player.mp)) then
			local abil_recasts = windower.ffxi.get_ability_recasts()

			if abil_recasts[35] < latency and not buffactive['amnesia'] then
				cancel_spell()
				send_command('@input /ja "Manawell" <me>;wait 1;input /ma '..spell.english..' '..spell.target.raw..'')
				return
			end
		end
	end
end

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			gear.default.obi_back = gear.obi_cure_back
			gear.default.obi_waist = gear.obi_cure_waist
		elseif (spell.english == 'Death' or spell.english == 'Comet') or (spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble') then
			if LowTierNukes:contains(spell.english) then
				gear.default.obi_back = gear.obi_low_nuke_back
				gear.default.obi_waist = gear.obi_low_nuke_waist
			else
				gear.default.obi_back = gear.obi_high_nuke_back
				gear.default.obi_waist = gear.obi_high_nuke_waist
			end
		end
		
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end
        if state.DeathMode.value ~= 'Off' then
            classes.CustomClass = 'Death'
        end
	end
end

function job_post_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' and state.DeathMode.value ~= 'Off' then
		equip(sets.precast.FC.Death)
	end
	
	if state.Buff['Mana Wall'] and (state.IdleMode.value:contains('DT') or state.DefenseMode.value ~= 'None') then
		equip(sets.buff['Mana Wall'])
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if state.DeathMode.value ~= 'Off' and spell.english ~= 'Death' then
			if sets.midcast[spell.english] and sets.midcast[spell.english].Death then
				equip(sets.midcast[spell.english].Death)
			elseif sets.midcast[spellMap] and sets.midcast[spellMap].Death then
				equip(sets.midcast[spellMap].Death)
			elseif sets.midcast[spell.skill] and sets.midcast[spell.skill].Death then
				equip(sets.midcast[spell.skill].Death)
			else
				equip(sets.precast.FC.Death)
			end

		elseif is_nuke(spell, spellMap) and spell.english ~= 'Impact' then
			if state.MagicBurstMode.value ~= 'Off' then
				if state.CastingMode.value:contains('Resistant') and sets.ResistantMagicBurst then
					equip(sets.ResistantMagicBurst)
				else
					equip(sets.MagicBurst)
				end
			end

			if player.hpp < 75 and player.tp < 1000 and state.CastingMode.value == 'Fodder' then
				if item_available("Sorcerer's Ring") then
					sets.SorcRing = {ring1="Sorcerer's Ring"}
					equip(sets.SorcRing)
				end
			end
			
			if spell.element == world.weather_element or spell.element == world.day_element then
				if state.CastingMode.value == 'Fodder' then
					-- if item_available('Twilight Cape') and not LowTierNukes:contains(spell.english) and not state.Capacity.value then
						-- sets.TwilightCape = {back="Twilight Cape"}
						-- equip(sets.TwilightCape)
					-- end
					if spell.element == world.day_element then
						if item_available('Zodiac Ring') then
							sets.ZodiacRing = {ring2="Zodiac Ring"}
							equip(sets.ZodiacRing)
						end
					end
				end
			end
			
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			
			if state.RecoverMode.value ~= 'Never' and not (state.Buff['Manafont'] or state.Buff['Manawell']) and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
				if state.MagicBurstMode.value ~= 'Off' then
					if state.CastingMode.value:contains('Resistant') and sets.ResistantRecoverBurst then
						equip(sets.ResistantRecoverBurst)
					elseif sets.RecoverBurst then
						equip(sets.RecoverBurst)
					end
				elseif sets.RecoverMP then
					equip(sets.RecoverMP)
				end
			end
		end
		
		if state.Buff['Mana Wall'] and (state.IdleMode.value:contains('DT') or state.DefenseMode.value ~= 'None') then
			equip(sets.buff['Mana Wall'])
		end
	end
end

function job_aftercast(spell, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		elseif spell.english == "Death" and state.DeathMode.value == 'Single' then
			state.DeathMode:reset()
			if state.DisplayMode.value then update_job_states()	end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)

	if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
		if world.weather_element == 'Light' then
                return 'LightWeatherCure'
		elseif world.day_element == 'Light' then
                return 'LightDayCure'
        end

    elseif spell.skill == 'Elemental Magic' then
		if default_spell_map == 'ElementalEnfeeble' or spell.english:contains('helix') then
			return
        elseif LowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
	
	elseif spell.skill == "Enfeebling Magic" then
		if spell.english:startswith('Dia') then
			return "Dia"
		elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
			return 'MndEnfeebles'
		else
			return 'IntEnfeebles'
		end
    end
	
end

-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value == 'Sphere') and state.DefenseMode.value == 'None' then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	
	if state.DeathMode.value ~= 'Off' then
        idleSet = set_combine(idleSet, sets.idle.Death)
    end
	
    if state.Buff['Mana Wall'] then
		idleSet = set_combine(idleSet, sets.buff['Mana Wall'])
    end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)

    if state.Buff['Mana Wall'] then
		meleeSet = set_combine(meleeSet, sets.buff['Mana Wall'])
    end

    return meleeSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_self_command(commandArgs, eventArgs)
		if commandArgs[1]:lower() == 'elemental' then
			handle_elemental(commandArgs)
			eventArgs.handled = true			
		end
end

function job_tick()
	if player.sub_job == 'SCH' and check_arts() then return true end
	return false
end

function check_arts()
	if state.AutoArts.value and not moving and not areas.Cities:contains(world.area) and not arts_active() and player.in_combat then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] < latency then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = (framerate * .5)
			return true
		end

	end
	
	return false
end

-- Handling Elemental spells within Gearswap.
-- Format: gs c elemental <nuke, helix, skillchain1, skillchain2, weather>
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local command = cmdParams[2]:lower()

    if command == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Light' then
			if spell_recasts[29] < spell_latency and actual_cost(get_spell_table_by_name('Banish II')) < player.mp then
				windower.chat.input('/ma "Banish II" <t>')
			elseif spell_recasts[28] < spell_latency and actual_cost(get_spell_table_by_name('Banish')) < player.mp then
				windower.chat.input('/ma "Banish" <t>')
			else
				add_to_chat(123,'Abort: Banishes on cooldown or not enough MP.')
			end

		elseif state.ElementalMode.value == 'Dark' then
			if spell_recasts[219] < spell_latency and actual_cost(get_spell_table_by_name('Comet')) < player.mp then
				windower.chat.input('/ma "Comet" <t>')
			else
				add_to_chat(123,'Abort: Comet on cooldown or not enough MP.')
			end

		else
			if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 and spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' VI').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..' VI')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..' VI" <t>')
			else
				local tiers = {' V',' IV',' III',' II',''}
				for k in ipairs(tiers) do
					if spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
						windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..''..tiers[k]..'" <t>')
						return
					end
				end
				add_to_chat(123,'Abort: All '..elements.nuke[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
			end
		end
			
	elseif command == 'ninjutsu' then
		windower.chat.input('/ma "'..elements.ninnuke[state.ElementalMode.value]..': Ni" <t>')
			
	elseif command == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
	
		local tiers = {' II',''}
		for k in ipairs(tiers) do
			if spell_recasts[get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nuke[state.ElementalMode.value]..''..tiers[k]..'')) < player.mp then
				windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..''..tiers[k]..'" <t>')
				return
			end
		end
		add_to_chat(123,'Abort: All '..elements.nuke[state.ElementalMode.value]..' nukes on cooldown or or not enough MP.')
		
	elseif command:contains('tier') then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierlist = {['tier1']='',['tier2']=' II',['tier3']=' III',['tier4']=' IV',['tier5']=' V',['tier6']=' VI'}
		
		windower.chat.input('/ma "'..elements.nuke[state.ElementalMode.value]..tierlist[command]..'" <t>')
		
	elseif command:contains('aga') or command == 'aja' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local tierkey = {'aja','aga3','aga2','aga1'}
		local tierlist = {['aja']='ja',['aga3']='ga III',['aga2']='ga II',['aga1']='ga',}
		if command == 'aga' then
			for i in ipairs(tierkey) do
				if spell_recasts[get_spell_table_by_name(elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'').id] < spell_latency and actual_cost(get_spell_table_by_name(elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'')) < player.mp then
					windower.chat.input('/ma "'..elements.nukega[state.ElementalMode.value]..''..tierlist[tierkey[i]]..'" <t>')
					return
				end
			end
		else
			windower.chat.input('/ma "'..elements.nukega[state.ElementalMode.value]..tierlist[command]..'" <t>')
		end

	elseif command == 'ara' then
		windower.chat.input('/ma "'..elements.nukera[state.ElementalMode.value]..'ra" <t>')
		
	elseif command == 'helix' then
		windower.chat.input('/ma "'..elements.helix[state.ElementalMode.value]..'helix" <t>')
	
	elseif command == 'ancientmagic' then
		windower.chat.input('/ma "'..elements.ancient[state.ElementalMode.value]..'" <t>')
		
	elseif command == 'ancientmagic2' then
		windower.chat.input('/ma "'..elements.ancient[state.ElementalMode.value]..' II" <t>')
		
	elseif command == 'enfeeble' then
		windower.chat.input('/ma "'..elements.enfeeble[state.ElementalMode.value]..'" <t>')
	
	elseif command == 'bardsong' then
		windower.chat.input('/ma "'..elements.threnody[state.ElementalMode.value]..' Threnody" <t>')
		
	elseif command == 'spikes' then
		windower.chat.input('/ma "'..elements.spikes[state.ElementalMode.value]..' Spikes" <me>')
		
	elseif command == 'enspell' then
			windower.chat.input('/ma "En'..elements.enspell[state.ElementalMode.value]..'" <me>')
	
	--Leave out target, let shortcuts auto-determine it.
	elseif command == 'weather' then
		if player.sub_job == 'RDM' then
			windower.chat.input('/ma "Phalanx" <me>')
		else
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if (player.target.type == 'SELF' or not player.target.in_party) and buffactive[elements.storm_of[state.ElementalMode.value]] and not buffactive['Klimaform'] and spell_recasts[287] < spell_latency then
				windower.chat.input('/ma "Klimaform" <me>')
			else
				windower.chat.input('/ma "'..elements.storm_of[state.ElementalMode.value]..'"')
			end
		end
		
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end