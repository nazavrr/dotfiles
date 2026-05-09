local os = require("config.os")

local vault_file_pattern = vim.fn.expand("~") .. "/Obsidian Vaults/Personal/*.md"

return {
    {
        "epwalsh/obsidian.nvim",
        enabled = os.IS_LINUX,
        version = "*",
        event = { "BufReadPre " .. vault_file_pattern, "BufNewFile " .. vault_file_pattern },
        cmd = {
            "ObsidianOpen",
            "ObsidianNew",
            "ObsidianQuickSwitch",
            "ObsidianFollowLink",
            "ObsidianBacklinks",
            "ObsidianTags",
            "ObsidianToday",
            "ObsidianYesterday",
            "ObsidianTomorrow",
            "ObsidianDailies",
            "ObsidianTemplate",
            "ObsidianSearch",
            "ObsidianLink",
            "ObsidianLinkNew",
            "ObsidianLinks",
            "ObsidianExtractNote",
            "ObsidianWorkspace",
            "ObsidianPasteImg",
            "ObsidianRename",
            "ObsidianToggleCheckbox",
            "ObsidianNewFromTemplate",
            "ObsidianTOC",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            workspaces = { { name = "personal", path = "~/Obsidian Vaults/Personal" } },
            notes_subdir = "Information Gain",
            daily_notes = { folder = "Work/Dailies", template = "Daily Note.md" },
            completion = { nvim_cmp = true, min_chars = 1 },
            mappings = {
                ["<leader>oo"] = { action = vim.cmd.ObsidianOpen, opts = { desc = "[O]bsidian [O]pen" } },
                ["<leader>on"] = { action = vim.cmd.ObsidianNew, opts = { desc = "[O]bsidian [N]ew" } },
                ["<leader>os"] = { action = vim.cmd.ObsidianQuickSwitch, opts = { desc = "[O]bsidian [S]earch" } },
                ["<leader>of"] = { action = vim.cmd.ObsidianFollowLink, opts = { desc = "[O]bsidian [F]ollow Link" } },
                ["<leader>ob"] = { action = vim.cmd.ObsidianBacklinks, opts = { desc = "[O]bsidian [B]acklinks" } },
                ["<leader>ot"] = { action = vim.cmd.ObsidianTemplate, opts = { desc = "[O]bsidian Insert [T]emplate" } },
                ["<leader>og"] = { action = vim.cmd.ObsidianSearch, opts = { desc = "[O]bsidian [G]rep" } },
                ["<leader>ol"] = { action = vim.cmd.ObsidianLinks, opts = { desc = "[O]bsidian [L]inks" } },
                ["<leader>ow"] = { action = vim.cmd.ObsidianWorkspace, opts = { desc = "[O]bsidian [W]orkspace" } },
                ["<leader>oi"] = { action = vim.cmd.ObsidianPasteImg, opts = { desc = "[O]bsidian Paste [I]mage" } },
            },
            new_notes_location = "notes_subdir",
            ---@param title string|?
            ---@return string
            note_id_func = function(title)
                -- If title is not nil, return it as ID
                if title ~= nil then
                    return title
                end
                -- Otherwise, generate an id like 'timestamp-####'
                local id = tostring(os.time()) .. "-"
                for _ = 1, 4 do
                    id = id .. string.char(math.random(65, 90))
                end
                return id
            end,
            ---@param spec { id: string, dir: obsidian.Path, title: string|? }
            ---@return string|obsidian.Path The full path to the new note.
            note_path_func = function(spec)
                local path
                if spec.title ~= nil then
                    path = spec.dir / tostring(spec.title)
                else
                    path = spec.dir / tostring(spec.id)
                end
                return path:with_suffix(".md")
            end,
            disable_frontmatter = true,
            templates = { folder = "Templates", date_format = "%Y-%m-%d", time_format = "%H:%M:00" },
            follow_url_func = function(url)
                vim.ui.open(url)
            end,
            picker = { name = "telescope.nvim" },
            sort_by = "modified",
            sort_reversed = true,
            ui = { enable = true },
            attachments = {
                img_folder = "Media",
                ---@param client obsidian.Client
                ---@param path obsidian.Path the absolute path to the image file
                ---@return string
                img_text_func = function(client, path)
                    local rel_path = client:vault_relative_path(path) or path
                    return string.format("![[%s]]", rel_path)
                end,
            },
        },
    },
}
