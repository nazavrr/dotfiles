local opt = vim.opt

-- General Options --
opt.backup = false
opt.swapfile = false
opt.mouse = "a"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.ignorecase = true
opt.smartcase = true
opt.pumheight = 10
opt.undofile = true
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.updatetime = 100
opt.timeoutlen = 300
opt.termguicolors = true
opt.signcolumn = "yes"
opt.mousemoveevent = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.breakindent = true
opt.conceallevel = 2
opt.foldlevel = 8
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)

-- Tab Settings --
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
