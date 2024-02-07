function onTimer()

	setGlobalStorageValue(655453,1)
	doBroadcastMessageOld("[Evento Bag]: O Evento bag Esta Ativo por 15 segundos, use o comando !eventobag para participar", 21)
	doSendCustomBroadcastMessage("[Evento Bag]: O Evento bag Esta Ativo por 15 segundos, use o comando !eventobag para participar", "#ffbb00", "images/broadcast/event", 2000, 0.8)

	addEvent(function()
		setGlobalStorageValue(655453,0)
		doBroadcastMessageOld("[Evento Bag]: O evento finalizou", 21)
		doSendCustomBroadcastMessage("[Evento Bag]: O evento finalizou", "#ffbb00", "images/broadcast/event", 2500, 0.8)
	end,15000)

	return true
end