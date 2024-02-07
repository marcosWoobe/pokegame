local xhelds = {
[1] = {name = "X-Defense(Tier: 1)"},
[2] = {name = "X-Defense(Tier: 2)"},
[3] = {name = "X-Defense(Tier: 3)"},
[4] = {name = "X-Defense(Tier: 4)"},
[5] = {name = "X-Defense(Tier: 5)"},
[6] = {name = "X-Defense(Tier: 6)"},
[7] = {name = "X-Defense(Tier: 7)"},
[8] = {name = "X-Attack(Tier : 1)"},
[9] = {name = "X-Attack(Tier : 2)"},
[10] = {name = "X-Attack(Tier: 3)"},
[11] = {name = "X-Attack(Tier: 4)"},
[12] = {name = "X-Attack(Tier: 5)"},
[13] = {name = "X-Attack(Tier: 6)"},
[14] = {name = "X-Attack(Tier: 7)"},
[15] = {name = "X-Return(Tier: 1)"},
[16] = {name = "X-Return(Tier: 2)"},
[17] = {name = "X-Return(Tier: 3)"},
[18] = {name = "X-Return(Tier: 4)"},
[19] = {name = "X-Return(Tier: 5)"},
[20] = {name = "X-Return(Tier: 6)"},
[21] = {name = "X-Return(Tier: 7)"},
[22] = {name = "X-Hellfire(Tier: 1)"},
[23] = {name = "X-Hellfire(Tier: 2)"},
[24] = {name = "X-Hellfire(Tier: 3)"},
[25] = {name = "X-Hellfire(Tier: 4)"},
[26] = {name = "X-Hellfire(Tier: 5)"},
[27] = {name = "X-Hellfire(Tier: 6)"},
[28] = {name = "X-Hellfire(Tier: 7)"},
[29] = {name = "X-Poison(Tier: 1)"},
[30] = {name = "X-Poison(Tier: 2)"},
[31] = {name = "X-Poison(Tier: 3)"},
[32] = {name = "X-Poison(Tier: 4)"},
[33] = {name = "X-Poison(Tier: 5)"},
[34] = {name = "X-Poison(Tier: 6)"},
[35] = {name = "X-Poison(Tier: 7)"},
[36] = {name = "X-Boost(Tier: 1)"},
[37] = {name = "X-Boost(Tier: 2)"},
[38] = {name = "X-Boost(Tier: 3)"},
[39] = {name = "X-Boost(Tier: 4)"},
[40] = {name = "X-Boost(Tier: 5)"},
[41] = {name = "X-Boost(Tier: 6)"},
[42] = {name = "X-Boost(Tier: 7)"},
[43] = {name = "X-Agility(Tier: 1)"},
[44] = {name = "X-Agility(Tier: 2)"},
[45] = {name = "X-Agility(Tier: 3)"},
[46] = {name = "X-Agility(Tier: 4)"},
[47] = {name = "X-Agility(Tier: 5)"},
[48] = {name = "X-Agility(Tier: 6)"},
[49] = {name = "X-Agility(Tier: 7)"},
[50] = {name = "X-Strafe(Tier: 1)"},
[51] = {name = "X-Strafe(Tier: 2)"},
[52] = {name = "X-Strafe(Tier: 3)"},
[53] = {name = "X-Strafe(Tier: 4)"},
[54] = {name = "X-Strafe(Tier: 5)"},
[55] = {name = "X-Strafe(Tier: 6)"},
[56] = {name = "X-Strafe(Tier: 7)"},
[57] = {name = "X-Rage(Tier: 1)"},
[58] = {name = "X-Rage(Tier: 2)"},
[59] = {name = "X-Rage(Tier: 3)"},
[60] = {name = "X-Rage(Tier: 4)"},
[61] = {name = "X-Rage(Tier: 5)"},
[62] = {name = "X-Rage(Tier: 6)"},
[63] = {name = "X-Rage(Tier: 7)"},

[64] = {name = "X-Harden(Tier: 1)"},
[65] = {name = "X-Harden(Tier: 2)"},
[66] = {name = "X-Harden(Tier: 3)"},
[67] = {name = "X-Harden(Tier: 4)"},
[68] = {name = "X-Harden(Tier: 5)"},
[69] = {name = "X-Harden(Tier: 6)"},
[70] = {name = "X-Harden(Tier: 7)"},

[71] = {name = "X-Experience(Tier: 1)"},
[72] = {name = "X-Experience(Tier: 2)"},
[73] = {name = "X-Experience(Tier: 3)"},
[74] = {name = "X-Experience(Tier: 4)"},
[75] = {name = "X-Experience(Tier: 5)"},
[76] = {name = "X-Experience(Tier: 6)"},
[77] = {name = "X-Experience(Tier: 7)"},

[78] = {name = "X-Elemental(Tier: 1)"},
[79] = {name = "X-Elemental(Tier: 2)"},
[80] = {name = "X-Elemental(Tier: 3)"},
[81] = {name = "X-Elemental(Tier: 4)"},
[82] = {name = "X-Elemental(Tier: 5)"},
[83] = {name = "X-Elemental(Tier: 6)"},
[84] = {name = "X-Elemental(Tier: 7)"},

[85] = {name = "X-Critical(Tier: 1)"},
[86] = {name = "X-Critical(Tier: 2)"},
[87] = {name = "X-Critical(Tier: 3)"},
[88] = {name = "X-Critical(Tier: 4)"},
[89] = {name = "X-Critical(Tier: 5)"},
[90] = {name = "X-Critical(Tier: 6)"},
[91] = {name = "X-Critical(Tier: 7)"},

[92] = {name = "X-Vitality(Tier: 1)"},
[93] = {name = "X-Vitality(Tier: 2)"},
[94] = {name = "X-Vitality(Tier: 3)"},
[95] = {name = "X-Vitality(Tier: 4)"},
[96] = {name = "X-Vitality(Tier: 5)"},
[97] = {name = "X-Vitality(Tier: 6)"},
[98] = {name = "X-Vitality(Tier: 7)"},

[99] = {name = "X-Haste(Tier: 1)"},
[100] = {name = "X-Haste(Tier: 2)"},
[101] = {name = "X-Haste(Tier: 3)"},
[102] = {name = "X-Haste(Tier: 4)"},
[103] = {name = "X-Haste(Tier: 5)"},
[104] = {name = "X-Haste(Tier: 6)"},
[105] = {name = "X-Haste(Tier: 7)"},

[106] = {name = "X-Accuracy(Tier: 1)"},
[107] = {name = "X-Accuracy(Tier: 2)"},
[108] = {name = "X-Accuracy(Tier: 3)"},
[109] = {name = "X-Accuracy(Tier: 4)"},
[110] = {name = "X-Accuracy(Tier: 5)"},
[111] = {name = "X-Accuracy(Tier: 6)"},
[112] = {name = "X-Accuracy(Tier: 7)"},

[113] = {name = "X-Cooldown(Tier: 3)"},
[114] = {name = "X-Cooldown(Tier: 5)"},
[115] = {name = "X-Cooldown(Tier: 7)"},
[116] = {name = "X-Blink(Tier: 5)"},

[117] = {name = "X-Block(Tier: 1)"},
[118] = {name = "X-Block(Tier: 2)"},
[119] = {name = "X-Block(Tier: 3)"},
[120] = {name = "X-Block(Tier: 4)"},
[121] = {name = "X-Block(Tier: 5)"},
[122] = {name = "X-Block(Tier: 6)"},
[123] = {name = "X-Block(Tier: 7)"},

[124] = {name = "X-Lucky(Tier: 1)"},
[125] = {name = "X-Lucky(Tier: 2)"},
[126] = {name = "X-Lucky(Tier: 3)"},
[127] = {name = "X-Lucky(Tier: 4)"},
[128] = {name = "X-Lucky(Tier: 5)"},
[129] = {name = "X-Lucky(Tier: 6)"},
[130] = {name = "X-Lucky(Tier: 7)"},
}

local yhelds = {
[1] = {name = "Y-Regeneration(Tier: 1)"},
[2] = {name = "Y-Regeneration(Tier: 2)"},
[3] = {name = "Y-Regeneration(Tier: 3)"},
[4] = {name = "Y-Regeneration(Tier: 4)"},
[5] = {name = "Y-Regeneration(Tier: 5)"},
[6] = {name = "Y-Regeneration(Tier: 6)"},
[7] = {name = "Y-Regeneration(Tier: 7)"},
[8] = {name = "Y-Cure(Tier: 1)"},
[9] = {name = "Y-Cure(Tier: 2)"},
[10] = {name = "Y-Cure(Tier: 3)"},
[11] = {name = "Y-Cure(Tier: 4)"},
[12] = {name = "Y-Cure(Tier: 5)"},
[13] = {name = "Y-Cure(Tier: 6)"},
[14] = {name = "Y-Cure(Tier: 7)"},

[15] = {name = "Y-Wing(Tier: 1)"},
[16] = {name = "Y-Wing(Tier: 2)"},
[17] = {name = "Y-Wing(Tier: 3)"},
[18] = {name = "Y-Wing(Tier: 4)"}, 
[19] = {name = "Y-Wing(Tier: 5)"},
[20] = {name = "Y-Wing(Tier: 6)"},
[21] = {name = "Y-Wing(Tier: 7)"},

[22] = {name = "Y-Teleport(Tier: 1)"},
[23] = {name = "Y-Teleport(Tier: 2)"},
[24] = {name = "Y-Teleport(Tier: 3)"},
[25] = {name = "Y-Teleport(Tier: 4)"},
[26] = {name = "Y-Teleport(Tier: 5)"},  
[27] = {name = "Y-Teleport(Tier: 6)"},
[28] = {name = "Y-Teleport(Tier: 7)"},
[29] = {name = "Y-Control(Tier: 1)"},
[30] = {name = "Y-Control(Tier: 2)"},
[31] = {name = "Y-Control(Tier: 3)"},
[32] = {name = "Y-Control(Tier: 4)"},
[33] = {name = "Y-Control(Tier: 5)"}, 
[34] = {name = "Y-Control(Tier: 6)"},
[35] = {name = "Y-Control(Tier: 7)"},
[36] = {name = "Y-Antiburn"},
[37] = {name = "Y-Antiself"},
[38] = {name = "Y-Antipoison"},
[39] = {name = "Y-Ghost"},
[40] = {name = "Y-Light"},
[42] = {name = "Y-Dig"},
[43] = {name = "Y-Smash"},
[44] = {name = "Y-Cut"},
}

function onTradeRequest(cid, target, item)

	for a, b in pairs (pokeballs) do
		if b.use == item.itemid then
			doPlayerSendCancel(cid, "You can't trade this item.")
		return false
		end
	end
	
	if isContainer(item.uid) then
	   local bagItems = getItensUniquesInContainer(item.uid)
	   if #bagItems >= 1 then
	      doPlayerSendCancel(cid, "Has a Unique Item in this bag, you can't trade this item.")     --alterado v1.6
	      return false
       end     
	elseif getItemAttribute(item.uid, "unico") then    --alterado v1.6
	   doPlayerSendCancel(cid, "It is a Unique Item, you can't trade this item.")
	   return false
	end   
	
	if isContainer(item.uid) then
	   local itens = getPokeballsInContainer(item.uid)
	   if #itens >= 1 then                             
	      for i = 1, #itens do
	          local lvl = getItemAttribute(itens[i], "level")
	          local name = getItemAttribute(itens[i], "poke")
	          if not lvl then
	             doItemSetAttribute(itens[i], "level", pokes[name].level)     --alterado v1.6
              end
           end
       end
    elseif isPokeball(item.itemid) then
	   local lvl = getItemAttribute(item.uid, "level")
	   local name = getItemAttribute(item.uid, "poke")
	   if not lvl then
	      doItemSetAttribute(item.uid, "level", pokes[name].level)
       end
    end
    
    if getPlayerStorageValue(cid, 52480) >= 1 then             --alterado v1.6.1
       doPlayerSendTextMessage(cid, 20, "You can't do that while be in a duel!")
       return false
    end
    
    if isPokeball(item.itemid) then
       local name = getItemAttribute(item.uid, "poke")            --alterado v1.8 \/
       local lvll = getItemAttribute(item.uid, "level")            --alterado v1.8 \/
       local boost = getItemAttribute(item.uid, "boost") or 0
       local nick = getItemAttribute(item.uid, "nome") or ""
    
       local str = "Pokemon in trade: "
       str = str.."�Name: "..name.."   �Boost: "..boost.."   "
       str = str.."�Level: "..lvll..""
       if nick ~= "" then str = str.."�Nick: "..nick.."" end
	   local heldx = getItemAttribute(item.uid, "heldx")
       local heldy = getItemAttribute(item.uid, "heldy")
	   if heldx and heldy then
str = str.."Holding: "..(xhelds[heldx].name).." and "..(yhelds[heldy].name)..". "
elseif heldx then
str = str.."Holding: "..(xhelds[heldx].name)..". "
elseif heldy then
str = str.."Holding: "..(yhelds[heldy].name)..". "
end
       sendMsgToPlayer(target, 20, str)
    end
                                                            --alterado v1.8 \/
    if isContainer(item.uid) then
	   local itens = getPokeballsInContainer(item.uid)
	   if #itens >= 1 then                             
	      for i = 1, #itens do
	          if isPokeball(getThing(itens[i]).itemid) then
	             local name = getItemAttribute(itens[i], "poke")            
                 local boost = getItemAttribute(itens[i], "boost") or 0
                 local nick = getItemAttribute(itens[i], "nick") or ""
				 	   local heldx = getItemAttribute(itens[i], "heldx")
       local heldy = getItemAttribute(itens[i], "heldy")
    
                 local str = "Pokemon in trade: "
                 str = str.."�Name: "..name.."   �Boost: "..boost.."   "
                 if nick ~= "" then str = str.."�Nick: "..nick.."" end
				  if heldx and heldy then
str = str.."Holding: "..(xhelds[heldx].name).." and "..(yhelds[heldy].name)..". "
elseif heldx then
str = str.."Holding: "..(xhelds[heldx].name)..". "
elseif heldy then
str = str.."Holding: "..(yhelds[heldy].name)..". "
end
                 sendMsgToPlayer(target, 20, str)
              end
          end
	   end       
    end
    

return true
end

local function noCap(cid, sid)
	if isCreature(cid) then
		doPlayerSendCancel(cid, "You can't carry more than six pokemons, trade cancelled.")
	end
	if isCreature(sid) then
		doPlayerSendCancel(sid, "You can't carry more than six pokemons, trade cancelled.")
	end
end

function onTradeAccept(cid, target, item, targetItem)

	local pbs = #getPokeballsInContainer(item.uid)
	local cancel = false
	local p1 = 0
	local p2 = 0
	local itemPokeball = isPokeball(item.itemid) and 1 or 0
	local targetItemPokeball = isPokeball(targetItem.itemid) and 1 or 0

    if getPlayerMana(cid) + itemPokeball > 6 then  --alterado v1.6
	   cancel = true
	   p1 = cid
    end
    if getPlayerMana(target) + targetItemPokeball > 6 then  --alterado v1.6
	   cancel = true
	   p2 = target
    end
    
	if pbs > 0 and getCreatureMana(target) + pbs > 6 + targetItemPokeball then
		cancel = true	
		p1 = target
	end

	pbs = #getPokeballsInContainer(targetItem.uid)

	if pbs > 0 and getCreatureMana(cid) + pbs > 6 + itemPokeball then
		cancel = true
		p2 = cid
	end

	if cancel then
		addEvent(noCap, 20, p1, p2)
	return false
	end

	if itemPokeball == 1 and targetItemPokeball == 1 then
		setPlayerStorageValue(cid, 8900, 1)
		setPlayerStorageValue(target, 8900, 1)
	end

return true
end