return {
  "mattn/emmet-vim",
  ft = {
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "php",
    "vue",
  },
  config = function()
    -- Enable Emmet for PHP files
    vim.g.user_emmet_settings = {
      php = {
        extends = "html",
        filters = "html",
      },
      svelte = {
        extends = "html",
      },
    }

    -- Set Emmet leader key (default is <C-y>, change if needed)
    vim.g.user_emmet_leader_key = "<C-y>"

    -- Enable Emmet in insert mode only
    vim.g.user_emmet_mode = "i"

    -- Auto-enable for specific filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "html", "css", "javascript", "typescript", "svelte", "php" },
      callback = function()
        vim.cmd("EmmetInstall")
      end,
    })
  end,
}
