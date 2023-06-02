local M = {}

local function setup_plugin()
    require("flit").setup({
        keys = {
            f = "f",
            F = "F",
            t = "t",
            T = "T"
        },
        labeled_modes = "nvo",
        multiline = false,
        opts = {}
    })
end

function M.config()
    setup_plugin()
end

return M
