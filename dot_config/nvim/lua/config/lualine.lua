-- Example of a custom filename component with an icon:
-- local fname_with_icon = require("lualine.components.filename"):extend()
-- fname_with_icon.apply_icon = require("lualine.components.filetype").apply_icon
-- fname_with_icon.icon_hl_cache = {} -- Will throw an error without this
--
-- Use it like:
-- lualine_b = { { fname_with_icon, newfile_status = true, colored = true, path = 1 } },

require("lualine").setup({
    options = {
        theme = "gruvbox",
        component_separators = { left = "|", right = "|" },
        section_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "filetype", colored = true, icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", newfile_status = true, path = 1 },
        },
        lualine_c = { "branch", "diff" },
        lualine_x = {
            {
                "diagnostics",
                symbols = { error = "󰅙 ", warn = " ", info = " ", hint = " " },
                update_in_insert = true,
            },
        },
        lualine_y = { "encoding" },
        lualine_z = { "progress", "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { "filetype", colored = false, icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", newfile_status = true, path = 1 },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "oil" },
})
