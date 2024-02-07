function onUse(cid, item, frompos, item2, topos)

local presente = {box = {23483, 1}}

if getPlayerItemCount(cid, presente.box[1]) >= presente.box[2] then
local Pokebolas = {
{[2391] = math.random(1, 50)}, --- greatball
{[2393] = math.random(1, 35)}, --- superball
{[2392] = math.random(1, 40)}, --- ultraball
}
local potion = {
{[12348] = math.random(1, 40)},
{[12349] = math.random(1, 40)},
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
	doPlayerAddItem(cid, 12344, math.random(20, 40)) --- revive
	doPlayerAddItem(cid, 17629, 1) --- xp boost
end

doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Para abrir este presente você precisa coloca-lo na mochila.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return true
end 
end