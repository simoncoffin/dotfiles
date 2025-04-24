return {
"williamboman/mason.nvim",
dependencies = {
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
},
config = function()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

  -- enable mason and configure icons
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
      "bashls",
      "cssls",
      "dockerls",
      "docker_compose_language_service",
      "eslint",
      "graphql",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "rubocop",
      "sorbet",
      "sqlls",
      "ts_ls",
      "yamlls",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  })

  mason_tool_installer.setup({
    ensure_installed = {
      "prettierd", -- prettier formatter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "rubocop",
      "black", -- python formatter
      "pylint", -- python linter
      "eslint", -- js/ts linter
    },
  })
end,
}
