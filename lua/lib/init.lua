return setmetatable({}, {
  __index = function(self, key)
    local ok, mod = pcall(require, ("lib.%s"):format(key))
    if ok then
      return mod
    else
      return nil
    end
  end
})
