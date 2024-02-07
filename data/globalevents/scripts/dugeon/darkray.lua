local function msgDarkray(timeS)
    if timeS <= 0 then
        doBroadcastMessage("O Darkray foi embora!")
        return true
    end
    doBroadcastMessage("O Darkray irá sumir em "..timeS.." minutos!")
    addEvent(msgDarkray, 5*60*1000, timeS-5) 
end
function onTimer()
    local timeDarkray = 60
    local pos = {
        {x = 465, y = 1451, z = 7},
        {x = 1036, y = 1705, z = 6},
        {x = 1504, y = 1129, z = 10},
        {x = 749, y = 281, z = 7},
        {x = 405, y = 934, z = 8},
        {x = 871, y = 147, z = 7},
        {x = 759, y = 1644, z = 8},
        {x = 1661, y = 620, z = 5},
        {x = 1689, y = 1322, z = 5},
        {x = 1293, y = 1035, z = 8},
    }
    --local posDarkray = math.random(#pos)
    local uid = doCreateNpc("Darkray", pos[math.random(#pos)], false)
    addEvent(doRemoveCreature, timeDarkray*60*1000, uid)  
    doBroadcastMessage("O Darkray Apareceu, corra ele irá sumir em 1 hora!")
    addEvent(msgDarkray, 5*60*1000, 55)
    return true
end