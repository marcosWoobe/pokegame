local fishing = {
["Kingler"] = {skill = 0, level = 20, random = 3},
["Seaking"] = {skill = 0, level = 15, random = 3},
["Poliwhirl"] = {skill = 0, level = 9, random = 3},
["Corsola"] = {skill = 0, level = 7, random = 3},

["Lanturn"] = {skill = 10, level = 14, random = 3},
["Azumarill"] = {skill = 10, level = 16, random = 3},
["Qwilfish"] = {skill = 10, level = 40, random = 3},
["Seadra"] = {skill = 10, level = 60, random = 3},

["Quagsire"] = {skill = 20, level = 40, random = 2},
["Starmie"] = {skill = 20, level = 40, random = 2},
["Dewgong"] = {skill = 20, level = 40, random = 2},
["Cloyster"] = {skill = 20, level = 40, random = 2},

["Octillery"] = {skill = 30, level = 9, random = 2},
["Vaporeon"] = {skill = 30, level = 60, random = 2},
["Golduck"] = {skill = 30, level = 60, random = 2},

["Tentacruel"] = {skill = 40, level = 80, random = 1},
["Mantine"] = {skill = 40, level = 80, random = 1},
["Feraligatr"] = {skill = 40, level = 80, random = 1},

["Gyarados"] = {skill = 50, level = 80, random = 1},
["Kingdra"] = {skill = 50, level = 90, random = 1},
["Lapras"] = {skill = 50, level = 90, random = 1},
}

local storage = 15458
local bonus = 3
local limite = 100

local function doPushWithRod(cid, pokename)
	if not isCreature(cid) then return false end
	peixe = doSummonCreature(pokename, getClosestFreeTile(cid, getThingPos(cid)))
	if not isCreature(peixe) then return true end
	
	doSetMonsterPassive(peixe)
	doWildAttackPlayer(peixe, cid)
	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
		doChallengeCreature(getCreatureSummons(cid)[1], peixe)
	else
		doSendMagicEffect(getThingPos(cid), 173)
		doChallengeCreature(cid, peixe)
	end
return true
end

local function doFish(cid, pos, ppos, chance, interval, number)
	if not isCreature(cid) then return false end
	if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then return false end
	if getPlayerStorageValue(cid, storage) ~= number then
		setPlayerStorageValue(cid, storage, -1)
		doPlayerSendTextMessage(cid, 27, "You fished nothing...")
	return false
	end
	
	doSendMagicEffect(pos, CONST_ME_LOSEENERGY)

	local peixe = 0
	local playerpos = getClosestFreeTile(cid, getThingPos(cid))
	local fishes = {}
	local randomfish = ""
	
	if getPlayerSkillLevel(cid, 6) < limite then 
		doPlayerAddSkillTry(cid, 6, bonus)
	end

	for a, b in pairs (fishing) do
		if getPlayerSkillLevel(cid, 6) >= b.skill then
			table.insert(fishes, a)
		end
	end

	if math.random(1, 100) <= chance then
		if getPlayerSkillLevel(cid, 6) < limite then 
			doPlayerAddSkillTry(cid, 6, bonus)
		end
		randomfish = fishes[math.random(#fishes)]
		if not randomfish then
			addEvent(doFish, interval, cid, pos, ppos, chance, interval, number)
		end
		for i = 1, fishing[randomfish].random do
			x = math.random(i)
			if getPlayerSkillLevel(cid, 6) <= 30 then
				x = x - 2
			elseif getPlayerSkillLevel(cid, 6) >= 70 then
				x = x + 2
			end
			if x <= 0 then
				x = 1
			end
			addEvent(doPushWithRod, 10 * x, cid, randomfish)
		end
	return true
	end
	addEvent(doFish, interval, cid, pos, ppos, chance, interval, number)
return true
end

local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}

function onUse(cid, item, fromPos, itemEx, toPos)

if getPlayerGroupId(cid) == 11 then
return true
end

local checkPos = toPos
checkPos.stackpos = 0

if getTileThingByPos(checkPos).itemid <= 0 then
   doPlayerSendCancel(cid, '!')
   return true
end

if not isInArray(waters, getTileInfo(toPos).itemid) then
   return true
end

if (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) and not canFishWhileSurfingOrFlying then
   doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
   return true
end

if isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then
   doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
   return true
end

if getTileInfo(getThingPos(getCreatureSummons(cid)[1] or cid)).protection then
	doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
return true
end

if not tonumber(getPlayerStorageValue(cid, storage)) then
	local test = io.open("data/sendtobrun123.txt", "a+")
	local read = ""
	if test then
		read = test:read("*all")
		test:close()
	end
	read = read.."\n[fishing.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, storage)..""
	local reopen = io.open("data/sendtobrun123.txt", "w")
	reopen:write(read)
	reopen:close()
	setPlayerStorageValue(cid, storage, 1)
end

setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
if getPlayerStorageValue(cid, storage) >= 800 then
   setPlayerStorageValue(cid, storage, 1)
end

local delay = 1500
local chance = 30 + getPlayerSkillLevel(cid, 6) / 5

doFish(cid, toPos, getThingPos(cid), chance, delay, getPlayerStorageValue(cid, storage))

return true
end