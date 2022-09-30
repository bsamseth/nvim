local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
  return
end


local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

local codelldb = "/home/bendik/.local/share/nvim/dapinstall/codelldb/extension/adapter/codelldb"
local liblldb = "/home/bendik/.local/share/nvim/dapinstall/codelldb/extension/lldb/lib/liblldb.so"

rt.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb, liblldb),
  },
})

rt.inlay_hints.enable()
