local sp = require("smart-splits")

sp.setup({
    float_win_behavior = "mux",
    cursor_follows_swapped_bufs = true,
})

local keymap = vim.keymap.set
-- Window Navigation
keymap("n", "<C-h>", sp.move_cursor_left, { desc = "Move focus to the left window" })
keymap("n", "<C-j>", sp.move_cursor_down, { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", sp.move_cursor_up, { desc = "Move focus to the upper window" })
keymap("n", "<C-l>", sp.move_cursor_right, { desc = "Move focus to the right window" })
-- Window Resizing
keymap("n", "<M-h>", sp.resize_left, { desc = "Resize current window left" })
keymap("n", "<M-j>", sp.resize_down, { desc = "Resize current window down" })
keymap("n", "<M-k>", sp.resize_up, { desc = "Resize current window up" })
keymap("n", "<M-l>", sp.resize_right, { desc = "Resize current window right" })
-- Window Swapping
keymap("n", "<C-M-h>", sp.swap_buf_left, { desc = "Move current buffer left" })
keymap("n", "<C-M-j>", sp.swap_buf_down, { desc = "Move current buffer down" })
keymap("n", "<C-M-k>", sp.swap_buf_up, { desc = "Move current buffer up" })
keymap("n", "<C-M-l>", sp.swap_buf_right, { desc = "Move current buffer right" })
