local lsp = require('lspconfig')


return function(on_attach, capabilities)
  lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  }
end
