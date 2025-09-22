return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      intelephense = {
        settings = {
          intelephense = {
            files = {
              maxSize = 1000000,
              associations = { "*.php", "*.phtml" },
              exclude = {
                "**/vendor/**",
                "**/node_modules/**",
                "**/.git/**",
              },
            },
            format = {
              enable = true,
            },
            environment = {
              includePaths = { "vendor" },
            },
            -- Enable completion features
            completion = {
              insertUseDeclaration = true,
              fullyQualifyGlobalConstantsAndFunctions = false,
            },
          },
        },
        filetypes = { "php" }, -- Explicitly set filetypes
      },
      -- Add emmet_ls configuration
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "php", -- Enable Emmet for PHP
          "vue",
        },
        settings = {
          emmet = {
            includeLanguages = {
              php = "html",
              svelte = "html",
            },
          },
        },
      },
    },
  },
}
-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       intelephense = {
--         settings = {
--           intelephense = {
--             files = {
--               maxSize = 1000000,
--               associations = { "*.php", "*.phtml" },
--               exclude = {
--                 "**/vendor/**",
--                 "**/node_modules/**",
--                 "**/.git/**",
--               },
--             },
--             format = {
--               enable = true,
--             },
--             environment = {
--               includePaths = { "vendor" },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
