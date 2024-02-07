function onThink(cid, interval)

if #getPlayersOnline() >= 1 then
for _, cid in ipairs(getPlayersOnline()) do
doPlayerSave(cid, true)
return true
end
end

return true
end