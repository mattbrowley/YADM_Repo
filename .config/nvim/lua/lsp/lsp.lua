-- Protected call to lspconfig
local config_ok, _ = pcall(require, "lspconfig")
if not config_ok then
  return
end

local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
  }
  if server.name == "jsonls" then
	 	local jsonls_opts = require("lsp.json")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end
  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  if server.name == "pyright" then
    local python_opts = require("lsp.python")
    opts = vim.tbl_deep_extend("force", python_opts, opts)
  end

  server:setup(opts)
end)

require("lsp.handlers").setup()
require("lsp.null-ls")
