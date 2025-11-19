-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>m", function()
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, { desc = "List diagnostics in quickfix" })

-- Nuclear option: close ALL extra windows after grep
vim.api.nvim_create_autocmd("QuickfixCmdPost", {
  pattern = "*",
  callback = function()
    -- Close all quickfix and location windows
    for _, win in pairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
      if filetype == "qf" then
        vim.api.nvim_win_close(win, false)
      end
    end
  end,
})

-- Your manual opener
vim.keymap.set("n", "<leader>co", function()
  vim.cmd("copen")
  vim.cmd("wincmd J")
  vim.cmd("resize 15")
end, { desc = "Open quickfix at bottom" })
