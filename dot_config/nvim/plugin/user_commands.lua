local notify_fn = nil
local require_ok, fidget = pcall(require, "fidget")

if require_ok then
    notify_fn = fidget.notify
else
    notify_fn = vim.notify
end

local function notify(msg, key)
    return notify_fn(msg, nil, { annote = "FORMAT", key = key })
end

vim.api.nvim_create_user_command("ToggleFormat", function(args)
    if args.bang then
        local bufnr = vim.fn.bufnr()
        if vim.b.enable_autoformat then
            vim.b.enable_autoformat = false
            notify(string.format("Disabled autoformat-on-save for the current buffer [%i]", bufnr), bufnr)
        else
            vim.b.enable_autoformat = true
            notify(string.format("Enabled autoformat-on-save for the current buffer [%i]", bufnr), bufnr)
        end
    else
        if vim.g.enable_autoformat then
            vim.g.enable_autoformat = false
            notify("Disabled autoformat-on-save globally", "global_format")
        else
            vim.g.enable_autoformat = true
            notify("Enabled autoformat-on-save globally", "global_format")
        end
    end
end, { desc = "Toggle autoformat-on-save", bang = true })
