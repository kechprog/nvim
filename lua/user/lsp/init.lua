local status, _ = pcall(require, 'lspconfig')
if not status then
    print 'lsp is not installed or something'
end

-- to do key maps and options for others lsps

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()

