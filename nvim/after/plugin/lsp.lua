local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()


vim.diagnostic.config({
   virtual_text = true,
   signs = true,
   update_in_insert = false,
   underline = false,
   severity_sort = false,
   float = true,
 })
