require("lspconfig").clangd.setup({})
require("lspconfig").tsserver.setup({
 on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = capabilities
})
