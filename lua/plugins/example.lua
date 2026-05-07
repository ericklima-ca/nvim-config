-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- conform
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        lua = { "stylua" },
      },
    },
  },
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      transparent = true,

    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- extend treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, {
  --       function()
  --         return "😄"
  --       end,
  --     })
  --   end,
  -- },
  --
  -- -- or you can return new options to override all the defaults
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },

  -- update mason.nvim to new repo
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "emrearmagan/dockyard.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim", -- optional
    },
    cmd = { "Dockyard", "DockyardFloat" },
    lazy = true,
    config = function()
      require("dockyard").setup({})
    end,
  },
  {
  "saghen/blink.cmp",
    optional = true,
    dependencies = { "allaman/emoji.nvim", "saghen/blink.compat" },
    opts = {
      sources = {
        default = { "emoji" },
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            -- overwrite kind of suggestion
            transform_items = function(_, items)
              local kind = require("blink.cmp.types").CompletionItemKind.Text
              for i = 1, #items do
                items[i].kind = kind
              end
              return items
            end,
          },
        },
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "none",
      particles_enabled = true,
      stiffness = 0.5,
      trailing_stiffness = 0.2,
      trailing_exponent = 5,
      damping = 0.6,
      gradient_exponent = 0,
      gamma = 1,
      never_draw_over_target = true, -- if you want to actually see under the cursor
      hide_target_hack = true,       -- same
      particle_spread = 1,
      particles_per_second = 500,
      particles_per_length = 50,
      particle_max_lifetime = 800,
      particle_max_initial_velocity = 20,
      particle_velocity_from_cursor = 0.5,
      particle_damping = 0.15,
      particle_gravity = -50,
      min_distance_emit_particles = 0,
    },
  },
  {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  opts = {
    diff_binaries = false,
    enhanced_diff_hl = true, -- Great for your Data Science/Code reviews
    hooks = {
      diff_buf_read = function(bufnr)
        -- Custom options for diff buffers
        vim.opt_local.wrap = false
        vim.opt_local.colorcolumn = ""
      end,
    },
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %", desc = "Diffview File History" },
  },
},
-- {
--   "xiyaowong/transparent.nvim",
--   lazy = false,
--   priority = 1000, -- Ensure it loads before other UI plugins
--   opts = {
--     -- Additional groups you might want transparent
--     extra_groups = {
--       "NormalFloat", -- For Lazy/Mason/LspInfo floating windows
--       "NvimTreeNormal", -- If you use NvimTree
--       "NeoTreeNormal", -- LazyVim default file explorer
--       "NeoTreeNormalNC",
--     },
--     exclude_groups = {}, -- Groups you want to keep their background
--   },
--   config = function(_, opts)
--     require("transparent").setup(opts)
--
--     -- Optional: Clear prefixes for common LazyVim plugins
--     local transparent = require("transparent")
--     transparent.clear_prefix("NeoTree")
--     transparent.clear_prefix("lualine")
--   end,
--   keys = {
--     { "<leader>uT", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparency" },
--   },
-- },
  {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
},
}
