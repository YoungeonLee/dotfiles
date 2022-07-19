local M = {}

M.setup = function()
  local wk = require("which-key")

  -- disable which-key for some keys
  wk.setup {
    triggers_blacklist = {
      i = { "f" },
      v = { "f" },
      n = { "v" },
    },
  }

  -- register normal mappings
  wk.register({
    K = { vim.lsp.buf.hover, 'Hover' },
    g = {
      name = 'Go to',
      D = { vim.lsp.buf.declaration, 'Declaration' },
      d = { vim.lsp.buf.definition, 'Definition' },
      i = { vim.lsp.buf.implementation, 'Implementation' },
      r = { vim.lsp.buf.references, 'References' },
    },
  })

  -- register leader mappings
  wk.register({
    ['1'] = { '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', 'Buffer 1' },
    ['2'] = { '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', 'Buffer 2' },
    ['3'] = { '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', 'Buffer 3' },
    ['4'] = { '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', 'Buffer 4' },
    ['5'] = { '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', 'Buffer 5' },
    ['6'] = { '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', 'Buffer 6' },
    ['7'] = { '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', 'Buffer 7' },
    ['8'] = { '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', 'Buffer 8' },
    ['9'] = { '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', 'Buffer 9' },
    e = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
    z = { '<cmd>Telescope zoxide list<cr>', 'Z' },
    s = { '<cmd>w<cr>', 'Save' },
    q = { '<cmd>q<cr>', 'Quit' },
    r = { vim.lsp.buf.rename, 'Rename' },
    F = { vim.lsp.buf.formatting, 'Format' },
    n = {
      name = "Notification",
      d = { require('notify').dismiss, 'Dismiss' }
    },
    c = {
      name = "Code",
      a = { '<cmd>CodeActionMenu<cr>', 'Action' }
    },
    b = {
      name = 'Buffer',
      d = { '<cmd>bdelete!<cr>', 'Delete' },
      n = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
      p = { '<cmd>BufferLineCyclePrev<cr>', 'Prev' },
      h = { '<cmd>BufferLineCloseLeft<cr>', 'Close Left' },
      l = { '<cmd>BufferLineCloseRight<cr>', 'Close Right' },
    },
    w = {
      name = 'Window',
      w = { '<c-w>ww', 'Cycle' },
      h = { '<c-w>h', 'Left' },
      j = { '<c-w>j', 'Down' },
      k = { '<c-w>k', 'Up' },
      l = { '<c-w>l', 'Right' },
    },
    t = {
      name = 'Terminal',
      t = { '<cmd>exe v:count1 . "ToggleTerm"<cr>', 'Toggle' },
    },
    f = {
      name = 'Find',
      f = { '<cmd>Telescope find_files<cr>', 'Files' },
      w = { '<cmd>Telescope live_grep<cr>', 'Words' },
      b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
      h = { '<cmd>Telescope help_tags<cr>', 'Help' },
      c = { '<cmd>Telescope commands<cr>', 'Commands' },
      m = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
      k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
      n = { '<cmd>Telescope notify<cr>', 'Notifications' },
    },
    g = {
      name = 'Git',
      s = { '<cmd>Telescope git_status<cr>', 'Status' },
      d = {
        function()
          local lib = require 'diffview.lib'
          local view = lib.get_current_view()
          if view then
            vim.cmd(":DiffviewClose")
          else
            local args = vim.fn.input(":DiffviewOpen ")
            vim.cmd(":DiffviewOpen " .. args)
          end
        end,
        'Diff'
      },
      c = { '<cmd>Git commit<cr>', 'Commit' },
      p = { '<cmd>Git push<cr>', 'Push' },
      f = { '<cmd>Git pull<cr>', 'Pull' },
    },
    d = {
      name = 'Diagnostic',
      w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
      d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document' },
      p = { vim.diagnostic.open_float, 'Peek' },
      n = { vim.diagnostic.goto_next, 'Next' },
      N = { vim.diagnostic.goto_prev, 'Prev' },
      l = { vim.diagnostic.setloclist, 'List' },
      c = { require('utils').copy_diagnostics, 'Copy' }
    },
  }, { prefix = "<leader>" })

  -- register leader leader mappings
  wk.register({
    p = { '<cmd>Telescope project<cr>', 'Project' },
  }, { prefix = "<leader><leader>" })
end

return M
