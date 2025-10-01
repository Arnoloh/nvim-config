-- (Optionnel mais recommandé) s’assurer que les configs par défaut de nvim-lspconfig
-- sont sur le runtimepath, sans utiliser require('lspconfig').
pcall(require, "nvim-lspconfig")

-- Déclarations/overrides inline
vim.lsp.config("clangd", {})

vim.lsp.config("pyright", {})

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  filetypes = {
    "typescript", "typescriptreact", "typescript.tsx",
    "javascript", "javascriptreact", "javascript.jsx",
  },
  capabilities = capabilities,
})

-- Activer les serveurs
vim.lsp.enable({ "clangd", "pyright", "ts_ls" })
