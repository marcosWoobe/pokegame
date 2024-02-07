local effect = 169                                   --by brun123    --alterado v1.9 \/ 
local stoneEffect = {
[11453] = 1027,--Heart Stone
[11441] = 1015,--Leaf Stone
[11442] = 1018,--Water Stone
[11443] = 1021, --Venom Stone
[11444] = 1017,--Thunder Stone
[11445] = 1023,--Rock Stone
[11446] = 1022,--Punch Stone
[11447] = 1016,--Fire Stone
[11448] = 1028,--Cocoon Stone
[11449] = 1026,--Crystal Stone
[11450] = 1024,--Darkness Stone
[11451] = 1022,--Earth Stone
[11452] = 1025,--Enigma Stone
[11454] = 1020,--Ice Stone
[12244] = 283,--Ancient Stone
[12232] = 282--Metal Stone
}
local function func(cid, position, corpseid, effect)
    if not isCreature(cid) then 
		return true
    end
    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 then 
		return
	end
    if not isContainer(corpse) then 
		return true
	end
    for slot = 0, (getContainerSize(corpse)-1) do
        local item = getContainerItem(corpse, slot)
        if item.uid <= 1 then 
			return 
		end
        if isStone(item.itemid) then
		    if stoneEffect[item.itemid] then
				local posPlayerLevel = position
				local pos2 = {x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}
				addEvent(doSendMagicEffect, 500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 1000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 1500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 2000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 2500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 3000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 3500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 4000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 4500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 5000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 5500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 6000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 6500, pos2, stoneEffect[item.itemid])
			    -- doSendMagicEffect(position, stoneEffect[item.itemid] - 1)
			end
		    --doSendMagicEffect(position, 285)
			-- addEvent(doSendMagicEffect, 1000, position, 285)
            return doSendMagicEffect(getThingPos(cid), effect)
        end
    end
end
function onKill(cid, target, lastHit)

    if not ehMonstro(target) then return true end
    local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse

    addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)
return true
end