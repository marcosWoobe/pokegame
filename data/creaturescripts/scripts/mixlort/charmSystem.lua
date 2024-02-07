local function doCharm(pos, name, mode)
	if pos and name then
		name = "Shiny "..name
		
		if not pokes[name] then 
			return true 
		end	
		
		doSendMagicEffect(pos, 21) 
		doCreateMonster(cid, name, pos, false)
	end	
end

local function doMega(pos, name, mode)
	if pos and name then
		name = "Mega "..name
		
		if not pokes[name] then 
			return true 
		end	
		
		doSendMagicEffect(pos, 21) 
		doCreateMonster(cid, name, pos, false)
	end	
end
	
local function getPokemonCorpse(name)
	if not pokes[name] then return false end
	return getMonsterInfo(name).lookCorpse
end


function onKill(cid, target, lastHit)
      local charmchance = 20
      local charmchance2 = 15
      local charmchance3 = 10
    local nameDeath = doCorrectString(getCreatureName(target))--test
		local pos = getThingPos(target)
		local corpseID = getPokemonCorpse(nameDeath) -- pega essa func do master
		local master = getCreatureMaster(cid)
		local posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
		
		if not isWalkable(posC1) then
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 	
		else
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
		end	


      if isNpc(cid) and not isSummon(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
        if getPlayerStorageValue(getNpcMaster(cid), 4125) - os.time() > 0 then
          if math.random(1, 2000) <= charmchance or isGod(getNpcMaster(cid)) then 
            addEvent(doCharm, 5 * 1000, posC1, nameDeath)
            doPlayerSendTextMessage(getNpcMaster(cid), 20, "[Shiny Charm]: Ira nascer em 5 segundos um Shiny "..getCreatureName(target)..".")   
          end
        end
      end
      
      if isWild(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
        if getPlayerStorageValue(getCreatureMaster(cid), 4125) - os.time() > 0 then
          if math.random(1, 2000) <= charmchance or isGod(getCreatureMaster(cid)) then
            addEvent(doCharm, 5 * 1000, posC1, nameDeath)
            doPlayerSendTextMessage(getCreatureMaster(cid), 20, "[Shiny Charm]: Ira nascer em 5 segundos um Shiny "..getCreatureName(target)..".")  

          end
        end
      end 


      if isNpc(cid) and not isSummon(target) and not getCreatureName(target):find("Mega ") and isMegaCharm(getCreatureName(target)) then
        if getPlayerStorageValue(getNpcMaster(cid), 4126) - os.time() > 0 then
          if math.random(1, 2000) <= charmchance2 or isGod(getNpcMaster(cid)) then 
            addEvent(doMega, 5 * 1000, posC1, nameDeath)
            doPlayerSendTextMessage(getNpcMaster(cid), 20, "[Mega Charm]: Ira nascer em 5 segundos um Mega "..getCreatureName(target)..".")   
          end
        end
      end
      
      if isWild(target) and not getCreatureName(target):find("Mega ") and isMegaCharm(getCreatureName(target)) then
        if getPlayerStorageValue(getCreatureMaster(cid), 4126) - os.time() > 0 then
          if math.random(1, 2000) <= charmchance2 or isGod(getCreatureMaster(cid)) then
            addEvent(doMega, 5 * 1000, posC1, nameDeath)
            doPlayerSendTextMessage(getCreatureMaster(cid), 20, "[Mega Charm]: Ira nascer em 5 segundos um Mega "..getCreatureName(target)..".")  

          end
        end
      end 
      
	return true
end