-- PHP-specific configuration
return {
  -- Ensure PHP syntax highlighting works
  {
    "StanAngeloff/php.vim",
    ft = "php",
    config = function()
      -- Enable HTML syntax inside PHP strings
      vim.g.php_html_load = 1
      -- Enable SQL syntax inside PHP strings
      vim.g.php_sql_query = 1
      -- Enable JavaScript syntax inside PHP strings
      vim.g.php_html_in_strings = 1
      -- Enable CSS syntax inside PHP strings
      vim.g.php_css_in_strings = 1
      -- Remove PHP's built-in SQL highlighting in favor of better options
      vim.g.php_sql_heredoc = 0
    end,
  },
}
