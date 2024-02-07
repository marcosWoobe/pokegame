function onWalk(cid, frompos, topos)

   if not isPlayer(cid) then return true end
   if isPlayerGhost(cid) then return true end

   local effect = getPlayerStorageValue(cid, storageEffectWalk)

   if getPlayerStorageValue(cid, storageEffectWalk) > 0 then
      addEvent(effectWhenWalking, 100, cid, effect, frompos, topos)
   end

return true
end
