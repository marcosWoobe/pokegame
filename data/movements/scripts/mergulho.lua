[[local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_PERIODICDAMAGE, 0)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 2000)
local pokesWater = {"Squirtle", "Wartortle", "Blastoise", "Staryu", "Starmie", "Phione", "Manaphy", "Magikarp", "Gyarados", "Horsea", "Seadra", "Kingdra", "Tentacool", "Tentacruel","Goldeen", "Seaking", "Horsea", "Dewgong", "Cloyster", "Seel", "Shellder", "Krabby", "Kingler", "Lapras", "Wailord", "Milotic", "Corsola", "Psyduck", "Golduck", "Chinchou", "Lanturn","Poliwag", "Poliwhirl", "Politoed", "Poliwrath", "Slowpoke", "Slowbro", "Shiny Cloyster", "Piplup", "Prinplup", "Empoleon", "Mudkip", "Marshtomp", "Swampert", "Totodile", "Crocodile","Feraligatr", "Shiny Feraligatr", "Shiny Blastoise", "Shiny Empoleon", "Giant Magikarp", "Shiny Giant Magikarp", "Vaporeon", "Shiny Vaporeon", "Omanyte", "Shiny Omanyte", "Omastar","Shiny Omastar", "Kabuto", "Kabutops", "Shiny Kabutops", "Mantine", "Shiny Mantine", "Shiny Politoed", "Shiny Corsola", "Qwilfish", "Shiny Qwilfish", "Shiny Wartortle", "Shiny Squirtle", "Lotad", "Lombre", "Ludicolo", "Crawdaunt", "Marill", "Azumarill", "Wooper", "Quagsire", "Slowking", "Remoraid", "Octillery","Shiny Krabby", "Shiny Kingler", "Shiny Horsea", "Shiny Seadra", "Shiny Kingdra", "Shiny Tentacool", "Shiny Tentacruel", "Shiny Magikarp", "Shiny Gyarados", "Shiny Slowking","Shiny Wailord", "Shiny Milotic", "Shiny Lapras", "Shiny Golduck", "Shiny Psyduck", "Shiny Starmie", "Shiny Lanturn","Mega Blastoise", "Mega Gyarados", "Mega Slowking", "Mega Swampert"}
function onStepIn(cid, item, position, fromPosition)	
    if isPlayer(cid) and getPlayerStorageValue(cid, 150000) >= 1 then	
        if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue (cid, 17001) >= 1 then		   
            doPlayerSendCancel(cid, "A roupa apropriada para este solo não pode ser equipada enquanto você estiver montado em seu pokémon.")		
            return true		
        end		 
        if getPlayerStorageValue (cid, 5700) >= 1 then
			doPlayerSendCancel (cid, "A roupa apropriada para este solo não pode ser equipada enquanto você estiver montado em sua bike.")		
			return true		
		end		
		local newtype = getPlayerSex(cid) == 0 and 1034 or 1035		
		doChangeSpeed(cid, -getCreatureSpeed(cid))		
		doChangeSpeed(cid, 1500)		
		doSetCreatureOutfit(cid, {lookType = newtype}, -1)
		doAddCondition(cid, condition)	
	elseif isInArray (pokesWater, getCreatureName(cid)) then
    	doChangeSpeed(cid, -getCreatureSpeed(cid))		
		doChangeSpeed(cid, getCreatureSpeed(cid) + 700)
    end		
		
	return true
end
		
function onStepOut(cid, item, position, fromPosition)	
	if isPlayer(cid) and getPlayerStorageValue(cid, 150000) >= 1 then		
		if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue (cid, 17001) >= 1 then return true end		
		if getPlayerStorageValue (cid, 5700) >= 1 then return true end				
		doRemoveCondition(cid, CONDITION_OUTFIT)		
		doRemoveCondition(cid, CONDITION_DROWN)		
		doRegainSpeed(cid)	
	else		
		doRegainSpeed(cid)	
	end
	return true
end]]

function onStepIn(cid, item, position, fromPosition)
    -- se tiver em ride fly vai setar a speed pra zero
    if getPlayerStorageValue(cid, 17000) == 1 or getPlayerStorageValue(cid, 17001) == 1 or getPlayerStorageValue(cid, 5700) == 1 then
        doPlayerSendCancel(cid, "A roupa apropriada para este solo não pode ser equipada enquanto você estiver montado em seu pokémon.")	
		return true
    end

    if (isPlayer(cid)) then
        if getPlayerStorageValue(cid, 150000) >= 1 then -- aqui coloca as roupas de neve
            doChangeSpeed(cid, -getCreatureSpeed(cid)) 
            doChangeSpeed(cid, getCreatureSpeed(cid)+1500) 
			local outfit = getCreatureOutfit(cid)
			if getPlayerSex(cid) == 1 then
      			doSetCreatureOutfit(cid, {lookType = 1035, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
   			else
      		    doSetCreatureOutfit(cid, {lookType = 1034, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
   			end
        else
            return true
        end
    end

    if ehMonstro(cid) or isSummon(cid) then

        poketype1 = pokes[getCreatureName(cid)].type       
        poketype2 = pokes[getCreatureName(cid)].type2 
        if poketype1 == "water" or poketype2 == "water" then  
           doChangeSpeed(cid,(-getCreatureSpeed(cid))+400)
        else
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+200)
        end
    end

    return true
end

function onStepOut(cid, item, position, fromPosition)
    doChangeSpeed(cid,(-getCreatureSpeed(cid))+200)
    return true
end