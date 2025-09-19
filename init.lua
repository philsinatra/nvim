-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd({"BufReadPost"}, {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("filetype detect")
      vim.cmd("syntax enable")
      pcall(vim.treesitter.start) -- Force Tree-sitter to attach
    end, 100) -- Delay 100ms to let Neovim settle
  end,
})
