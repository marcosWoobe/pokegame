string.split = function (str)
	local t = {}
	return not str:gsub("%w+", function(s) table.insert(t, s) return "" end):find("%S") and t or {}
end

string.trim = function (str)
	return str:gsub("^%s*(.-)%s*$", "%1")
end

string.explode = function (str, sep, limit)
	if(type(sep) ~= 'string' or isInArray({tostring(str):len(), sep:len()}, 0)) then
		return {}
	end

	local i, pos, tmp, t = 0, 1, "", {}
	for s, e in function() return string.find(str, sep, pos) end do
		tmp = str:sub(pos, s - 1):trim()
		if tmp ~= "" then               --alterado v1.8
		   table.insert(t, tmp)
        end
		pos = e + 1

		i = i + 1
		if(limit ~= nil and i == limit) then
			break
		end
	end

	tmp = str:sub(pos):trim()
	if tmp ~= "" then              --alterado v1.8
       table.insert(t, tmp)
    end
	return t
end

string.expand = function (str)
	return string.gsub(str, "$(%w+)", function(n) return _G[n] end)
end

string.timediff = function (diff)
	local format = {
		{"week", diff / 60 / 60 / 24 / 7},
		{"day", diff / 60 / 60 / 24 % 7},
		{"hour", diff / 60 / 60 % 24},
		{"minute", diff / 60 % 60},
		{"second", diff % 60}
	}

	local t = {}
	for k, v in ipairs(format) do
		local d, tmp = math.floor(v[2]), ""
		if(d > 0) then
			tmp = (k < table.maxn(format) and (table.maxn(t) > 0 and ", " or "") or " and ") .. d .. " " .. v[1] .. (d ~= 1 and "s" or "")
			table.insert(t, tmp)
		end
	end

	return table.concat(t)
end

string.concat = function(...)
    local t = {}
    for _, s in pairs({...}) do
        t[#t + 1] = tostring(s)
    end
    return table.concat(t)
end

-- Strip accents from a string
local tableAccents = {["à"] = "a", ["á"] = "a", ["â"] = "a", ["ã"] = "a", ["ä"] = "a", ["ç"] = "c", ["è"] = "e", ["é"] = "e", ["ê"] = "e", ["ë"] = "e", ["ì"] = "i", ["í"] = "i", ["î"] = "i", ["ï"] = "i", ["ñ"] = "n", ["ò"] = "o", ["ó"] = "o", ["ô"] = "o", ["õ"] = "o", ["ö"] = "o", ["ù"] = "u", ["ú"] = "u", ["û"] = "u", ["ü"] = "u", ["ý"] = "y", ["ÿ"] = "y", ["À"] = "A", ["Á"] = "A", ["Â"] = "A", ["Ã"] = "A", ["Ä"] = "A", ["Ç"] = "C", ["È"] = "E", ["É"] = "E", ["Ê"] = "E", ["Ë"] = "E", ["Ì"] = "I", ["Í"] = "I", ["Î"] = "I", ["Ï"] = "I", ["Ñ"] = "N", ["Ò"] = "O", ["Ó"] = "O", ["Ô"] = "O", ["Õ"] = "O", ["Ö"] = "O", ["Ù"] = "U", ["Ú"] = "U", ["Û"] = "U", ["Ü"] = "U", ["Ý"] = "Y"}
function string.stripAccents(str)
	local normalizedString = ""
	for strChar in str:gmatch"." do --for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if tableAccents[strChar] ~= nil then
			normalizedString = normalizedString .. tableAccents[strChar]
		else
			normalizedString = normalizedString .. strChar
		end
	end
	return normalizedString
end