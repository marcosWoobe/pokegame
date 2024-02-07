
local function get_date_from_unix(unix_time)
    local day_count, year, days, month = function(yr) return (yr % 4 == 0 and (yr % 100 ~= 0 or yr % 400 == 0)) and 366 or 365 end, 1970, math.ceil(unix_time/86400)

    while days >= day_count(year) do
        days = days - day_count(year) year = year + 1
    end
    local tab_overflow = function(seed, table) for i = 1, #table do if seed - table[i] <= 0 then return i, seed end seed = seed - table[i] end end
    month, days = tab_overflow(days, {31,(day_count(year) == 366 and 29 or 28),31,30,31,30,31,31,30,31,30,31})
    local hours, minutes, seconds = math.floor(unix_time / 3600 % 24), math.floor(unix_time / 60 % 60), math.floor(unix_time % 60)
    local period = hours > 12 and "pm" or "am"
    --hours = hours > 12 and hours - 12 or hours == 0 and 12 or hours
    return string.format("%d/%d/%04d %02d:%02d:%02d %s", days, month, year, hours-3, minutes, seconds, period)
end

local function getConvertTime(tempo)
    local minuT = (tempo-os.time())/60

    local hours = os.date("%H")
	local minutes = os.date("%M")
	local seconds = os.date("%S")
				
	local dia = os.date("%d") 
	local mes = os.date("%m")
	local ano = os.date("%Y")
				
	local horaAtual = hours ..':'..minutes..':'..seconds
	local dataAtual = dia..mes..ano
return "data "..dataAtual.." "..hours..':'..minutes..':'..seconds
end


local function getDataAtual(check)
    local _data = {}
	local dia = os.date("%d") 
	local mes = os.date("%m")
	local ano = os.date("%Y")
	if check ~= nil then
	    dia = dia--+1
        return tostring(dia..'/'..mes..'/'..ano)
	end
	_data['dia'] = tonumber(dia)
	_data['mes'] = tonumber(mes)
	_data['ano'] = tonumber(ano)
	
    return _data
end

local function getDataStr(data, check)
    local _data = {}
	if type(data) ~= "string" then
	
	    _data['dia'] = tonumber(0)
	    _data['mes'] = tonumber(0)
	    _data['ano'] = tonumber(0)
		if check ~= nil then
	   		return "0/0/0"
		end
	    return _data
	end
	
	local strings = data:explode('data') 
	local st = strings[1]
    local str = st:explode('/') 
	local dia = str[1]
	local mes = str[2]
	local ano = str[3]
	
	if dia == nil or mes == nil or ano == nil then
	    _data['dia'] = tonumber(0)
	    _data['mes'] = tonumber(0)
	    _data['ano'] = tonumber(0)
		if check ~= nil then
	   		return "0/0/0"
		end
	    return _data
	end
	_data['dia'] = tonumber(dia)
	_data['mes'] = tonumber(mes)
	_data['ano'] = tonumber(ano)
	
	if check ~= nil then
	    return dia.."/"..mes.."/"..ano
	end
    return _data
end


function onUse (cid,item,frompos,item2,topos)
    local premioTable = {
		-- {reward = {17632}, countMin = {1}, count = {1}},--gengar amulet
		{reward = {17635}, countMin = {1}, count = {1}},--shiny gengar amulet
		{reward = {2152}, countMin = {20}, count = {75}},--dinheiro
		{reward = {2828}, countMin = {50}, count = {50}},--premier ball
		{reward = {2145}, countMin = {1}, count = {1}},--1diamond
		-- {reward = {12832}, countMin = {1}, count = {1}},--1masterball 
		{reward = {12401}, countMin = {1}, count = {1}},--shiny stone
		{reward = {12618}, countMin = {1}, count = {3}},--Boost stone
	    --{reward = {15136}, count = {1}}--1Gengarite
	}
    UID_DO_BAU = 65030
    STORAGE_VALUE = 65030
    
    if item.uid == UID_DO_BAU then
        dataSTR = getDataStr(getPlayerStorageValue(cid, STORAGE_VALUE))
		dataAtual = getDataAtual()
		--setPlayerStorageValue(cid, STORAGE_VALUE, 'data0/0/0')
		if tonumber(dataSTR.ano) == tonumber(dataAtual.ano) and tonumber(dataSTR.mes) == tonumber(dataAtual.mes) and tonumber(dataSTR.dia) == tonumber(dataAtual.dia) then
    		--doPlayerSendTextMessage(cid, 22, "Ta vazio, volte amanha no dia "..getDataStr(getPlayerStorageValue(cid, STORAGE_VALUE), true).." para reindivicar seu premio novamente.")
			doPlayerSendTextMessage(cid, 22, "Ta vazio, volte amanha para reindivicar seu premio novamente.")
			return true
		end

		local premio = math.random(#premioTable)
		for i = 1, #premioTable[premio].reward do
			local Reward = premioTable[premio].reward[i]
			local count = math.random(premioTable[premio].countMin[i], premioTable[premio].count[i])
			doPlayerAddItem(cid, Reward, count)	
		end
				
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false) 
		setPlayerStorageValue(cid, STORAGE_VALUE, 'data'..getDataAtual(true))
		--doPlayerSendTextMessage(cid, 22, getDataAtual(true).."Parabens voce completou a dugeon, volte no dia "..getDataStr(getPlayerStorageValue(cid, STORAGE_VALUE), true).." para reindivicar seu premio novamente.") -- Msg que ira aparecer        
    	doPlayerSendTextMessage(cid, 22, getDataAtual(true).."Parabens voce completou a dugeon, volte amanha para reindivicar seu premio novamente.") -- Msg que ira aparecer        
    end
	
	return true
end