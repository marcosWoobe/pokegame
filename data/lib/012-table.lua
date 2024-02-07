table.find = function (table, value)
	for i, v in pairs(table) do
		if(v == value) then
			return i
		end
	end

	return nil
end

table.contains = function (txt, str)
	for i, v in pairs(str) do
		if(txt:find(v) and not txt:find('(%w+)' .. v) and not txt:find(v .. '(%w+)')) then
			return true
		end
	end

	return false
end
table.isStrIn = table.contains

table.count = function (table, item)
	local count = 0
	for i, n in pairs(table) do
		if(item == n) then
			count = count + 1
		end
	end

	return count
end
table.countElements = table.count

table.getCombinations = function (table, num)
	local a, number, select, newlist = {}, #table, num, {}
	for i = 1, select do
		a[#a + 1] = i
	end

	local newthing = {}
	while(true) do
		local newrow = {}
		for i = 1, select do
			newrow[#newrow + 1] = table[a[i]]
		end

		newlist[#newlist + 1] = newrow
		i = select
		while(a[i] == (number - select + i)) do
			i = i - 1
		end

		if(i < 1) then
			break
		end

		a[i] = a[i] + 1
		for j = i, select do
			a[j] = a[i] + j - i
		end
	end

	return newlist
end

table.randomRemove = function(t)
    local k = math.random(1, #t)
    local v = t[k]
    table.remove(t, k)
    return v
end

function table_concat(...)
    local t = {}
    for n = 1,select("#",...) do
        local arg = select(n,...)
        if type(arg)=="table" then
            for _,v in ipairs(arg) do
                t[#t+1] = v
            end
        else
            t[#t+1] = arg
        end
    end
    return t
end

table.random = function(t)
	return t[math.random(1, #t)]
end

table.serialize = function(x, recur)
  local t = type(x)
  recur = recur or {}

  if t == nil then
    return "nil"
  elseif t == "string" then
	return string.format("%q", x)
  elseif t == "number" then
	return tostring(x)
  elseif t == "boolean" then
	return t and "true" or "false"
  elseif getmetatable(x) then
	error("Can not serialize a table that has a metatable associated with it.")
  elseif t == "table" then
    if(table.find(recur, x)) then
	  error("Can not serialize recursive tables.")
	end
	table.insert(recur, x)

	local s = "{"
	for k, v in pairs(x) do
	  s = s .. "[" .. table.serialize(k, recur) .. "]"
	  s = s .. " = " .. table.serialize(v, recur) .. ","
	end
	s = s .. "}"
	return s
  else
	error("Can not serialize value of type '" .. t .. "'.")
  end
end