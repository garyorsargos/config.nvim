local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "gary.lsp.mason"
require("gary.lsp.handlers").setup()
require "gary.lsp.null-ls"
