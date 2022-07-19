local M = {}

function M.Set(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function M.map(tbl, f)
  local t = {}
  for k, v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

function M.pad_str(str, len)
  if #str < len then
    str = str .. string.rep(' ', len - #str)
  end
  return str
end

function M.bufferline_custom()
  local terms_table = require('toggleterm.terminal').get_all()
  local result = {}
  for _, term in pairs(terms_table) do
    local text = M.pad_str(tostring(term.id), 2)
    table.insert(result, { text = text, guifg = "#50fa7b" })
    -- table.insert(result, {
    --   bufnr = term.bufnr,
    --   id = term.id,
    --   name = term.name,
    -- })
  end
  return result
end

function M.copy_diagnostics()
  local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })
  local messages = M.map(diagnostics, function(diagnostic)
    return diagnostic.message
  end)
  if #messages < 1 then
    vim.notify('No diagnostic message found', vim.log.levels.ERROR)
    return
  end
  local message;
  if #messages == 1 then
    message = messages[1]
  else
    vim.ui.select(messages, { prompt = 'Which one to copy?' }, function(choice)
      message = choice
    end)
  end
  vim.fn.setreg('+', message)
  vim.notify('Diagnostic messagge copied to clipboard')
end

return M
