function doHealOverTime(cid, heal, turn, effect)                     --alterado v1.6 peguem o script todo!!
if not isCreature(cid) then return true end

if turn <= 0 or (getCreatureHealth(cid) == getCreatureMaxHealth(cid)) or getPlayerStorageValue(cid, 173) <= 0 then
   setPlayerStorageValue(cid, 173, -1)
   return onPokeHealthChange(getCreatureMaster(cid))
elseif getCreatureHealth(cid) + heal/10 >= getCreatureMaxHealth(cid) then
   doSendAnimatedText(getThingPos(cid), "+"..getCreatureMaxHealth(cid) - getCreatureHealth(cid), 65)
   doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
   doSendMagicEffect(getThingPos(cid), 14)
   return onPokeHealthChange(getCreatureMaster(cid))
end

doSendAnimatedText(getThingPos(cid), "+"..heal/10, 65)
doCreatureAddHealth(cid, heal/10)
doSendMagicEffect(getThingPos(cid), 14)
onPokeHealthChange(getCreatureMaster(cid))
addEvent(doHealOverTime, 1000, cid, heal, turn - 1, effect)
doUpdatePokemonsBar(getCreatureMaster(cid))

local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
doPlayerSendCancel(getCreatureMaster(cid), "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
doPlayerSendCancel(getCreatureMaster(cid), "")

end

local potions = {
[12347] = {health = 400, animate = "SMALL POT", collor = 140},
[12348] = {health = 1500, animate = "GREAT POT", collor = 140},       
[12346] = {health = 4000, animate = "ULTRA POT", collor = 140},
[12345] = {health = 10000, animate = "HYPER POT", collor = 140},
[12343] = {health = 30000, animate = "ULTIMATE POT", collor = 140},
}

function onUse(cid, item, frompos, item2, topos)
local pid = getThingFromPosWithProtect(topos)

if not isSummon(pid) or getCreatureMaster(pid) ~= cid then
return doPlayerSendCancel(cid, "Você só pode usar poções em seus próprios Pokémons!")
end

if getCreatureHealth(pid) == getCreatureMaxHealth(pid) then
return doPlayerSendCancel(cid, "Este Pokémon já está com saúde total.")
end

if getPlayerStorageValue(pid, 173) >= 1 then
return doPlayerSendCancel(cid, "Este pokémon já está sob efeito de poções.")
end

if type(getPlayerStorageValue(cid, 89142)) == "string" then--duel viktor  
return doPlayerSendCancel(cid, "Você não pode fazer isso durante um duelo.")
end

if getPlayerSlotItem(cid, 8).uid == 0 then 
    doPlayerSendCancel(cid, "Por favor, coloque um pokémon no slot principal.")
    return true
end
 
doCreatureSay(cid, "".. getCreatureName(pid)..", tome esta poção!", TALKTYPE_SAY)
doSendAnimatedText(getThingPos(pid), potions[item.itemid].animate, potions[item.itemid].collor)
setPlayerStorageValue(pid, 173, 1)
doRemoveItem(item.uid, 1)

doHealOverTime(pid, potions[item.itemid].health, 10, 12)

return true
end
