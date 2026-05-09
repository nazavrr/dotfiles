local M = {}

M.SYSNAME = vim.uv.os_uname().sysname

M.IS_LINUX = M.SYSNAME == "Linux"
M.IS_MACOS = M.SYSNAME == "Darwin"
M.IS_WINDOWS = M.SYSNAME == "Windows_NT"

return M
