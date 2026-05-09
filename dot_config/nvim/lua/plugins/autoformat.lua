return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "[F]ormat Buffer",
            },
        },
        opts = {
            formatters_by_ft = { lua = { "stylua" } },
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = function(bufnr)
                -- Enable with a global or buffer-local variable
                if vim.g.enable_autoformat or vim.b[bufnr].enable_autoformat then
                    return { timeout_ms = 500 }
                end
            end,
        },
    },
}
