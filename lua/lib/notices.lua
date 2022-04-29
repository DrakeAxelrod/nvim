local M = {}

M.packer = {
    wait = {
        msg = function()
            return "Please wait ... \nDownloading packer ..."
        end,
        lvl = "info",
        opts = {
            title = "Packer"
        }
    }
}



return M
