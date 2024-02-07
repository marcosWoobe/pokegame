local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_PERIODICDAMAGE, 0)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 2000)

function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
	
		if isRiderOrFlyOrSurf(cid) then 
			effectOnWalk(cid, -1)
			demountPokemon(cid, false)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doRegainSpeed(cid)
		end
		
		if isBiking(cid) then
			effectOnWalk(cid, -1)
			cancelBike(cid)
			doRegainSpeed(cid)		
		end	

		if getPlayerStorageValue (cid, 5700) >= 1 then
			return doPlayerSendCancel(cid, "A roupa apropriada para este solo não pode ser equipada enquanto você estiver montado em sua bike.")
		end
		
		local newtype = getPlayerSex(cid) == 0 and 1034 or 1035
		
      if (getPlayerItemCount(cid, 17655) >= 1 and getPlayerItemCount(cid, 17656) >= 1 and getPlayerItemCount(cid, 17657) >= 1) or getPlayerStorageValue(cid, 2154600) >= 1 then	
			doChangeSpeed(cid, -getCreatureSpeed(cid))
			doChangeSpeed(cid, 1500)
			doSetCreatureOutfit(cid, {lookType = newtype}, -1)
			doAddCondition(cid, condition)
	  end	
	  
	elseif isWild(cid) or isSummon(cid) then 
		poketype1 = pokes[getCreatureName(cid)].type       
		poketype2 = pokes[getCreatureName(cid)].type2 

		if poketype1 == "water" or poketype2 == "water" then
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+753) -- 753
        else
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+213) -- 213
        end
	end
return true
end

function onStepOut(cid, item, position, fromPosition)
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doRemoveCondition(cid, CONDITION_DROWN)
	doChangeSpeed(cid,(-getCreatureSpeed(cid))+400)
	
    if isPlayer(cid) then
		doRegainSpeed(cid)
	end
	
return true
end