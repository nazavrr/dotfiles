---@module 'lazy'
---@type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "main",
        config = function()
            require("config.treesitter")
        end,
    },
}
