return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "+minimap", icon = { icon = "🌎", color = "yellow" } },
      },
    },
  },
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*",
    lazy = false,
    keys = {
      { "<leader>mt", "<cmd>Neominimap Toggle<cr>", desc = "Toggle" },
      { "<leader>me", "<cmd>Neominimap Enable<cr>", desc = "Enable" },
      { "<leader>md", "<cmd>Neominimap Disable<cr>", desc = "Disable" },
      { "<leader>mr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh" },
      { "<leader>mf", "<cmd>Neominimap Focus<cr>", desc = "Focus" },
      { "<leader>mu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus" },
      { "<leader>mw", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle Window" },
    },
    init = function()
      -- Recommended settings for float layout
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36

      vim.g.neominimap = {
        auto_enable = false,
        layout = "float",
        float = {
          minimap_width = 20,
          window_border = "single",
        },
        diagnostic = {
          enabled = true,
          mode = "line",
        },
        git = {
          enabled = true,
          mode = "sign",
        },
        search = {
          enabled = true,
          mode = "line",
        },
        mark = {
          enabled = true,
          mode = "icon",
        },
        treesitter = {
          enabled = true,
        },
        fold = {
          enabled = true,
        },
      }
    end,
  },
}
