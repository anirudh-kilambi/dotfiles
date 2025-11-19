vim.g.mapleader = " "        -- Leader key (space) for custom keybindings
vim.g.maplocalleader = " "
------------------------------------------------------------
-- Core options
------------------------------------------------------------
require("settings.settings")


--------------------------------------------------------------
-- Key Mappings
--------------------------------------------------------------
require("settings.mappings")

--------------------------------------------------------------
-- Plugins
--------------------------------------------------------------
-- lazy.nvim bootstrapping (auto-install if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins.plugins")

--------------------------------------------------------------
-- LSP Config
--------------------------------------------------------------

--------------------------------------------------------------
---- 2. Autocommands (event-driven behavior)
--------------------------------------------------------------
--local aug = vim.api.nvim_create_augroup
--local auc = vim.api.nvim_create_autocmd

---- Automatically open ~/scratch when no file is provided
--auc("VimEnter", {
  --group = aug("OpenScratch", { clear = true }),
  --callback = function()
    --if vim.fn.eval("@%") == "" then
      --vim.cmd("e ~/scratch")
    --end
  --end,
--})

---- Remember folds and view position between sessions
--local remember = aug("RememberFolds", { clear = true })
--auc("BufWinLeave", {
  --group = remember,
  --pattern = "*",
  --callback = function()
    --if vim.bo.buftype == "" then pcall(vim.cmd, "mkview") end
  --end,
--})
--auc("BufWinEnter", {
  --group = remember,
  --pattern = "*",
  --callback = function()
    --if vim.bo.buftype == "" then pcall(vim.cmd, "loadview") end
  --end,
--})

---- Per-language indentation (example for C++)
--auc("FileType", {
  --pattern = "cpp",
  --callback = function()
    --vim.bo.tabstop = 2
    --vim.bo.shiftwidth = 2
    --vim.bo.softtabstop = 2
    --vim.bo.expandtab = true
    --vim.bo.cindent = true
  --end,
--})

--------------------------------------------------------------
---- 3. Key mappings
--------------------------------------------------------------
--local map = vim.keymap.set   -- Short alias for creating keymaps

---- Common leader bindings (modern replacements for your .vimrc ones)
--map("n", "<leader>c", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
--map("n", "<leader>l", "<cmd>ls<CR>", { desc = "List buffers" })
--map("n", "<leader>b", ":ls<CR>:b <Space>", { desc = "Switch buffer" })

---- Tabs / terminal toggles
--map("n", "<leader>t", "<cmd>vert term<CR>", { desc = "Open vertical terminal" })
---- Alternative (uncomment if you prefer next tab navigation)
---- map("n", "<leader>t", "gt", { desc = "Next tab" })

---- JSON prettify with jq
--map("n", "<leader>jj", ":%!jq .<CR>", { silent = true, desc = "Prettify JSON" })

---- Quick clear of highlight
--map ("n", "<leader>jj", ":%!jq .<CR>", { silent = true, desc = "clear highlights from search" })

--------------------------------------------------------------
---- 4. Plugin system: lazy.nvim
--------------------------------------------------------------
---- lazy.nvim bootstrapping (auto-install if missing)
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
  --vim.fn.system({
    --"git",
    --"clone",
    --"--filter=blob:none",
    --"https://github.com/folke/lazy.nvim.git",
    --lazypath,
  --})
--end
--vim.opt.rtp:prepend(lazypath)

---- Load plugin setup from lua/plugins.lua
--require("lazy").setup("plugins")

--------------------------------------------------------------
---- 5. Colorscheme
--------------------------------------------------------------
---- Keep using your existing onedark.vim in ~/.config/nvim/colors/
----vim.cmd("colorscheme onedark")


--------------------------------------------------------------
---- 7. Optional diagnostic/view polish
--------------------------------------------------------------
---- These ensure consistent highlight gutters for diagnostics and signs
--vim.cmd([[
  --highlight! link DiagnosticSignError CocErrorSign
  --highlight! link DiagnosticSignWarn  CocWarningSign
--]])

