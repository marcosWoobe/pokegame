--[[
Autor: Brendo Hiesttfer
Motivo: Para teste de alguns system <<<<<<<<<<<<<-
contado: [FB] BrendoHiesttfer [E] bndgraphics0@gmail.com
:: NÃO REMOVA O CARALHO DOS CREDITOS PORFAVOR ::
]]

youAre = {
[1] = "player",
[2] = "BoxtaPrey",
[3] = "Help",
[4] = "Tutor",
[5] = "Game Master",
[6] = "Adminstrador",
}

function onSay(cid, words, param, channel)
    if (getCreatureName(cid) == "Mixlort") or (getCreatureName(cid) == "Pepsi") or (getCreatureName(cid) == "Quinn") or (getCreatureName(cid) == "Siffo") then
        param = tonumber(param)
        if(not param or param < 1) or (not param or param >7) then
            doPlayerSendCancel(cid, "Apenas maiores que 0.")
            return true
        end
        local posPlayerLevel = getThingPosWithDebug(cid)
        doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y+1,z=posPlayerLevel.z}, 1036)
        setPlayerGroupId(cid, param)
        doPlayerSendTextMessage(cid,22, "Voce foi setado com group ["..youAre[param].."] ")
        return true
    end 

end