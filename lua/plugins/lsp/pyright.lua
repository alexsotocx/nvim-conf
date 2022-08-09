local lsp = require('lspconfig')
local map = require('util').map
local split = require('util').split

function _G.format_py(bufnr)
  local res = vim.api.nvim_command_output([[:w !cat | autopep8 -]])
  local lines = split(res, '\n')
  table.remove(lines, 1) -- remove extra line
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

return function(on_attach, capabilities)
  lsp.pyright.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.keymap.del('n', '<space>f', { buffer = bufnr })

      map('n', '<space>f', function()
        format_py(bufnr)
      end,
        { desc = 'Format code with autopep8' }
      )
    end,
    capabilities = capabilities
  }
end

