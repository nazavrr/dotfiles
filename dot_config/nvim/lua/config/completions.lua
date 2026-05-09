local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

luasnip.config.setup({})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        -- Scroll the documentation window [b]ack / [f]orward
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Manually trigger a completion from nvim-cmp.
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { "i", "s" }),
    }),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { autocomplete = false },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                lazydev = "[NvimLua]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                path = "[Path]",
                buffer = "[Buffer]",
                vimtex = "[VimTex]",
            },
        }),
    },
    sources = cmp.config.sources({
        { name = "lazydev", group_index = 0 },
        { name = "nvim_lsp" },
        { name = "vimtex" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    }),
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:Normal",
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:Normal",
        },
    },
    experimental = { ghost_text = true },
})

-- Command-Line Completions
cmp.setup.cmdline({ "/", "?" }, {
    view = {
        entries = { name = "wildmenu", separator = " | " },
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
cmp.setup.cmdline(":", {
    -- This makes the most relevant item be at the bottom
    -- view = {
    --     entries = { name = 'custom', selection_order = 'near_cursor' },
    -- },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    matching = { disallow_symbol_nonprefix_matching = false },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
