local special = specialevo                  --alterado v1.9 \/ peguem ele todo!

local types = {
[leaf] = {"Bulbasaur", "Ivysaur", "Oddish", "Gloom", "Bellsprout", "Weepinbell", "Exeggcute", "Chikorita", "Bayleef", "Hoppip", "Skiploom", "Sunkern"},
[water] = {"Squirtle", "Wartortle", "Horsea", "Goldeen", "Magikarp", "Psyduck", "Poliwag", "Poliwhirl", "Tentacool", "Krabby", "Staryu", "Omanyte", "Eevee", "Totodile", "Croconow", "Chinchou", "Marill", "Wooper", "Slowpoke", "Remoraid", "Seadra"},
[venom] = {"Zubat", "Ekans", "Nidoran male", "Nidoran female", "Nidorino", "Nidorina", "Gloom", "Venonat", "Tentacool", "Grimer", "Koffing", "Spinarak", "Golbat"},
[thunder] = {"Magnemite", "Pikachu", "Voltorb", "Eevee", "Chinchou", "Pichu", "Mareep", "Flaaffy", "Elekid"},
[rock] = {"Geodude", "Graveler", "Rhyhorn", "Kabuto", "Slugma", "Pupitar"},
[punch] = {"Machop", "Machoke", "Mankey", "Poliwhirl", "Tyrogue"},
[fire] = {"Charmander", "Charmeleon", "Vulpix", "Growlithe", "Ponyta", "Eevee", "Cyndaquil", "Quilava", "Slugma", "Houndour", "Magby"},
[coccon] = {"Caterpie", "Metapod", "Weedle", "Kakuna", "Paras", "Venonat", "Scyther", "Ledyba", "Spinarak", "Pineco"},
[crystal] = {"Dratini", "Dragonair", "Magikarp", "Omanyte", "Kabuto", "Seadra"},
[dark] = {"Gastly", "Haunter", "Eevee", "Houndour", "Pupitar"},
[earth] = {"Cubone", "Sandshrew", "Nidorino", "Nidorina", "Diglett", "Onix", "Rhyhorn", "Wooper", "Swinub", "Phanpy", "Larvitar"},
[enigma] = {"Abra", "Kadabra", "Psyduck", "Slowpoke", "Drowzee", "Eevee", "Natu", "Smoochum"},
[heart] = {"Rattata", "Pidgey", "Pidgeotto", "Spearow", "Clefairy", "Jigglypuff", "Meowth", "Doduo", "Porygon", "Chansey", "Sentret", "Hoothoot", "Cleffa", "Igglybuff", "Togepi", "Snubull", "Teddiursa"},
[ice] = {"Seel", "Shellder", "Smoochum", "Swinub"},
[metal] = {"Onix", "Scyther"},
[ancient] = {"Sunkern", "Gloom", "Slowpoke", "Poliwhirl", "Seadra", "Porygon"},
}

local specEvos = {   --alterado v1.9 \/
["Eevee"] = {
               [thunder] = "Jolteon",
               [water] = "Vaporeon",
               [fire] = "Flareon",
               [enigma] = "Espeon",
               [dark] = "Umbreon",
               [leaf] = "Leafeon",
               [ice] = "Glaceon",
            },
}

function onUse(cid, item, frompos, item2, topos)
if isEvolving(cid) then
    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    doSendMagicEffect(getPlayerPosition(cid), 2)   
    return true
end

-- if not getCreatureName(cid) == "Mixlort" then 
--     doPlayerSendTextMessage(cid, 25, "Sistema desativado temporariamente!")
--     return true
-- end

local pokeball = getPlayerSlotItem(cid, 8)
if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
    doPlayerSendTextMessage(cid, 25, "Você não pode evoluir Ditto!")
    return true
end

if not pokeball then
  doSendMagicEffect(getPlayerPosition(cid), 2)   
    return true
end

if not isMonster(item2.uid) or not isSummon(item2.uid) then
  doSendMagicEffect(getPlayerPosition(cid), 2)   
   return true
end
if #getCreatureSummons(cid) > 1 or  #getCreatureSummons(cid) < 1 then
  doSendMagicEffect(getPlayerPosition(cid), 2)   
    return true                           --alterado v1.9
end

if (getCreatureMaster(item2.uid) ~= cid) then
  -- doPlayerSendTextMessage(cid, 27, "vai da o cu otario.")
  doSendMagicEffect(getPlayerPosition(cid), 2)   
  return true
end

-- if (getTileInfo(getPlayerPosition(cid)).protection) then -- Block send pokemon to protected zones, prevent bugs like easy fishing skill
--     doPlayerSendTextMessage(cid, 27, ("Você não pode evoluir seu pokemon em pz."))
--     doPlayerSendTextMessage(cid, 25, ("Você não pode evoluir seu pokemon em pz."))
--     doSendMagicEffect(getPlayerPosition(cid), 2)  
--     return true
-- end

if getCreatureCondition(item2.uid, CONDITION_INVISIBLE) then return true end

local pevo = poevo[getCreatureName(item2.uid)]

    --viktor--
-- if string.find(tostring(getCreatureName(item2.uid)), "Shiny") then
--   if not pevo then
--     doPlayerSendTextMessage(cid, 27, "Este pokemon não pode evoluir.")
--     doSendMagicEffect(getPlayerPosition(cid), 2)   
--         return true
--     end

-- if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
--       doPlayerSendTextMessage(cid, 27, "Você só pode usar pedras em pokemons de sua propriedade.")
--       doSendMagicEffect(getPlayerPosition(cid), 2)   
--       return true
--   end

-- -- if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
-- --   doPlayerSendTextMessage(cid, 27, "Você destransformou o Ditto.")
-- --       return true
-- --   end
 

-- local evo = poevo[getPokemonName(item2.uid)].evolution
-- local minlevel = pokes[evo].level
-- if getPlayerLevel(cid) < minlevel then
--     doPlayerSendTextMessage(cid, 27, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
--     doSendMagicEffect(getPlayerPosition(cid), 2)   
--     return true
-- end

-- local stoneid = pevo.stoneid
-- local stoneCount = pevo.count
-- if item.itemid == 12401 then
--     stoneid = 12401
--     stoneCount = 1
-- end
 
-- local msgCount = " or 1 Shiny Stone"
-- if pevo.countS and pevo.countS > 0 then
--     stoneCount = pevo.countS
--   msgCount = ""
-- end

-- if getPlayerItemCount(cid, stoneid) < stoneCount then
--       local str = "s"
  
--     doSendMagicEffect(getPlayerPosition(cid), 2)   
--     return doPlayerSendTextMessage(cid, 27, "Você precisa de pelo menos "..stoneCount.." "..getItemNameById(stoneid)..""..str..msgCount.." para evoluir este pokémon!")
-- end

--   doEvolvePokemon(cid, (item2.uid), evo, stoneid, stoneCount)
--   local ball = getPlayerSlotItem(cid, 8).uid
  
--     return true
-- end

if not isInArray(specialevo, getCreatureName(item2.uid)) then
   if not pevo then
      doPlayerSendTextMessage(cid, 27, "This pokemon can't evolve.")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
   end
   if not isPlayer(getCreatureMaster(item2.uid)) or getCreatureMaster(item2.uid) ~= cid then
      doPlayerSendTextMessage(cid, 27, "You can only use stones on pokemons you own.")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
   end
   if pevo.stoneid ~= item.itemid and pevo.stoneid2 ~= item.itemid then 
      doPlayerSendTextMessage(cid, 27, "This isn't the needed stone to evolve this pokemon.")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
   end
end

-- if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
--     doPlayerSendTextMessage(cid, 27, "Você destransformou o Ditto.")
--     return true
-- end

local minlevel = 0

if getPokemonName(item2.uid) == "Eevee" then
   local eevee = specEvos["Eevee"][item.itemid]
   if not eevee then
      doPlayerSendTextMessage(cid, 27, "This isn't the required stone to evolve this pokemon.")
      return true
   end   

   minlevel = pokes[eevee].level

   if getPlayerLevel(cid) < minlevel then
      doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      return true
   end

   doRemoveItem(item.uid, 1)
   doEvolvePokemon(cid, (item2.uid), eevee, 0, 0)
    local ball = getPlayerSlotItem(cid, 8).uid
    
    
    
   return true
end

if isInArray(specialevo, getPokemonName(item2.uid)) then
   if getPokemonName(item2.uid) == "Poliwhirl" then
      local evolution = 0
      local theevo = ""
      
      if item.itemid == water then
         if getPlayerItemCount(cid, king) >= 1 then
            evolution = king
      theevo = "Politoed"
         elseif getPlayerItemCount(cid, punch) >= 1 then
      evolution = punch
      theevo = "Poliwrath"
         else
            doPlayerSendTextMessage(cid, 27, "You need a water stone and a punch stone (Poliwrath) or a King's Rock (Politoed) to evolve this pokemon.")
            doSendMagicEffect(getPlayerPosition(cid), 2)   
            return true
         end
         
         minlevel = pokes[theevo].level
         
         if getPlayerLevel(cid) < minlevel then
            doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
            doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end
         if getPlayerItemCount(cid, punch) >= 1 and getPlayerItemCount(cid, king) >= 1 then
            doPlayerSendTextMessage(cid, 27, "Please, use your Punch Stone to evolve this pokemon to a Poliwrath, or a King's Rock to a Politoed.")
            doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end
         doEvolvePokemon(cid, (item2.uid), theevo, evolution, water)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          

    elseif item.itemid == punch then
         minlevel = pokes["Poliwrath"].level
         
         if getPlayerLevel(cid) < minlevel then
      doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end
         if getPlayerItemCount(cid, water) <= 0 then
      doPlayerSendTextMessage(cid, 27, "You need at least one Punch Stone and one Water Stone to evolve this pokemon.")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end

         local theevo = "Poliwrath"
         doEvolvePokemon(cid, (item2.uid), theevo, water, punch)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          
  
    elseif item.itemid == king then
         minlevel = pokes["Politoed"].level

         if getPlayerLevel(cid) < minlevel then
      doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end
         if getPlayerItemCount(cid, water) <= 0 then
      doPlayerSendTextMessage(cid, 27, "You need at least one Punch Stone and one King's Rock to evolve this pokemon.")
      doSendMagicEffect(getPlayerPosition(cid), 2)   
      return true
         end
         local theevo = "Politoed"
         doEvolvePokemon(cid, (item2.uid), theevo, water, king)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          
      end

  elseif getPokemonName(item2.uid) == "Gloom" then
       local theevo = ""
     local evolution = 0
       if item.itemid == leaf then
          if getPlayerItemCount(cid, venom) >= 1 then
           theevo = "Vileplume"
       evolution = venom
        elseif getPlayerItemCount(cid, leaf) >= 2 then
             theevo = "Bellossom"
       evolution = leaf
          else
             doPlayerSendTextMessage(cid, 27, "You need at least one Leaf Stone (2) (Bellossom) or a Venom Stone (Vileplume) to evolve this pokemon.")
             doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
        end
        
        minlevel = pokes[theevo].level
        
        if getPlayerLevel(cid) < minlevel then
           doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
           doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
        end
          if getPlayerItemCount(cid, venom) >= 1 and getPlayerItemCount(cid, sun) >= 1 then
           doPlayerSendTextMessage(cid, 27, "Please, use your Venom Stone to evolve this pokemon to a Vileplume, or a Sun Stone to a Bellossom.")
           doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
        end
          
          doEvolvePokemon(cid, (item2.uid), theevo, evolution, leaf)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          

     elseif item.itemid == venom then
          minlevel = pokes["Vileplume"].level

          if getPlayerLevel(cid) < minlevel then
             doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
             doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
          end
          if getPlayerItemCount(cid, leaf) <= 0 then
       doPlayerSendTextMessage(cid, 27, "You need at least one Leaf Stone and one Venom Stone to evolve this pokemon.")
       doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
          end
          doEvolvePokemon(cid, (item2.uid), "Vileplume", venom, leaf)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          
          
       elseif item.itemid == sun then
          minlevel = pokes["Bellossom"].level

          if getPlayerLevel(cid) < minlevel then
             doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
             doSendMagicEffect(getPlayerPosition(cid), 2)   
             return true
          end
          if getPlayerItemCount(cid, leaf) <= 0 then
       doPlayerSendTextMessage(cid, 27, "You need at least one Leaf Stone and one Sun Stone to evolve this pokemon.")
       doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
          end
          doEvolvePokemon(cid, (item2.uid), "Bellossom", sun, leaf)
          local ball = getPlayerSlotItem(cid, 8).uid
          
          
          
       end
       
  elseif getPokemonName(item2.uid) == "Slowpoke" then
         if isInArray({enigma, ancient}, item.itemid) then
            if item.itemid == ancient then
               if getPlayerLevel(cid) < pokes["Slowking"].level then
                  doPlayerSendCancel(cid, "Você precisar ser level ".. pokes["Slowking"].level .." para evoluir este pokémon.")
                  return true
               end
               
               if doEvolvePokemon(cid, item2.uid, "Slowking", ancient, 0) then
                  doPlayerRemoveItem(cid, ancient, 2)
               end                  
            elseif item.itemid == enigma then
               if getPlayerLevel(cid) < pokes["Slowbro"].level then
                  doPlayerSendCancel(cid, "Você precisar ser level ".. pokes["Slowbro"].level .." para evoluir este pokémon.")
                  return true
               end
               
               if doEvolvePokemon(cid, item2.uid, "Slowbro", enigma, 0) then
                  doPlayerRemoveItem(cid, enigma, 2)
               end
            else
               doPlayerSendCancel(cid, "Você não tem a quantidade necessária de stones para evoluir.")
            end
         else
            doPlayerSendCancel(cid, "Você não pode evoluir este pokémon usando está stone.")
         end   
         return true 

  elseif getPokemonName(item2.uid) == "Tyrogue" then
        local evolution = ""

        evolution = choose("Hitmonlee", "Hitmonchan", "Hitmontop")
    minlevel = pokes[evolution].level

    if getPlayerLevel(cid) < minlevel then
       doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
       doSendMagicEffect(getPlayerPosition(cid), 2)   
       return true
    end
        doEvolvePokemon(cid, (item2.uid), evolution, punch, 0)
        local ball = getPlayerSlotItem(cid, 8).uid
        
        
        
  end
return true
end

local count = poevo[getPokemonName(item2.uid)].count
local stnid = poevo[getPokemonName(item2.uid)].stoneid
local stnid2 = poevo[getPokemonName(item2.uid)].stoneid2
local evo = poevo[getPokemonName(item2.uid)].evolution

if stnid2 > 1 and (getPlayerItemCount(cid, stnid2) < count or getPlayerItemCount(cid, stnid) < count) then
   doPlayerSendTextMessage(cid, 27, "You need at least one "..getItemNameById(stnid).." and one "..getItemNameById(stnid2).." to evolve this pokemon!")
   doSendMagicEffect(getPlayerPosition(cid), 2)   
   return true
end

if getPlayerItemCount(cid, stnid) < count then
   local str = ""
   if count >= 2 then
      str = "s"
   end
doSendMagicEffect(getPlayerPosition(cid), 2)   
return doPlayerSendTextMessage(cid, 27, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." to evolve this pokemon!")
end

minlevel = pokes[evo].level

if getPlayerLevel(cid) < minlevel then
   doPlayerSendTextMessage(cid, 27, "You don't have enough level to evolve this pokemon ("..minlevel..").")
   doSendMagicEffect(getPlayerPosition(cid), 2)   
   return true
end

if count >= 2 then
   stnid2 = stnid
end

doEvolvePokemon(cid, (item2.uid), evo, stnid, stnid2)
local ball = getPlayerSlotItem(cid, 8).uid




return TRUE
end