-- so you can s:tonumber()
string.tonumber = tonumber

-- python-style string formatting with %
getmetatable("").__mod = function(lhs, rhs)
  if type(rhs) == "table" then
      return lhs:format(unpack(rhs))
  else
      return lhs:gsub('%%', '%%%%'):gsub('%%%%', '%%', 1):format(rhs)
  end
end

-- string... split(string, pattern. max) - break up string on pattern
-- default value for pattern is to split on whitespace
-- default value for max is infinity
function string.split(s, pat, max)
	pat = pat or "%s+"
	max = max or nil
	local count = 0
	local i = 1
	local result = { 1 }

	local function splitter(sof, eof)
		result[#result] = s:sub(result[#result], sof-1)
		result[#result+1] = eof
	end

	if pat == "" then return s end

	s:gsub("()"..pat.."()", splitter, max)

	result[#result] = s:sub(result[#result], #s)

	return unpack(result)
end


-- string trim(string) - remove whitespace from start and end
function string.trim(s)
	return s:gsub('^%s*', ''):gsub('%s*$', '')
end

-- string join(seperator, ...) - concatenate strings
function string.join(joiner, ...)
	return table.concat({...}, joiner)
end

-- rfind - as string.find() only backwards
function string.rfind (s, pattern, rinit, plain)
	s = s:sub(1, rinit)

	local old_R = {}
	local R = { s:find(pattern, 1, plain) }

	while true do
		if R[1] == nil then return unpack(old_R) end
		old_R,R = R,{ s:find(pattern, R[2]+1) }
	end
end

-- count - count the number of occurences of a regex
function string.count(s, pattern)
	local count = 0
	for match in s:gmatch(pattern) do
		count = count+1
	end
	return count
end

-- string.interpolate - take a string with ${...} interpolation expressions in it,
-- and a table of stuff to resolve them in terms of
function string:interpolate(data)
	local function do_interp(keyfmt)
		keyfmt = keyfmt:sub(2,-2)
		local key,format = keyfmt:match('^(.*)|([^|]+)')
		if not key then key,format = keyfmt,nil end

		key = key:interpolate(data)
		local value = data[key]
		if format then
			return string.format(format, value)
		else
			return tostring(value)
		end
	end

	local count
	repeat
		self,count = self:gsub('%$(%b{})', do_interp)
	until count == 0

	return self
end

-- Cut string into lines of no more than n characters, splitting on whitespace
-- and hyphens. Force split on newline.
function string:wrap(n)
	local buf = {}
	local line = ''
	self = self:trim()

	for ws,word in self:gmatch('(%s*)([^%s-]*%-*)') do
		if #line + #ws + #word > n or ws:match('\n') then
			if #line > 0 then
				table.insert(buf, line)
			end
			line = word
		else
			line = line .. ws .. word
		end
	end
	if #line > 0 then
		table.insert(buf, line)
	end
	return buf
end
