function onKill(cid, target)

 local posss = getCreaturePosition(cid)
 local XPMixlort = ( (pokes[getCreatureName(target)].exp) / 10 )

 if not XPMixlort and XPMixlort then
  print("Erro level system, faltando o pokemon na tabela BrendoXp: ")
  print(getCreatureName(target))
  return true
 end

 local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
 local chck = getItemAttribute(feet.uid, "exp")
 local chckc = getItemAttribute(feet.uid, "level")
 
 local summons = getCreatureSummons(cid)
 if #summons == 0 then
 return true
 end

  if getTileInfo(getThingPos(cid)).pvp then 
    return true
  end
 
 if getItemAttribute(feet.uid, "level") >= 100 then 
 	return true
 end
 
 if getPlayerStorageValue(cid, 990) > 0 then
 return true
 end
 
 local pk = getCreatureSummons(cid)[1]
 
 if isPlayer(cid) == TRUE and isSummon(target) == true then
 doPlayerSendCancel(cid, "Your Pokemon dont gain experience in Duel")
 return TRUE
 end
 ---------------------------------------------------------------- level 1 ----------------------------------------------------------------
 if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") == False then
 return true
 end
 
 local level = getItemAttribute(feet.uid, "level")
 local exp = getItemAttribute(feet.uid, "exp")
 local pk = getCreatureSummons(cid)[1]
 
 if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") < 100 and getItemAttribute(feet.uid, "exp") >= 0 and ((XPMixlort*2) + exp) < (level * 20) + (20 *(level - 1)) then
 doItemSetAttribute(feet.uid, "exp", chck + (XPMixlort*2))
 doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Seu "..getPokeName(getCreatureSummons(cid)[1]).." ganhou "..(XPMixlort*2).." de experiência por derrotar "..getCreatureName(target)..".")
 doUpdatePokeInfo(cid)
 return true
 end

 if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") < 100 and ((XPMixlort*2) + exp) >= (level * 20) + (20 *(level - 1)) then
   doPlayerSendTextMessage(cid, 27, "Seu "..getCreatureName(getCreatureSummons(cid)[1]).." avançou do nível "..level.." para o nível "..level + 1 ..".")
   doCreatureSay(cid, getPokeName(getCreatureSummons(cid)[1])..", voce esta ficando muito forte!", TALKTYPE_SAY)	
   doItemSetAttribute(feet.uid, "level", level +1) 
   doItemSetAttribute(feet.uid, "exp", 0)
   doSendAnimatedText(getCreaturePosition(getCreatureSummons(cid)[1]), "LEVEL UP!", 215) 

   local posPlayerLevel = getCreaturePosition(getCreatureSummons(cid)[1])
   doSendMagicEffect(posPlayerLevel, 132)   
   doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}, 1037) 
   doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}, 1035) 
   adjustStatus(pk, feet.uid, true, true, true)
   doUpdatePokeInfo(cid)
   return true
 end

end