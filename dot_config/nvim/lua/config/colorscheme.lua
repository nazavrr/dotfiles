local gruvbox_theme = require("gruvbox")
local bg = gruvbox_theme.palette.dark0

gruvbox_theme.setup({
    italic = {
        strings = false,
    },
    overrides = {
        SignColumn = { bg = bg },
        GruvboxRedSign = { bg = bg },
        GruvboxYellowSign = { bg = bg },
        GruvboxBlueSign = { bg = bg },
        GruvboxAquaSign = { bg = bg },
        DiagnosticFloatingWarn = { link = "GruvboxYellow" },
        LspReferenceRead = { link = "Visual" },
        LspReferenceText = { link = "Visual" },
        LspReferenceWrite = { link = "Visual" },
        NormalFloat = { link = "Normal" },
        TelescopeSelectionCaret = { link = "GruvboxOrange" },
        TelescopePromptPrefix = { link = "GruvboxOrange" },
    },
})
vim.cmd("colorscheme gruvbox")
