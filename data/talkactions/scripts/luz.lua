local minutes = 30 -- Minutes
 
function onSay(cid, words, param)
if isPlayer(cid) then
doSetCreatureLight(cid, 50000, 2000, minutes*60*1000)
doSendAnimatedText(getCreaturePosition(cid), "Luz!", math.random(1, 255))
end
return true
end