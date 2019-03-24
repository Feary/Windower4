reg = {}

windower.register_event('incoming chunk',function(id,original,modified,is_injected,is_blocked)
	if id == 0x00E and string.len(original) >= 53 then
		reg[original:byte(10)*256+original:byte(9)]=original:byte(33)
		if original:byte(33) ~= 1 then
			back = original:sub(1,32)..string.char(0)..original:sub(34,string.len(original))
			return back
		end
	end
end)

windower.register_event('outgoing chunk',function(id,original,modified,is_injected,is_blocked)
	if id == 0x015 and reg[original:byte(24)*256+original:byte(23)] ~= 1 then
		back = original:sub(1,22)..string.char(0,0)..original:sub(25)
		return back
	end
end)

windower.register_event('zone change',function(...)
	reg = {}
end)