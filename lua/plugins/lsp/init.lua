local lsp = require('lspconfig')
local map = require('util').map
local printf = require('util').printf
local cmp = require('plugins/lsp/autocomplete')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local mapopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, mapopts)
  map('n', 'gd', vim.lsp.buf.definition, mapopts)
  map('n', 'K', vim.lsp.buf.hover, mapopts)
  map('n', 'gi', vim.lsp.buf.implementation, mapopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, mapopts)
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, mapopts)
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, mapopts)
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, mapopts)
  map('n', '<space>D', vim.lsp.buf.type_definition, mapopts)
  map('n', '<space>rn', vim.lsp.buf.rename, mapopts)
  map('n', '<space>ca', vim.lsp.buf.code_action, mapopts)
  map('n', 'gr', vim.lsp.buf.references, mapopts)
  map('n', '<space>f', vim.lsp.buf.formatting, mapopts)


  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.formatting_sync()
    end
  })
end



-- Python
lsp.pyright.setup { on_attach = on_attach, capabilities = cmp.capabilities }
-- golang
lsp.gopls.setup { on_attach = on_attach, capabilities = cmp.capabilities }
-- lua
lsp.sumneko_lua.setup {
  on_attach = on_attach, capabilities = cmp.capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.efm.setup {
  on_attach = on_attach, capabilities = cmp.capabilities,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      python = {
        { formatCommand = "autopep8 -", formatStdin = true }
      }
    }
  }
}
