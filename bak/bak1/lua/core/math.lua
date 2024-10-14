---@diagnostic disable: lowercase-global

-- math-related functions

inf = math.huge

-- convert binary string to number
function math.bin(n)
  return tonumber(n, 2)
end

-- convert octal string to number
function math.oct(n)
	return tonumber(n, 8)
end

-- convert hex string to number
function math.hex(n)
  return tonumber(n, 16)
end

-- degree-based trig:
-- dcos dsin dtan dacos dasin datan
for _,v in ipairs({ "cos", "sin", "tan", "tan2" }) do
	math["d"..v] = function(r) return math[v](math.rad(r)) end
	math["da"..v] = function(r) return math.deg(math["a"..v](r)) end
end
math.dtan2 = nil

function math.bound(n, min, max)
  return math.max(
    math.min(n, max),
    min)
end

local mt = {}
debug.setmetatable(0, mt)
mt.__index = math
