local Megas = {
"Beedrill", "Blaziken", "Houndoom", "Pidgeot", "Pinsir", "Sceptile", "Scizor", "Swampert"}

local raros = {}                               

local function MegaName(cid)
    if isCreature(cid) then
        if string.find(tostring(getCreatureName(cid)), "Mega") then
            local newName = tostring(getCreatureName(cid)):match("Mega (.*)") 
            if getCreatureName(cid) == "Mega Charizard X" or getCreatureName(cid) == "Mega Charizard Y" then
			    newName = "Charizard"
			end
            doCreatureSetNick(cid, newName)
            if isMonster(cid) then
                doSetCreatureDropLoot(cid, false)  
            end
        end
    end
end

local function doMega(cid)
    if isCreature(cid) then
        if isSummon(cid) then return true end
        if getPlayerStorageValue(cid, 74469) >= 1 then return true end
        if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
        if isNpcSummon(cid) then return true end
        if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v1.9
   
        if isInArray(Megas, getCreatureName(cid)) then  --alterado v1.9 \/
            chance = 2    --1% chance        
        elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
            chance = 1   --1% chance       
        else
            return true
        end  
		
        if math.random(1, 500) <= chance*5 then  
            doSendMagicEffect(getThingPos(cid), 18) 
			local name, pos = "Mega "..getCreatureName(cid), getThingPos(cid)
            if getCreatureName(cid) == "Charizard" then
			    if math.random(1, 100) <= 10 then
			        name = name.." X"
				else
				    name = name.." Y"
				end
			end
            
            doRemoveCreature(cid)
            local shi = doCreateMonster(name, pos, false)
            setPlayerStorageValue(shi, 74469, 1)      
        else
            setPlayerStorageValue(cid, 74469, 1)
        end                                        --/\
    else                                                            
        return true
    end
end
                                                                
function onSpawn(cid)

    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "DirectionSystem")
	registerCreatureEvent(cid, "CastSystem")
	
	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
		return true
	end 
	
	addEvent(doMega, 10, cid)
	addEvent(MegaName, 15, cid)
	addEvent(adjustWildPoke, 5, cid)

return true
end