local posis = {   --[storage da city] = {pos da nurse na city},
[897530] = {x = 1024, y = 1027, z = 7},   --saffron                   --alterado v1.9 \/
[897531] = {x = 1019, y = 771, z = 7},    --cerulean
[897532] = {x = 1063, y = 1273, z = 7},    --vermilion
[897533] = {x = 487, y = 849, z = 7},    --pewter
[897534] = {x = 1250, y = 1019, z = 7},    --lavender
[897535] = {x = 1104, y = 1471, z = 6},    --fuchsia
[897536] = {x = 800, y = 1037, z = 6},    --celadon
[897537] = {x = 403, y = 1143, z = 7},    --viridian
[897538] = {x = 453, y = 1392, z = 6},    --cinnabar
[897539] = {x = 1749, y = 1618, z = 11},    --Outland1[X: 1749] [Y: 1618] [Z: 11].
[897540] = {x = 1393, y = 1396, z = 11},    --Outland2[X: 1393] [Y: 1396] [Z: 11].
[897541] = {x = 1404, y = 1778, z = 11},    --Outland3[X: 1404] [Y: 1778] [Z: 11].

--[[[897539] = {x = 1429, y = 1597, z = 6},    --snow
[897540] = {x = 258, y = 429, z = 7},    --golden

[897541] = {x = 243, y = 1028, z = 7}, -- Hammlin
[897542] = {x = 268, y = 1163, z = 7}, -- Shamouti
[897543] = {x = 252, y = 1260, z = 6}, -- Ascordbia
[897544] = {x = 2612, y = 985, z = 7}, -- Vip 1
[897545] = {x = 2680, y = 675, z = 7}, -- Vip 2
[897546] = {x = 2559, y = 444, z = 5}, -- Vip 3

[897546] = {x = 2559, y = 444, z = 5}, -- Pallet
[897546] = {x = 652, y = 1171, z = 7}, -- Coliseum

[897546] = {x = 1163, y = 1450, z = 13}, -- Outland north
[897546] = {x = 1509, y = 1290, z = 13}, -- outland west
[897546] = {x = 1152, y = 1068, z = 13}, -- outland sul]]
}

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

for a, b in pairs(gobackmsgs) do
	local gm = string.gsub(b.go, "doka!", "")
	local bm = string.gsub(b.back, "doka!", "")
if string.find(string.lower(msg), string.lower(gm)) or string.find(string.lower(msg), string.lower(bm)) then
return true
end
end

if((msgcontains(msg, 'hi') or msgcontains(msg, 'heal') or msgcontains(msg, 'help')) and (getDistanceToCreature(cid) <= 3)) then

 	if exhaustion.get(cid, 9211) then
	selfSay('Por Favor espere um momento para eu por curar novamente seus Pokemons!')
	return true
   	end

	if not getTileInfo(getThingPos(cid)).protection and nurseHealsOnlyInPZ then
		selfSay("Por Favor, entre no Centro Pokemon para eu poder curar seus Pokemons!")
	return true
	end

    if getPlayerSlotItem(cid, 8).uid == 0 then 
        doPlayerSendCancel(cid, "Por favor, coloque um pokémon no slot principal.")
        return true
    end
	
	--[[if getPlayerStorageValue(cid, 52480) >= 1 then
	   selfSay("Não possu curar seus Pokemons enquanto você está em Duel!")   --alterado v1.6.1
    return true 
    end]]
    

	exhaustion.set(cid, 9211, 1)

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
	doCureStatus(cid, "all", true)
	doSendMagicEffect(getThingPos(cid), 103)

	local mypb = getPlayerSlotItem(cid, 8)
	local mypb33 = getPlayerSlotItem(cid, 10)

	if #getCreatureSummons(cid) >= 1 then

		if not nurseHealsPokemonOut then
			selfSay("Please, return your pokemon to his ball!")
		return true
		end

		local s = getCreatureSummons(cid)[1]
		doCreatureAddHealth(s, getCreatureMaxHealth(s))
		doSendMagicEffect(getThingPos(s), 13)
		doCureStatus(s, "all", false)
		if getPlayerStorageValue(s, 1008) < baseNurseryHappiness then
			setPlayerStorageValue(s, 1008, baseNurseryHappiness)
		end
		if getPlayerStorageValue(s, 1009) > baseNurseryHunger then
			setPlayerStorageValue(s, 1009, baseNurseryHunger)
		end
	else
		if mypb.itemid ~= 0 and isPokeball(mypb.itemid) then  --alterado v1.3
		    doItemSetAttribute(mypb.uid, "hp", 1)
			if getItemAttribute(mypb.uid, "hunger") and getItemAttribute(mypb.uid, "hunger") > baseNurseryHunger then
				doItemSetAttribute(mypb.uid, "hunger", baseNurseryHunger)
			end
			for c = 1, 15 do
				local str = "move"..c
				setCD(mypb.uid, str, 0)
			end
			if getItemAttribute(mypb.uid, "happy") and getItemAttribute(mypb.uid, "happy") < baseNurseryHappiness then
				doItemSetAttribute(mypb.uid, "happy", baseNurseryHappiness)
			end
			if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and getPlayerStorageValue(cid, 63215) <= 0 then
				for a, b in pairs (pokeballs) do
					if isInArray(b.all, mypb.itemid) then
					   doTransformItem(mypb.uid, b.on)
					end
				end
			end
		end
		if mypb33.itemid ~= 0 and isPokeball(mypb33.itemid) then  --alterado v1.3
		    doItemSetAttribute(mypb33.uid, "hp", 1)
			if getItemAttribute(mypb33.uid, "hunger") and getItemAttribute(mypb33.uid, "hunger") > baseNurseryHunger then
				doItemSetAttribute(mypb33.uid, "hunger", baseNurseryHunger)
			end
			for c = 1, 15 do
				local str = "move"..c
				setCD(mypb33.uid, str, 0)
			end
			if getItemAttribute(mypb33.uid, "happy") and getItemAttribute(mypb33.uid, "happy") < baseNurseryHappiness then
				doItemSetAttribute(mypb33.uid, "happy", baseNurseryHappiness)
			end
			if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and getPlayerStorageValue(cid, 63215) <= 0 then
				for a, b in pairs (pokeballs) do
					if isInArray(b.all, mypb33.itemid) then
					   doTransformItem(mypb33.uid, b.on)
					end
				end
			end
		end
	end

	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)

    local balls = getPokeballsInContainer(bp.uid)
    if #balls >= 1 then
       for _, uid in ipairs(balls) do
           doItemSetAttribute(uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(uid, str, 0)   
           end
           if getItemAttribute(uid, "hunger") and getItemAttribute(uid, "hunger") > baseNurseryHunger then
              doItemSetAttribute(uid, "hunger", baseNurseryHunger)
           end
           if getItemAttribute(uid, "happy") and getItemAttribute(uid, "happy") < baseNurseryHappiness then
              doItemSetAttribute(uid, "happy", baseNurseryHappiness)
           end
           local this = getThing(uid)
		   --this.itemid
		  -- doTransformItem(uid, pokeballs["ultra"].on)
          for a, b in pairs (pokeballs) do
		       if isInArray(b.all, this.itemid) then
	              doTransformItem(uid, b.on)
               end
           end
        end
    end
    selfSay('Seus Pokemons foram curados, Boa Sorte em sua jornada!')
    if useKpdoDlls then  --alterado v1.7
       doUpdateMoves(cid)
    end
    if useOTClient then
       onPokeHealthChange(cid) --alterei aki
    end

	doUpdatePokemonsBar(cid)

    if #getCreatureSummons(cid) >= 1 then
		local item = getPlayerSlotItem(cid, 8)
		doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
		doPlayerSendCancel(cid, "")
	end

end
end