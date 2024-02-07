function onUse(cid, item, frompos, item2, topos)

local presente = {box = {23482, 1}}

if getPlayerItemCount(cid, presente.box[1]) >= presente.box[2] then
local Pokebolas = {
{[2394] = math.random(10, 20)}, --- Pokeball
{[2391] = math.random(10, 20)}, --- greatball
{[2393] = math.random(10, 20)}, --- superball
}
local potion = {
{[12347] = math.random(10, 20)},
{[12349] = math.random(10, 20)},
}
local PokeBalls = math.random(1,#Pokebolas)
for item, quantidade in pairs(Pokebolas[PokeBalls]) do
doPlayerAddItem(cid, item, quantidade)
end
local Potions = math.random(1,#potion)
for item, quantidade in pairs(potion[Potions]) do
doPlayerAddItem(cid, item, quantidade)
end
if isPremium(cid) then
	doPlayerAddItem(cid, 12344, math.random(5, 20)) --- revive
	doPlayerAddItem(cid, 17629, 1) --- xp boost
end

doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Para abrir este presente você precisa coloca-lo na mochila.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return true
end 
end