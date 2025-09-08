return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Helper function to find local binaries (from your macOS config)
    local function find_local_bin(bin_name)
      if bin_name == "stylelint" then
        local project_root = vim.fn.getcwd()
        local node_bin = project_root .. "/node_modules/.bin/" .. bin_name
        if vim.fn.executable(node_bin) == 1 then
          return node_bin
        end
      end
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/" .. bin_name
      if vim.fn.executable(mason_bin) == 1 then
        return mason_bin
      end
      local project_root = vim.fn.getcwd()
      local vendor_bin = project_root .. "/vendor/bin/" .. bin_name
      if vim.fn.executable(vendor_bin) == 1 then
        return vendor_bin
      end
      local node_bin = project_root .. "/node_modules/.bin/" .. bin_name
      if vim.fn.executable(node_bin) == 1 then
        return node_bin
      end
      return bin_name
    end

    -- Extend formatters_by_ft with your macOS config
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.css = { "stylelint", "prettier" }

    -- Extend formatters with your macOS config (including --fix for stylelint)
    opts.formatters = opts.formatters or {}
    opts.formatters.stylelint = {
      command = find_local_bin("stylelint"),
      args = {
        "--fix",
        "--stdin",
        "--stdin-filename",
        "$FILENAME",
      },
      stdin = true,
    }
    opts.formatters.prettier = {
      command = find_local_bin("prettier"),
      args = { "--stdin-filepath", "$FILENAME" },
    }

    -- Add stylelint config if found (from macOS)
    local config_path = vim.fn.findfile(".stylelintrc.json", vim.fn.getcwd() .. ";")
    if config_path ~= "" and vim.fn.filereadable(config_path) == 1 then
      table.insert(opts.formatters.stylelint.args, 1, "--config")
      table.insert(opts.formatters.stylelint.args, 2, config_path)
      -- else
      --   vim.notify("Stylelint: No valid .stylelintrc.json found", vim.log.levels.WARN)
    end

    -- Ensure format_on_save is enabled (LazyVim default, but confirm)
    -- opts.format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- }

    return opts
  end,
}
