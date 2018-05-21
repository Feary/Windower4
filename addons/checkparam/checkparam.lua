_addon.name = 'checkparam'
_addon.author = 'C'
_addon.version = '1.0'
_addon.command = 'cp'
_addon.language = 'japanese'
local res = require('resources')	--file:..\..\res
local extdata = require('extdata')

--[[NOTE:
1.create folder and into windower/addon/checkparam/checkparam.lua
2."lua load checkparam" to load.
3.counts ONLY from your gears. exclude vorseals, job traits, jobpoints-gifts, and race.
4.beta-version addon.if you find any troubles, report me :) ]]

--[[  3-step-setup :
--1/JP.ラベル:複数の表現を統一。
"は不要。日本語可(同じ意味のラベルと揃えること) 例:
label['Magic Accuracy'] = '魔命'
label['Mag. Acc.'] = '魔命'

--1/EN.Merge notation fluctuation/e.g.
label['MagicAccuracy']='MagicAccuracy'
label['Mag.Acc.']='MagicAccuracy'
label['Mag.Acc']='MagicAccuracy'
]]
label = {}
label['MagicAccuracy']='MagicAccuracy'
label['Mag.Acc.']='MagicAccuracy'
label['Mag.Acc']='MagicAccuracy'
label['Mag.Atk.Bns.']='MagicAtk.Bonus'
label['MagicAtk.Bonus']='MagicAtk.Bonus'
label['Magicburstdmg.']='Magicburstdamage'
label['Magicburstdamage']='Magicburstdamage'
label['MagicDamage']='MagicDamage'
label['Mag.Dmg']='MagicDamage'
label['Mag.Dmg.']='MagicDamage'
label['TripleAttack']='TripleAttack'
label['TripleAtk.']='TripleAttack'
label['DoubleAttack']='DoubleAttack'
label['Dbl.Atk.']='DoubleAttack'
label['QuadrupleAttack']='QuadrupleAttack'
label['QuadAttack']='QuadrupleAttack'
label['StoreTP']='StoreTP'
label['Zanshin']='Zanshin'
label['Physicaldamagetaken']='Physicaldamagetaken'
label['Phys.dmg.taken']='Physicaldamagetaken'
label['Magicdamagetaken']='Magicdamagetaken'
label['Mag.dmg.taken']='Magicdamagetaken'
label['Damagetaken']='DamageTaken'
label['Pet:Accuracy']='Pet:Accuracy'
label['Pet:Acc.']='Pet:Accuracy'
label['Pet:Attack']='Pet:Attack'
label['Pet:Atk.']='Pet:Attack'
label['Pet:BloodPactdamage']='Pet:BloodPactdamage'
label['Pet:BloodPactDmg.']='Pet:BloodPactdamage'
label['BloodPactabilitydelay']='BloodPactabilitydelay'
label['BloodPactabilitydelay']='BloodPactabilitydelay'
label['BloodPactrecasttime']='BloodPactabilitydelay'
label['BloodPactabilitydelayII']='BloodPactabilitydelayII'
label['BloodPactabi.del.II']='BloodPactabilitydelayII'
label['BloodPactrecasttimeII']='BloodPactabilitydelayII'
label['Mag.Eva']='MagicEvasion'
label['Mag.Evasion']='MagicEvasion'
--[[2/JP.'性能アップ'装備対応:
'素破の耳'の二刀流+など数値化されていない装備を記述。日本語可。

--2/EN.Define"Enhances..effect" gears/e.g.
G['Suppanomimi'] = 'MND+2 Magic Def. Bonus+2 Magic burst damage+5'
file:..\..\res\item_descriptions.lua ]]
G = {}
G['電界の耳'] = 'MND+2 Magic Def. Bonus+2 Magic burst damage+5'
G['素破の耳'] = 'AGI+2 Dual Wield+5 Sword skill+5'
G['オルンミラトルク'] = 'MP+30 Magic Accuracy+1 Fast Cast+5 Enmity-3'
G['ロケイシャスピアス'] = 'MP+30 Fast Cast+2'
G['ＳＰサボ+3'] = 'DEF:83 HP+41 MP+43 STR+20 DEX+21 VIT+20 AGI+43 INT+32 MND+29 CHR+44 Magic Accuracy+54 Magic Damage+40 Evasion+75 Magic Evasion+127 \"Magic Atk. Bonus\"+26 \"Magic Def. Bonus\"+6 Haste+3% Magic burst damage+10 Elemental magic casting time-6'
G['胡蝶のイヤリング'] = ''
G['インカントストーン'] = 'MP+10 Fast Cast+2'
G['プロリクスリング'] = 'MP+30 Fast Cast+2 Enmity-3'
--[[3/JP.ジョブ:表示するステータスをジョブごとに設定。
英語表記か1.のラベルを設定。例:
table.BLM = {'INT', '魔命'}

--3/EN.Define job and property you want diGlay./e.g.
table.BLM = {'INT', 'MagicAccuracy'}
]]
table.BLM = {'INT','MagicAccuracy','MagicAtk.Bonus','Magicburstdamage','MagicburstdamageII','MagicDamage','FastCast','Elementalmagiccastingtime','Haste','Damagetaken','Physicaldamagetaken','OccultAcumen'}
table.BLU = {'DEX','StoreTP','DualWield','QuadrupleAttack','TripleAttack','DoubleAttack','MagicEvasion','FastCast','Haste'}
table.SCH = {'INT','MND','MagicAccuracy','MagicAtk.Bonus','Magicburstdamage','MagicburstdamageII','MagicDamage','FastCast','Elementalmagiccastingtime','Haste','Damagetaken','Physicaldamagetaken','OccultAcumen','Curepotency','Curepotency II'}
table.RDM = {'INT','MND','MagicAccuracy','MagicAtk.Bonus','Magicburstdamage','MagicburstdamageII','MagicDamage','FastCast','Elementalmagiccastingtime','Haste','Damagetaken','Physicaldamagetaken','OccultAcumen','Curepotency','Curepotency II'}
table.WHM = {'Curepotency','Curepotency II','FastCast','CureGellcasting time','Enmity','DamageTaken','Physicaldamage taken'}
table.SMN = {'Pet:Accuracy','Pet:Attack','Pet:BloodPactdamage','BloodPactabilitydelay','BloodPactabilitydelayII','Avatarperpetuationcost'}
table.RUN = {'DEX','StoreTP','DualWield','QuadrupleAttack','TripleAttack','DoubleAttack','Haste','DamageTaken','Physicaldamagetaken','Magicdamagetaken','MagicEvasion','Enmity'}
table.COR = {'DEX','StoreTP','DualWield','QuadrupleAttack','TripleAttack','DoubleAttack','Haste','DamageTaken','Physicaldamagetaken','Magicdamagetaken','MagicEvasion'}
table.SAM = {'DEX','StoreTP','Zanshin','QuadrupleAttack','TripleAttack','DoubleAttack','Haste'}

--[[lua code]]

slots = {main='main_bag',sub='sub_bag',ammo='ammo_bag',head='head_bag',neck='neck_bag',left_ear='left_ear_bag',right_ear='right_ear_bag',body='body_bag',hands='hands_bag',left_ring='left_ring_bag',right_ring='right_ring_bag',back='back_bag',waist='waist_bag',legs='legs_bag',feet='feet_bag'}

function replace(text)
	text = text:gsub('%%', '')			--delete %
	text = text:gsub('"', '')			--delete "
	text = text:gsub('(-%d+)', '+%1')		--eg.replace -1 for +-1
	text = text:gsub('%s%+', '+')		--delete Gace before plus
	text = text:gsub('%s(%d+)', '+%1')	--replace Gace before number for plus
	text = text:gsub('(%d+)%s*', '%1,')	--replace Gace afrer number for comma
	text = text:gsub('\n', ' ')			--
	text = text:gsub('/', '')			--delete slash
	text = text:gsub(' ', '')			--delete GACE
	text = text:gsub('Avatar:', 'Pet:')		--Avatar replace for Pet
	text = text:gsub('Luopan:', 'Pet:')		--Luopan replace for Pet

	if string.find(text, 'Pet:') then
		text_a = text:gsub('^(.-)Pet.*','%1')
		text_b = ''
		text_b = string.match(text, 'Pet:.*')
		text_b = text_b:gsub('Pet:', '')
		text_b = text_b:gsub('(%w.-,)', 'Pet:%1')
		text = text_a..text_b
		text = text:gsub('Pet:Lv%d+,', '')
		text = text:gsub(' ', '')
	end
	return text
end

function checkparam(command)
	V = {}
	for slot, inBag in pairs(slots) do
	equip = windower.ffxi.get_items().equipment
	gear = windower.ffxi.get_items(equip[inBag],equip[slot])		--装備:収納先--file:..\..\res\bags.lua

		if equip[slot] > 0
		and gear.id then
			--Gが日本語の場合,名称を参照
			if G[res.items[gear.id].ja] then			--装備ID:名称--file:..\..\res\items.lua
				helptext = G[res.items[gear.id].ja]
			else
				helptext = res.item_descriptions[gear.id].en	--装備ID:性能
			end

			helptext = replace(helptext)

			if gear.extdata
			and extdata.decode(gear).augments then
				augments = ''
				for augNo, augment in pairs(extdata.decode(gear).augments) do
					if augment ~= 'none' then
						augments = augments..' '..augment
					end
				end
				augments = replace(augments)
				helptext = helptext..augments
			end

			--windower.add_to_chat(7, windower.to_shift_jis(helptext))
			--windower.add_to_chat(1, gear.id..' '..windower.to_shift_jis(res.items[gear.id].ja))
			for name, param in string.gmatch( helptext, '[,]*(.-)[:+](-*%d+)[,]') do
				if label[name] then
					name = label[name]
				end

				if V[name] then
					V[name] = V[name] + param
				else
					V[name] = param
				end
			end
		end
	end

	windower.add_to_chat(7, '//checkparam : '..windower.ffxi.get_player().name)

	if command == 'all' then
		for key, value in pairs(V) do
			windower.add_to_chat(1, windower.to_shift_jis(key..' : '..value))
		end
	else
		for key, value in pairs(table[windower.ffxi.get_player().main_job]) do
			if V[value] then
				windower.add_to_chat(1, windower.to_shift_jis(value..' : '..V[value]))
			end
		end
	end
end

windower.register_event('load', function()
	print('//cp - show registered param\n//cp all - show all param\n//cp r - reload this add-on' )
end)

windower.register_event('addon command', function(command)
	if command == 'r' then
		windower.send_command('lua r checkparam')
	else
		checkparam(command)
	end
end)