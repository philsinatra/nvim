return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "html",
        "svelte",
        "ts_ls",
        "eslint",
        "emmet_ls",
        "intelephense",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- LSPs
        "ts_ls",
        "svelte",
        "emmet_ls",
        "eslint",
        "cssls",
        "html",
        "intelephense",
        -- Linters
        "eslint_d",
        "stylelint",
        "htmlhint",
        "phpcs",
        "phpstan",
        -- Formatters
        "prettier",
        "biome",
        "php-cs-fixer",
      },
      auto_update = true,
    })
  end,
}
