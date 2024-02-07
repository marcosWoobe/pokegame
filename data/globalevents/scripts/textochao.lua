local config = {
    positions = {
        ["Eventos"] = { x = 1034, y = 1018, z = 7}, 
 	["Duel"] = { x = 572, y = 582, z = 12}, 
	["Bag"] = { x = 576, y = 582, z = 12},  
	["JogoDaVelha"] = { x = 580, y = 582, z = 12},
	["Invasão"] = { x = 584, y = 582, z = 12},
	["Saida"] = { x = 571, y = 586, z = 12},,      

    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  