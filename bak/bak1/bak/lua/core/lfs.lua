local windows = package.config:sub(1, 1) == "\\"

-- We make the simplifying assumption in these functions that path separators
-- are always forward slashes. This is true on *nix and *should* be true on
-- windows, but you can never tell what a user will put into a config file
-- somewhere. This function enforces this.
function lfs.normalize(path)
  if windows then
    return (path:gsub("\\", "/"))
  else
    return path
  end
end

local _attributes = lfs.attributes
function lfs.attributes(path, ...)
  path = lfs.normalize(path)
  if windows then
    -- Windows stat() is kind of awful. If the path has a trailing slash, it
    -- will always fail. Except on drive root directories, which *require* a
    -- trailing slash. Thankfully, appending a "." will always work if the
    -- target is a directory; and if it's not, failing on paths with trailing
    -- slashes is consistent with other OSes.
    path = path:gsub("/$", "/.")
  end

  return _attributes(path, ...)
end

function lfs.exists(path)
  return lfs.attributes(path, "mode") ~= nil
end

function lfs.dirname(oldpath)
  local path = lfs.normalize(oldpath):gsub("[^/]+/*$", "")
  if path == "" then
    return oldpath
  end
  return path
end

-- Recursive directory creation a la mkdir -p. Unlike lfs.mkdir, this will
-- create missing intermediate directories, and will not fail if the
-- destination directory already exists.
-- It assumes that the directory separator is '/' and that the path is valid
-- for the OS it's running on, e.g. no trailing slashes on windows -- it's up
-- to the caller to ensure this!
function lfs.rmkdir(path)
  path = lfs.normalize(path)
  if lfs.exists(path) then
    return true
  end
  if lfs.dirname(path) == path then
    -- We're being asked to create the root directory!
    return nil, "mkdir: unable to create root directory"
  end
  local r, err = lfs.rmkdir(lfs.dirname(path))
  if not r then
    return nil, err .. " (creating " .. path .. ")"
  end
  return lfs.mkdir(path)
end
