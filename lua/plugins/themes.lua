return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum",
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "rose-pine",
      colorscheme = "catppuccin",
      -- colorscheme = "monokai-pro",
    },
  },
}
