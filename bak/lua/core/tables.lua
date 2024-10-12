-- new functions related to tables
-- functions that handle tables-as-lists go in list.lua

-- tprint - recursively display the contents of a table
-- does not generate something the terp can read; use table.dump() for that
function table.tostring(T)
	local buf = {}
	assert(T, "bad argument to table.print")
	local done = {}
	local function tstr(T, prefix)
		for k,v in pairs(T) do
			table.insert(buf, prefix..tostring(k)..'\t=\t'..tostring(v))
			if type(v) == 'table' then
				if not done[v] then
					done[v] = true
					tstr(v, prefix.."  ")
				end
			end
		end
	end
	done[T] = true
	tstr(T, "")
	return table.concat(buf, "\n")
end

function table.print(T)
	return print(table.tostring(T))
end

-- shallow-merge src into dst, with configurable duplicate-key semantics
function table.merge(dst, src, dupes)
	dupes = dupes or "overwrite"
	for k,v in pairs(src) do
		if dst[k] == nil or dupes == "overwrite" then
			dst[k] = v
		elseif dupes == "ignore" then
			-- pass
		elseif dupes == "error" then
			error("Duplicate key '"..tostring(k).."' while merging tables")
		else
			error("Unknown duplicate key resolution mode '"..tostring(dupes).."'")
		end
	end
	return dst
end

-- dump Lua code which, when loaded and called, returns a copy
-- of the table passed to table.dump
-- analogous to string.dump() on functions
function table.dump(T)
	local dump = "local loadstring = loadstring\nsetfenv(1, {})\n\n"
	local ref = {}
	local ref_n = 0

	local getref

	local function append_table(T)
		ref[T] = "table_ref_"..ref_n
		ref_n = ref_n + 1

		local S = string.format("%s = {\n", ref[T])
		for k,v in pairs(T) do
			k,v = getref(k),getref(v)
			if k and v then
				S = S..string.format("\t[%s] = %s;\n", k, v)
			end
		end

		dump = dump..S.."}\n\n"
	end

	function getref(v)
		if ref[v] then return ref[v] end

		local t = type(v)
		local mt = getmetatable(v)
		if mt and mt.__repr then
			return mt.__repr(v)
		elseif t == 'nil'
			or t == 'boolean'
			or t == 'number'
		then
			return tostring(v)
		elseif t == 'string' then
			return string.format("%q", v)
		elseif t == 'function' then
			ref[v] = tostring(v):gsub("function: ", "func_")
			dump = dump..string.format("%s = assert(loadstring(%q, 'table.dump function serializer'))\n\n",
				ref[v], string.dump(v))
			return ref[v]
		elseif t == 'table' then
			append_table(v)
			return ref[v]
		else
			return nil
		end
	end

	append_table(T)
	return dump.."return "..getref(T)
end


-- return a possibly-deep copy of the given table
-- metatables are not copied, references are resolved
-- appropriately
-- depth 0 simply returns the same table, depth 1 is
-- a shallow copy, etc
-- the default value for depth is infinity
function table.copy(from, depth)
	ref = {}
	depth = depth or math.huge

	local function tcopy(from, depth)
		local function getref(v)
			if type(v) ~= 'table' then
				return v
			elseif not ref[v] then
				ref[v] = tcopy(v, depth-1)
			end
			return ref[v]
		end

		if depth <= 0 then
			return from
		end

		local to = {}
		ref[from] = to

		for k,v in pairs(from) do
			to[getref(k)] = getref(v)
		end

		return to
	end

	return tcopy(from, depth)
end

-- map over keys
-- if multiple calls return the same key the result is undefined
function table.mapk(t, f)
	local tprime = {}
	for k,v in pairs(t) do
		tprime[f(k)] = v
	end
	return tprime
end

-- map over values
function table.mapv(t, f)
	local tprime = {}
	for k,v in pairs(t) do
		tprime[k] = f(v)
	end
	return tprime
end

-- map over keys and values
function table.mapkv(t, f)
	local tprime = {}
	for k,v in pairs(t) do
		k,v = f(k,v)
		tprime[k] = v
	end
	return tprime
end

-- map over table as list
function table.map(t, f)
	local tprime = {}
	for i,v in ipairs(t) do
		tprime[i] = f(v)
	end
	return tprime
end

-- Return a list of table keys in unspecified order
function table.keys(t)
	local r = {}
	for k in pairs(t) do r[#r+1] = k end
	return r
end
