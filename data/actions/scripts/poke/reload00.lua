local function checkDex(cid)
local unlock = 0
	for i = 1, #oldpokedex do
		if getPlayerInfoAboutPokemon(cid, oldpokedex[i][1]).dex then
		   unlock = unlock + 1
		end
	end
return unlock
end

local rate = 50
local rewards = {
}
local sto = 63999

function onUse(cid, item, fromPos, item2, toPos)
 
if not isCreature(item2.uid) then
return true
end

local poke = getCreatureName(item2.uid)

	if isMonster(item2.uid) then
       local this = newpokedex[getCreatureName(item2.uid)]
	   local myball = 0
	   if isSummon(item2.uid) then
	      myball = getPlayerSlotItem(getCreatureMaster(item2.uid), 8)
       end
       if not getPlayerInfoAboutPokemon(cid, poke).dex then
	      local exp = this.level * rate
          doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have unlocked ".. getCreatureName(item2.uid).." in your pokedex!")
	      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have gained "..exp.." experience points.")
          doSendMagicEffect(getThingPos(cid), 210)
          doPlayerAddExperience(cid, exp)
          doAddPokemonInDexList(cid, poke)
       else
          doShowPokedexRegistration(cid, item2, myball)
       end
       local list = checkDex(cid)
       local r = rewards[list]
      -- print("List: "..list)
	   --sendMsgToPlayer(cid, 27, "Parab�ns, voc� tem "..list.." pokeDex!")
       if r and getPlayerStorageValue(cid, sto) < list then
       for _, TABLE in ipairs(r) do
         doPlayerAddItem(cid, TABLE[1], TABLE[2])
       sendMsgToPlayer(cid, 27, "Voce ganhou "..TABLE[2].." ".. getItemNameById(TABLE[1]).."!")
          end
          setPlayerStorageValue(cid, sto, list)

       end
	return true
	end

if not isPlayer(item2.uid) then return true end

	local kanto = 0
	local johto = 0
                                    --alterado v1.7 \/\/
	for i = 1, #oldpokedex do
		if getPlayerInfoAboutPokemon(item2.uid, oldpokedex[i][1]).dex then
		   if i <= 151 then
              kanto = kanto+1
           elseif i >= 209 then
              johto = johto+1
           end
		end
	end                                                      --alterado v1.6

	local player = getRecorderPlayer(toPos, cid)

	if cid == player then
	    doPlayerSendTextMessage(cid, 27, "You has unlocked "..kanto.." kanto's and "..johto.." johto's pok�mons until now.") 
        doPlayerSetVocation(cid, 9) --alterado v1.6
        openChannelDialog(cid)
	end

return true
end