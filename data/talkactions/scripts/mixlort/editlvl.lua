function onSay(cid, words, param)
if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nome e n�vel requerido..")
return TRUE
end
 
local t = string.explode(param, ",")
local player = getPlayerByNameWildcard(t[1])
local amount = tonumber(t[2])
if(not t[2]) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� precisa adicionar um, ent�o o n�vel a ser definido.")
end
 
if (doPlayerAddExp(player, getExperienceForLevel(amount)-(getPlayerExperience(player)))) == LUA_ERROR then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Error")
end
doCreatureAddMana(player, getCreatureMaxMana(player)-getCreatureMana(player))
doCreatureAddHealth(player, getCreatureMaxHealth(player)-getCreatureHealth(player))
return TRUE
end