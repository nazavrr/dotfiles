--[[
    - `nvim-lspconfig` - This plugin provides default configurations for the language servers (i.e. it tells nvim how to start a specific language server)
    - `mason.nvim` - This plugin provides an easy way to manage external editor tooling. However, it only implements the TUI and a set of APIs, so no automatic installation out of the box.
    - `mason-tool-installer.nvim` - This plugin uses `mason.nvim` APIs to automatically install and update external tools, allowing me to keep their spec in code
    - `mason-lspconfig` - This plugin automatically enables (via `vim.lsp.enable()`) all language servers installed by `mason-tool-installer.nvim` as well as provides conversion
        between `mason.nvim` and `nvim-lspconfig` names (i.e. allows me to specify `nvim-lspconfig` names in `ensure-installed` argument of `mason-tool-installer.nvim`)
--]]

local ensure_installed = {
    -- Language Servers
    "lua_ls",
    "basedpyright",

    -- Formatters
    "ruff",
    "stylua",
}

require("mason").setup({
    ui = {
        border = "rounded",
        backdrop = 100,
        icons = {
            package_installed = "󰄬",
            package_pending = "󰔟",
            package_uninstalled = "󰅖",
        },
    },
})
require("mason-tool-installer").setup({
    ensure_installed = ensure_installed,
    auto_update = true,
    run_on_start = true,
    start_delay = 1000,
    debounce_hours = 6,
})

vim.api.nvim_create_autocmd("User", {
    desc = "Open Mason when there are tools to install/update",
    group = vim.api.nvim_create_augroup("mtu-open-mason-before-install", { clear = true }),
    pattern = "MasonToolsStartingInstall",
    command = "Mason",
})

-- Obtain default capabilities and extend them via cmp-nvim-lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

require("mason-lspconfig").setup()
