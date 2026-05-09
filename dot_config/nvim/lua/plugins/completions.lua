local os = require("config.os")

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    check_ts = true,
                    fast_wrap = {},
                },
            },
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            { "micangl/cmp-vimtex", enabled = os.IS_LINUX },
            "onsails/lspkind.nvim",
        },
        config = function()
            require("config.completions")
        end,
    },
}
