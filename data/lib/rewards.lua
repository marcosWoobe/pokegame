
	DailyRewards = {}
	
	DailyRewards.opcode = 247
	
	DailyRewards.actions = {
		open  = 1,
		get   = 2,
		timer = 3,
		data  = 4,
	}
	
	DailyRewards.config = {
		timerOn   =  1 * 60 * 60, -- 1 hour, set up time online
		timerWait =  5 * 60,      -- 5 minutes, set timeout
		
		rewards = {2392, 2393, 2391, 2394, 12344, 12343, 12345, 12346, 12347, 11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450, 23418, 23462} -- itemid of items to be won
	}
	
	DailyRewards.storages = {
		timer = 91240,
		wait  = 91241,
		day   = 91242,
		month = 91243
	}
	
	DailyRewards.messages = {
		reward = "You just won %sx %s.",
		depot  = "[Daily Reward]: You don't have enough space in your backpack, so your prize will be going to the depot.",
	}
	
	function DailyRewards:getDay()
		return tonumber(os.date('%d'))
	end
	
	function DailyRewards:getMonth()
		return tonumber(os.date('%m'))
	end
	
	function DailyRewards:getYear()
		return tonumber(os.date('%Y'))
	end
	
	function DailyRewards:isLeapYear(year)
		return year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)
	end
	
	function DailyRewards:getAmountDayOfMonth(month, year)
		local day = 31
		if ( month == 2 ) then
			day = self:isLeapYear(year) and 29 or 28
		elseif ( month == 4 or month == 6 or month == 9 or month == 11 ) then
			day = day - 1    
		end
		return day
	end
	
	function DailyRewards:setTime(cid)
		setPlayerStorageValue(cid, self.storages.timer, os.time())
	end
	
	function DailyRewards:getTime(cid)
		return getPlayerStorageValue(cid, self.storages.timer)
	end
	
	function DailyRewards:setTimeWait(cid)
		setPlayerStorageValue(cid, self.storages.wait, os.time())
	end
	
	function DailyRewards:getTimeWait(cid)
		return os.time() - getPlayerStorageValue(cid, self.storages.wait)
	end
	
	function DailyRewards:selectDaily(cid)
		local day    = self:getDay()
		local timer  = (os.time() - self:getTime(cid))
		local reward = self:getRewards(cid)

		if ( reward[day] == "0" and timer >= self.config.timerOn ) then
			itemidDaily = self.config.rewards[math.random(1, #self.config.rewards)]

			if itemidDaily == 2392 then
				countDaily  = 15
			elseif itemidDaily == 2393 then
				countDaily  = 20
			elseif itemidDaily == 2391 then
				countDaily  = 25
			elseif itemidDaily == 2394 then
				countDaily  = 30
			elseif itemidDaily == 12344 then
				countDaily  = 15
			elseif itemidDaily == 12343 then
				countDaily  = 25 
			elseif itemidDaily == 12345 then
				countDaily  = 30
			elseif itemidDaily == 12346 then
				countDaily  = 35      
			elseif itemidDaily == 12347 then
				countDaily  = 40
			elseif itemidDaily == 23418 then
				countDaily  = 15
			else
				countDaily  = 1
			end  
						
			local messageReward = self.messages.reward:format(tostring(countDaily), getItemNameById(itemidDaily))
			if ( hasSpaceInContainer(getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid) ) then
				doPlayerAddItem(cid, itemidDaily, countDaily)
			else
				local item = doCreateItemEx(itemidDaily, countDaily)
				doPlayerSendMailByName(getCreatureName(cid), item, getPlayerTown(cid))
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, self.messages.depot)
			end
			
			reward[day] = "1"			
			self:setRewards(cid, reward)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, messageReward)
		end
	end
		
	function DailyRewards:resetDailyRewards(cid)
		local day = {}
		for i = 1, self:getAmountDayOfMonth(self:getMonth(), self:getYear()) do
			day[#day + 1] = 0
		end
		self:setRewards(cid, day)
	end
	
	function DailyRewards:setRewards(cid, day)
		setPlayerStorageValue(cid, self.storages.day, table.concat(day, ','))
	end
	
	function DailyRewards:getRewards(cid)
		local month = tonumber(getPlayerStorageValue(cid, self.storages.month))
		
		if ( month ~= self:getMonth() ) then
			self:resetDailyRewards(cid)
			setPlayerStorageValue(cid, self.storages.month, self:getMonth())
		end
		
		return getPlayerStorageValue(cid, self.storages.day):explode(',')
	end
	
	function DailyRewards:sendDaily(cid)		
		local day = {}
		local reward = self:getRewards(cid)
		
		for i = 1, self:getDay() do
			day[#day + 1] = reward[i]
		end
		
		self:sendAction(cid, self.actions.open, table.concat(day, ','))
	end
	
	function DailyRewards:sendDate(cid)
		self:sendAction(cid, self.actions.data, string.format('%s|%s|%s', self:getDay(), self:getMonth(), self:getYear()))
	end
	
	function DailyRewards:sendTimer(cid)
		self:sendAction(cid, self.actions.timer, self:getTime(cid))
	end
		
	function DailyRewards:sendAction(cid, action, data)
		doSendPlayerExtendedOpcode(cid, self.opcode, action..'|'..data)
	end
	
	function DailyRewards:action(cid, action)
		if ( action == self.actions.open ) then
			self:sendDate(cid)
			self:sendTimer(cid)
			self:sendDaily(cid)
		elseif ( action == self.actions.get ) then
			self:selectDaily(cid)
		end
	end
	
	