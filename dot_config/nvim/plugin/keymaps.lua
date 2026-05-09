local keymap = vim.keymap.set

-- Normal Mode --
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search when pressing <Esc> in normal mode" })

keymap("n", "J", "mzJ`z", { desc = "Append line from below with the space" })

-- Window Navigation
-- keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Window Resizing
-- keymap("n", "<M-l>", "<c-w>3>", { desc = "Increase current window width by 3" })
-- keymap("n", "<M-h>", "<c-w>3<", { desc = "Decrease current window width by 3" })
-- keymap("n", "<M-j>", "<C-W>3+", { desc = "Increase current window height by 3" })
-- keymap("n", "<M-k>", "<C-W>3-", { desc = "Decrease current window height by 3" })

-- Buffer Navigation
keymap("n", "gn", ":bnext<CR>", { desc = "Move to the next buffer" })
keymap("n", "gp", ":bprevious<CR>", { desc = "Move to the previous buffer" })

keymap("n", "<leader>tf", vim.cmd.ToggleFormat, { desc = "[T]oggle [F]ormatting-on-save" })
keymap("n", "<leader>Tf", function()
    vim.cmd.ToggleFormat({ bang = true })
end, { desc = "[T]oggle [F]ormatting-on-save for the current buffer" })

-- Visual Mode --
keymap("v", "<", "<gv", { desc = "Increase indentation of selected lines" })
keymap("v", ">", ">gv", { desc = "Decrease indentation of selected lines" })

keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

keymap("v", "p", '"_dP', { desc = "Paste with replacement" })
