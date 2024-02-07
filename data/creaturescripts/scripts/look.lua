local NPCBattle = {
["Brock"] = {artig = "He is", cidbat = "Pewter"},
["Misty"] = {artig = "She is", cidbat = "Cerulean"},
["Blaine"] = {artig = "He is", cidbat = "Cinnabar"},
["Sabrina"] = {artig = "She is", cidbat = "Saffron"},         --alterado v1.9 \/ peguem tudo!
["Kira"] = {artig = "She is", cidbat = "Viridian"},
["Koga"] = {artig = "He is", cidbat = "Fushcia"},
["Erika"] = {artig = "She is", cidbat = "Celadon"},
["Surge"] = {artig = "He is", cidbat = "Vermilion"},
}

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

[350] = {name = "Blazikenite"},
[351] = {name = "Beedrillite"},
[352] = {name = "Houndoominite"},
[353] = {name = "Pidgeotite"},
[354] = {name = "Swampertile"},
[355] = {name = "Sceptilite"},
[356] = {name = "Scizorite"},
[357] = {name = "Charizardite"},

--[115] = {name = "X-Cooldown(Tier: 7)"},
--[84] = {name = "X-Elemental(Tier: 7)"},
--[91] = {name = "X-Critical(Tier: 7)"},
--[77] = {name = "X-Experience (Tier: 7)"},
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
--------------megas--------------------
[4000] = {name = "Charizardite Y"},
[350] = {name = "Blazikenite"},
[351] = {name = "Beedrillite"},
[352] = {name = "Houndoominite"},
[353] = {name = "Pidgeotite"},
[354] = {name = "Swampertile"},
[355] = {name = "Sceptilite"},
[356] = {name = "Scizorite"},
[357] = {name = "Charizardite"},

}

function onLook(cid, thing, position, lookDistance)                                                   
    local str = {} 

    -- doPlayerSendTextMessage(cid, 20, "ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n")

    if not isCreature(thing.uid) then
        local iname = getItemInfo(thing.itemid)
        if not isPokeball(thing.itemid) then
			if getItemInfo(thing.itemid).price then
				price = getItemInfo(thing.itemid).price 
                if thing.type > 1 then
                    str = "You are viewing "..thing.type.." "..getItemInfo(thing.itemid).plural.."."
                    price = price * thing.type
                else
                    str = "You are viewing "..getItemInfo(thing.itemid).article.." "..getItemInfo(thing.itemid).name.."."
                end
				
                str = str.." Price: $"..price.."."
                if getItemAttribute(thing.uid, "description") then
                    str = str.."\n"..getItemAttribute(thing.uid, "description").."."
                end
				
                if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
                    str = str.."\nItemID: ["..thing.itemid.."]."     
                    str = str.."\nClientID: ["..getItemInfo(thing.itemid).clientId.."]."                                                                                                      --alterado v1.7
                    local pos = getThingPos(thing.uid)
                    str = str.."\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]"
                end
				
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
                return false
            end
        end

		local houseId = getHouseFromPos(position)
		if houseId and getItemNameById(thing.itemid):find("door") then

		   if getHouseOwner(houseId) ~= 0 then house_owner = getPlayerNameByGUID(getHouseOwner(houseId)) else house_owner = "Nobody" end

		   house_name = getHouseName(houseId)
		   house_town = getTownName(getHouseTown(houseId))
		   house_size = getHouseTilesCount(houseId)
		   house_price = getHousePrice(houseId)
		   
		   local house_information = string.format("house_data|%s|%s|%s|%u|%u", house_name, house_owner, house_town, house_size, house_price)
		   return doSendPlayerExtendedOpcode(cid, 180, house_information) and false
		end

                                             
        if isPokeball(thing.itemid) and getItemAttribute(thing.uid, "poke") then
      
            unLock(thing.uid)
            local lock = getItemAttribute(thing.uid, "lock")        
            local pokename = getItemAttribute(thing.uid, "poke")
            local heldx = getItemAttribute(thing.uid, "heldx")
            local heldy = getItemAttribute(thing.uid, "heldy")
            if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
            table.insert(str, ""..iname.article.." "..iname.name..".")
		
            if getItemAttribute(thing.uid, "unico") then               
                table.insert(str, " It's an unique item.")   
            end
		
            local level = getItemAttribute(thing.uid, "level")
            table.insert(str, "[Level]: "..level..".\n")

            if getItemAttribute(thing.uid, "ehditto") == 1 then
                table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename.." (Ditto).\n")
            elseif getItemAttribute(thing.uid, "ehshinyditto") == 1 then
                table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename.." (Shiny Ditto).\n")
            else
                table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename..".\n")
            end

            if lock and lock > 0 then
                table.insert(str, "It will unlock in ".. os.date("%d/%m/%y %X", lock)..".\n")  
            end
	
            local boost = getItemAttribute(thing.uid, "boost") or 0
            if boost > 0 then
                table.insert(str, "Boost level: +"..boost..".\n") 
            end
		
            if getItemAttribute(thing.uid, "nick") then
                table.insert(str, " Nick Is: "..getItemAttribute(thing.uid, "nick")..".\n")
            end

            if getItemAttribute(thing.uid, "temparticle") then
                table.insert(str, "Aura: Particle.\n")
            end
		
	  	    if prices[pokename] then
                table.insert(str, " Price: $".. prices[pokename]..".\n")
            else 
                table.insert(str, " Price: unsellable.\n")
            end
		
            if heldx and heldy then
                table.insert(str, "Holding: "..(xhelds[heldx].name).." and "..(yhelds[heldy].name)..".\n")
            elseif heldx then
                table.insert(str, "Holding: "..(xhelds[heldx].name)..".\n")
            elseif heldy then
                table.insert(str, "Holding: "..(yhelds[heldy].name)..".\n")
            end
		 
		    if getItemAttribute(thing.uid, "nature") then
		        if Natures[getItemAttribute(thing.uid, "nature")] then
			        table.insert(str, "Nature: "..getItemAttribute(thing.uid, "nature")..".\n")
			    end
		    end
		
		    if getItemAttribute(thing.uid, "serial") then
			    table.insert(str, "Serial: "..getItemAttribute(thing.uid, "serial")..".\n")
		    end
		
		
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
            return false
      
        elseif string.find(iname.name, "fainted") or string.find(iname.name, "defeated") then     
            if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
            table.insert(str, ""..string.lower(iname.name)..". ")     
            if isContainer(thing.uid) then
                table.insert(str, "(Vol: "..getContainerCap(thing.uid)..")")
            end
            table.insert(str, "\n")
            if getItemAttribute(thing.uid, "gender") == SEX_MALE then
                table.insert(str, "It is male.")
            elseif getItemAttribute(thing.uid, "gender") == SEX_FEMALE then
                table.insert(str, "It is female.")
            else
                table.insert(str, "")
            end
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
            return false
        elseif isContainer(thing.uid) then     --containers

            if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end

            if iname.name == "dead human" and getItemAttribute(thing.uid, "pName") then
                table.insert(str, "dead human (Vol:"..getContainerCap(thing.uid).."). ")
                table.insert(str, "You recognize ".. getItemAttribute(thing.uid, "pName")..". ".. getItemAttribute(thing.uid, "article").." was killed by a ")
                table.insert(str, getItemAttribute(thing.uid, "attacker")..".")
            else   
                table.insert(str, ""..iname.article.." "..iname.name..". (Vol:"..getContainerCap(thing.uid)..").")
            end
		
            if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
                table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n")  
                local pos = getThingPos(thing.uid)
                table.insert(str, "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]")  
            end
		
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
            return false   
        elseif getItemAttribute(thing.uid, "unico") then    
            local p = getThingPos(thing.uid)
   
            if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
            -- table.insert(str, "You see ")
            if thing.type > 1 then
                table.insert(str, thing.type.." "..iname.plural..".")
            else
                table.insert(str, iname.article.." "..iname.name..".")
            end
            table.insert(str, " It's an unique item.\n"..iname.description)
      
            if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
                table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n")  
                table.insert(str, "\nPosition: ["..p.x.."]["..p.y.."]["..p.z.."]")
            end
   
            sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, table.concat(str))
            return false
        else
            return true
        end
    end

    local npcname = getCreatureName(thing.uid)
    if ehNPC(thing.uid) and NPCBattle[npcname] then    --npcs duel
        table.insert(str, ""..npcname..". "..NPCBattle[npcname].artig.." leader of the gym from "..NPCBattle[npcname].cidbat..".")
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
        return false
    end
	
    if getPlayerStorageValue(thing.uid, 697548) ~= -1 then    
        table.insert(str, getPlayerStorageValue(thing.uid, 697548))                                   
        local pos = getThingPos(thing.uid)
        if youAre[getPlayerGroupId(cid)] then
            table.insert(str, "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]")
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))  
       return false
    end

    if not isPlayer(thing.uid) and not isMonster(thing.uid) then    --outros npcs
        table.insert(str, ""..getCreatureName(thing.uid)..".")
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
        return false
    end

    if isPlayer(thing.uid) then     --player
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getPlayerDesc(cid, thing.uid, false))  
        return false  
    end

    if getCreatureName(thing.uid) == "Evolution" then
	    return false 
	end

    if not isSummon(thing.uid) then   --monstros
        table.insert(str, "wild "..string.lower(getCreatureName(thing.uid))..".\n")
        table.insert(str, "Hit Points: "..getCreatureHealth(thing.uid).." / "..getCreatureMaxHealth(thing.uid)..".\n")
		if getPokemonGender(thing.uid) == SEX_MALE then
            table.insert(str, "")
        elseif getPokemonGender(thing.uid) == SEX_FEMALE then
            table.insert(str, "")
        else
            table.insert(str, "")
        end

        local levelWild = getPlayerStorageValue(thing.uid, 18012)
        table.insert(str, "[Level]: "..levelWild..".\n")
	   
       doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
       return false
    elseif isSummon(thing.uid) and not isPlayer(thing.uid) then  --summons
        local boostlevel = getItemAttribute(getPlayerSlotItem(getCreatureMaster(thing.uid), 8).uid, "boost") or 0
        if getCreatureMaster(thing.uid) == cid then
            local myball = getPlayerSlotItem(cid, 8).uid
            if getItemAttribute(myball, "ehditto") then
                table.insert(str, "your (Ditto) "..string.lower(getCreatureName(thing.uid))..".")
            else
                table.insert(str, "your "..string.lower(getCreatureName(thing.uid))..".")
            end
            if boostlevel > 0 then
                table.insert(str, "\nBoost level: +"..boostlevel..".")
            end
            table.insert(str, "\nHit points: "..getCreatureHealth(thing.uid).."/"..getCreatureMaxHealth(thing.uid)..".")
            -- table.insert(str, "\n"..getPokemonHappinessDescription(thing.uid))
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
        else
            local yball = getPlayerSlotItem(getCreatureMaster(thing.uid), 8).uid
            if getItemAttribute(yball, "ehditto") then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "(Ditto) "..string.lower(getCreatureName(thing.uid))..".\nIt belongs to "..getCreatureName(getCreatureMaster(thing.uid))..".")
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ""..string.lower(getCreatureName(thing.uid))..".\nIt belongs to "..getCreatureName(getCreatureMaster(thing.uid))..".")
            end
        end
        return false
    end
	
    return true
end