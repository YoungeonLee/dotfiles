local api = vim.api

-- autocommands
local GROUP_NAME = 'MyGroup'
api.nvim_create_augroup(GROUP_NAME, {})

local function create_autocmd(event, opts)
  opts['group'] = GROUP_NAME
  api.nvim_create_autocmd(event, opts)
end

-- auto reload config files and PackerSync if the file is plugins.lua
local config_file_pattern = _G.MY_CONFIG_DIR..'*.lua'
create_autocmd('BufWritePost', {
  desc = 'Reload config file on save',
  pattern = config_file_pattern,
  callback = function(table)
    vim.cmd('source ' ..table.file)
    vim.notify('Sourced ' ..table.file)
    -- if the file ends with 'plugins.lua'
    if table.file:sub(-#'plugins.lua') == 'plugins.lua' then
      vim.cmd('PackerSync')
    end
  end
})

-- configure formatoptions
create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = 'Configure formatoptions',
  pattern = '*',
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Enter git commit with insert mode
create_autocmd({ "BufWinEnter"}, {
  desc = 'Git commit starts in insert mode',
  pattern = '*/.git/COMMIT_EDITMSG',
  command = 'startinsert',
})

-- Format before saving file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
-- create_autocmd({ "BufWritePre" }, {
--   desc = 'Format before saving file',
--   pattern = '*',
--   callback = function(table)
--     vim.notify(vim.inspect(vim.lsp.buf.formatting_syn))
--     vim.lsp.buf.formatting_syn()
--   end,
-- })
--
