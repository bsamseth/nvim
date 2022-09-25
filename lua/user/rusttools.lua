local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
  return
end


local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

rt.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
})

rt.inlay_hints.enable()
