local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 11000)
setConditionFormula(condition, 0.2, -50, 0.2, -50)

local store = 19290 -- storage q salva o delay
local delay = 12 -- tempo em segundos de delay

function onSay(cid, words, param)
	local pos = getThingPos(cid)

    if getPlayerStorageValue(cid, storageEffectWalk) > 0 then 
        doPlayerSendCancel(cid, "Não pode sobre efeito de bikes ou botas.")
        return true
    end

	if getPlayerStorageValue(cid, store) - os.time() <= 0 then
		setPlayerStorageValue(cid, store, os.time() + delay)

	    if(param == '') then
	        doSendMagicEffect(pos, 14)
	        doCreatureSay(cid, words, 20, false, 0)
	        doAddCondition(cid, condition)
	    end

	    local p = string.explode(param, '"')
	    if p[1] then
	        doSendMagicEffect(pos, 14)
	        doCreatureSay(cid, (words..": "..p[1]), 20, false, 0)
	        doAddCondition(cid, condition)
	    end

	else
		doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para correr novamente.")
		doSendMagicEffect(pos, 2)
	end

return true
end