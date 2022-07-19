local M = {}

M.setup = function()
  require("nvim-lsp-installer").setup {
    automatic_installation = true
  }
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- local luadev = require('lua-dev').setup({})
  -- lspconfig.sumneko_lua.setup(luadev)
  for _, LSP_server in ipairs(_G.MY_LSP_SERVERS) do
    if LSP_server == 'sumneko_lua' then
      local luadev = require("lua-dev").setup({})
      luadev.capabilities = capabilities
      lspconfig.sumneko_lua.setup(luadev)
    else
      lspconfig[LSP_server].setup {
        capabilities = capabilities,
        on_attach = function(client)
          if _G.MY_NO_FORMAT_LIST[client.name] then
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
          end
        end,
      }
    end
  end
end

return M
