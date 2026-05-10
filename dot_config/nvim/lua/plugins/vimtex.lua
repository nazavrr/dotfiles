local os = require("config.os")

return {
    {
        "lervag/vimtex",
        enabled = os.IS_LINUX,
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                    "-shell-escape",
                },
            }
            vim.g.vimtex_quickfix_open_on_warning = 0

            vim.keymap.set("n", "<localleader>lt", "<Plug>(vimtex-toc-toggle)")
        end,
    },
    {
        "lyokha/vim-xkbswitch",
        enabled = os.IS_LINUX,
        lazy = false,
        init = function()
            vim.g.XkbSwitchEnabled = 1
        end,
    },
}
