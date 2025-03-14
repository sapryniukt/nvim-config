return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason and mason-lspconfig
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

    -- configure mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- configure mason-lspconfig
    mason_lspconfig.setup({
      -- list of servers to auto-install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
      -- set to true or false as desired
      automatic_installation = true,
    })

    -- configure mason-tool-installer
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- js/ts formatter
        "stylua",   -- lua formatter
        "isort",    -- python formatter
        "black",    -- python formatter
        "pylint",   -- python linter
        "eslint_d", -- js linter
      },
      -- optional fields:
      auto_update = false,
      run_on_start = true,
    })
  end,
}

