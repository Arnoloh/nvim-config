local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.pyright.setup({})
lspconfig.ts_ls.setup({
 on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = capabilities
})

