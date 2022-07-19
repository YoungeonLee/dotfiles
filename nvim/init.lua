_G.MY_CONFIG_DIR = vim.call('stdpath', 'config')
_G.MY_LSP_SERVERS = { 'rust_analyzer', 'sumneko_lua', 'pyright', 'html', 'tsserver' }
_G.MY_TREESITTER_ENURE_INSTALLED = { "lua", "rust", "python", 'html', 'javascript' }
_G.MY_NO_FORMAT_LIST = require('utils').Set { "html", "tsserver" }

-- vim options
local o = vim.o
o.number = true
o.relativenumber = true
o.swapfile = false
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.colorcolumn = '80'
o.completeopt = "menu,menuone,noselect"
o.mouse = 'a'
o.termguicolors = true
o.timeoutlen = 250
o.updatetime = 300
o.undofile = true
o.signcolumn = 'yes'
o.cmdheight = 2
o.pumheight = 10
o.splitbelow = true
o.splitright = true

-- global variables
local g = vim.g
g.mapleader = ' '
g.cursorhold_updatetime = 100

-- keymaps
local keymap = vim.keymap
keymap.set({ 'i', 'v' }, 'fd', '<esc>')
-- yank and paste
keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
-- press ESC to remove highlight from search
keymap.set('n', '<esc>', '<silent>:let @/ = ""<cr><esc>')
-- select all
keymap.set('n', '<leader>a', 'ggVG')
-- window keymaps
keymap.set('n', '<c-h>', '<c-w>h')
keymap.set('n', '<c-j>', '<c-w>j')
keymap.set('n', '<c-k>', '<c-w>k')
keymap.set('n', '<c-l>', '<c-w>l')
keymap.set('n', '<c-up>', ':resize -2<cr>')
keymap.set('n', '<c-down>', ':resize +2<cr>')
keymap.set('n', '<c-left>', ':vertical resize -2<cr>')
keymap.set('n', '<c-right>', ':vertical resize +2<cr>')
-- indent
keymap.set('n', '<', '<<')
keymap.set('n', '>', '>>')
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
--terminal
keymap.set('t', 'fd', '<c-\\><c-n>')
keymap.set('t', '<c-w><c-w>', '<c-\\><c-n><c-w>w')
keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')
keymap.set('t', '<c-up>', '<cmd>resize -2<cr>')
keymap.set('t', '<c-down>', '<cmd>resize +2<cr>')
keymap.set('t', '<c-left>', '<cmd>vertical resize -2<cr>')
keymap.set('t', '<c-right>', '<cmd>vertical resize +2<cr>')

-- load autocmds
require('autocmds')

-- load plugins
require('plugins')
