local heldTable = {
15593,
15565,
15635,
15607,
15628,
15579,
13982,
17452,
17445,
13989,
15600,
13968,
15586,
15642,
15614,
13996,
17625,
17626,
15572,
15621,
13947,
17415,
17422,
17429,
17408,
17432,
17431,
17430,
15643,
17433,
17435,
17436,
17437

}


function onUse(cid, item, frompos, item2, topos)

    local heldId = math.random(#heldTable)
	doPlayerAddItem(cid, heldTable[heldId], 1)
    doRemoveItem(item.uid, 1)
    doSendMagicEffect(getThingPos(cid), 14)
    sendMsgToPlayer(cid, 27, "Voce adquiriu um "..getItemNameById(heldTable[heldId])..".")
    return true
end