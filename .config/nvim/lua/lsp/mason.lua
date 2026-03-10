require("mason").setup()
require("mason-lspconfig").setup({
    -- Only put LSPs in this list! Formatters don't belong here.
    ensure_installed = { 
        "arduino_language_server",
        "bashls",
        "gopls", 
        "html",
        "ltex", 
        "lua_ls", 
        "marksman", 
        "pyright", 
        "ruff", 
        "texlab"
    },
    automatic_installation = true,
})

local handlers = require("lsp.handlers")
handlers.setup()

-- default handler
vim.lsp.config("*", {
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach, 
})

vim.lsp.enable("arduino_language_server")
vim.lsp.enable("bashls")
vim.lsp.enable("gopls")
vim.lsp.enable("html")
vim.lsp.enable("ltex")
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
vim.lsp.enable("texlab")

-- Lua handler
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      hint = { enable = false },
    },
  },
}) 

-- Ruff handler
vim.lsp.config("ruff", {
    on_attach = function(client, bufnr)
        handlers.on_attach(client, bufnr)
        -- Disable Ruff's hover feature so Pyright handles it
        client.server_capabilities.hoverProvider = false
    end
})

-- Gopls handler
vim.lsp.config("gopls", {})
