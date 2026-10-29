return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
    },
  },
}
