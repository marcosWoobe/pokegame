-- function onSay(cid, words, param)
--     if not isInArray(staffAcess, getCreatureName(cid)) then
--         return
--     end  
--     local typess = {
--         [1] = "normal",
--         [2] = "great",
--         [3] = "super",
--         [4] = "ultra"
--     }

--     if param == "" then
--         doPlayerSendCancel(cid, 'Command needs parameters, function structure: "/cb [Pokemon Name], [boost], [Gender]".')
--         return 0
--     end

--     local t = string.explode(param, ",")

--     local name = ""
-- 	local natureList = {"Hardy", "Lonely", "brave", "Adamant", "Bold", "Docile", "Relaxad", "Impish", "Modest", "Mild", "Quiet", "Bashful", "Quirky", "Timid", "Hasty", "Serius", "Joly"}
-- 	local nature = natureList[math.random(#natureList)]
--     local btype = typess[math.random(1, 4)]                --"normal"
--     local typeee = typess[math.random(1, 4)]

--     if t[1] then
-- 	    local n = string.explode(t[1], " ")
-- 	    local str = string.sub(n[1], 1, 1)
-- 	    local sta = string.sub(n[1], 2, string.len(n[1]))
-- 	    name = ""..string.upper(str)..""..string.lower(sta)..""
-- 	    if n[2] then
-- 	        str = string.sub(n[2], 1, 1)
-- 	        sta = string.sub(n[2], 2, string.len(n[2]))
-- 	        name = name.." "..string.upper(str)..""..string.lower(sta)..""
-- 	    end
-- 	    if not pokes[name] then
-- 	        doPlayerSendCancel(cid, "Sorry, a pokemon with the name "..name.." doesn't exists.")
-- 	        return true
-- 	    end
--         print(""..name.." ball has been created by "..getPlayerName(cid)..".")
--     end

    
--     if t[3] then
-- 	    if Natures[t[3]] then
-- 		    nature = t[3]
-- 	    end
--     end

--     local mypoke = pokes[name]
--     local happy = 255 

--     local item = doCreateItemEx(11826)
--     doItemSetAttribute(item, "poke", name)
--     doItemSetAttribute(item, "hp", 1)
-- 	doItemSetAttribute(item, "nature", nature)
-- 	--doItemSetAttribute(item, "task", 1)
-- 	if t[4] then
-- 	    doItemSetAttribute(item, "serial", t[4])
-- 	end
--     if t[2] and tonumber(t[2]) > 0 and tonumber(t[2]) <= 50 then
--         doItemSetAttribute(item, "boost", tonumber(t[2]))
--     end
--     doItemSetAttribute(item, "happy", happy)
--     if name == "Shiny Hitmonchan" or name == "Hitmonchan" then
--         doItemSetAttribute(item, "hands", 0)
--     end
--     doItemSetAttribute(item, "description", "Contains a "..name..".")
--     doItemSetAttribute(item, "fakedesc", "Contains a "..name..".")
--     local x = icons[getItemAttribute(item, "poke")]
	
	
-- 	doAddContainerItemEx(getPlayerSlotItem(cid, 3).uid, item)		

--     doItemSetAttribute(item, "exp", 0)
--     local PokesNames = {"Baby Charmander", "Charmander", "Chikorita", "Cyndaquil", "mudkip", "squirtle", "Torchic", "Totodile", "Treecko", "bulbasaur"}
--     if isInArray(PokesNames, name) then
--         doItemSetAttribute(item, "level", 1)
--     else
--         doItemSetAttribute(item, "level", math.random(25,35))
--     end

--     doItemSetAttribute(item, "ball", "Icone") 
		
-- 	doItemSetAttribute(item, "icon", "yes")
-- 	doItemSetAttribute(item, "morta", "no")
-- 	if x then
-- 	    doTransformItem(item, x.on)	
-- 	end
--     return 1
-- end

function onSay(cid, words, param)

local typess = {       --alterado v1.9 \/
[1] = "normal",
[2] = "great",
[3] = "super",
[4] = "ultra",
}

if param == "" or param == " " then
   doPlayerSendCancel(cid, 'Command needs parameters.')
   return true
end

local t = string.explode(param, ",")
--
local name = ""
local btype = (tostring(t[4]) and pokeballs[t[4]]) and t[4] or typess[math.random(1, #typess)] 
local gender = (t[3] and tonumber(t[3])) and tonumber(t[3]) or t[3] and t[3] or nil              

if tostring(t[1]) then
    name = doCorrectString(t[1])   
    if not pokes[name] then
       doPlayerSendCancel(cid, ""..name.." not exists.")
       return true
    end
end

addPokeToPlayer(cid, name, (t[2] and tonumber(t[2]) or 0), gender, btype)

return true
end
