function onSay(cid, words, param)

if param == "" then return true end
	name = doCorrectString(param)
	if not pokes[name] then return true end
	poke = pokes[name]
	if not poke.number then
		number = "000"
	else		
		number = poke.number
	end
	if poke.type2 ~= "no type" then
		tipo = "Type: "..string.upper(poke.type).."/"..string.upper(poke.type2)..""
	else
		tipo = "Type: "..string.upper(poke.type)..""
	end
	off = math.floor(poke.offense * poke.level)
	def = math.floor(poke.defense)
	spc = math.floor(poke.specialattack * poke.level)
	vit = math.floor(poke.vitality * poke.level)
	spd = math.floor(poke.agility)
	
ability = 0
textAb = ""
for b, c in pairs(specialabilities) do
   if isInArray({"fly", "ride", "surf", "teleport", "rock smash", "cut", "dig", "light", "blink", "control mind", "transform", "headbutt"}, b) then
      if isInArray(c, name) then
         textAb = textAb..""..doCorrectString(b).." "
		 ability = ability + 1
      end
   end
end
	if isInArray(darkPortalList, name) then
		if string.find(stt, "Blink") then
			textAb = string.gsub(textAb, "Blink", "Dark Portal")
			ability = ability + 1
		end
	end
	if isInArray(levitateFlyList, name) then
		if string.find(stt, "Fly") then
			textAb = string.gsub(textAb, "Fly", "Levitate")
			ability = ability + 1
		end
	end
	if ability == 0 then
	textAb = "None"
	end
	
	evolution = ""
	if poke.evoluDex then
	if poke.evoluDex.evo1 then
	evolution = poke.evoluDex.evo1.." requires level "..pokes[poke.evoluDex.evo1].level.."\n"
	end
	if poke.evoluDex.evo2 then
	evolution = evolution..""..poke.evoluDex.evo2.." requires level "..pokes[poke.evoluDex.evo2].level.."\n"
	end
	if poke.evoluDex.evo3 then
	evolution = evolution..""..poke.evoluDex.evo3.." requires level "..pokes[poke.evoluDex.evo3].level.."\n"
	end
	else
	evolution = name.." requires level "..poke.level.."\n"
	end
	move = movestable[name]
	if move.move1 then
	m1 = move.move1.name.." - m1 - "..move.move1.t..""
	else
	m1 = " "
	end
	if move.move2 then
	m2 = move.move2.name.." - m2 - "..move.move2.t..""
	else
	m2 = " "
	end
	if move.move3 then
	m3 = move.move3.name.." - m3 - "..move.move3.t..""
	else
	m3 = " "
	end
	if move.move4 then
	m4 = move.move4.name.." - m4 - "..move.move4.t..""
	else
	m4 = " "
	end
	if move.move5 then
	m5 = move.move5.name.." - m5 - "..move.move5.t..""
	else
	m5 = " "
	end
	if move.move6 then
	m6 = move.move1.name.." - m6 - "..move.move6.t..""
	else
	m6 = " "
	end
	if move.move7 then
	m7 = move.move7.name.." - m7 - "..move.move7.t..""
	else
	m7 = " "
	end
	if move.move8 then
	m8 = move.move1.name.." - m8 - "..move.move8.t..""
	else
	m8 = " "
	end
	if move.move9 then
	m9 = move.move9.name.." - m9 - "..move.move9.t..""
	else
	m9 = " "
	end
	if move.move10 then
	m10 = move.move10.name.." - m10 - "..move.move10.t..""
	else
	m10 = " "
	end
	if move.move11 then
	m11 = move.move11.name.." - m11 - "..move.move11.t..""
	else
	m11 = " "
	end
	if move.move12 then
	m12 = move.move12.name.." - m12 - "..move.move12.t..""
	else
	m12 = " "
	end
	if move.passive1 then
	p1 = move.passive1.name.." - passive - "..move.passive1.t..""
	else
	p1 = " "
	end
	if move.passive2 then
	p2 = move.passive2.name.." - passive - "..move.passive2.t..""
	else
	p2 = " "
	end
	if move.passive3 then
	p3 = move.passive3.name.." - passive - "..move.passive3.t..""
	else
	p3 = " "
	end
	doPlayerSendCancel(cid, "#pokedex#,"..name..","..number..","..tipo..","..poke.level..","..off..","..def..","..spc..","..vit..","..spd..","..textAb..","..evolution..","..m1..","..m2..","..m3..","..m4..","..m5..","..m6..","..m7..","..m8..","..m9..","..m10..","..m11..","..m12..","..p1..","..p2..","..p3..",")
return true
end