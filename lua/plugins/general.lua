return {
  -- Telescope (Fuzzy Finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end },
    },
    config = function() require("plugins.config.general_config").telescope() end,
  },

  -- which-key (Leader-Hilfe)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.config.general_config").which_key() end,
  },

  -- Kommentar toggles
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function() require("Comment").setup() end,
  },

  -- Dateiexplorer (falls du ihn willst – entscheide dich gegen doppelte Explorer)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function()
      require("nvim-tree").setup({ hijack_netrw = true, sync_root_with_cwd = true, view = { width = 32 } })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end,
  },
}
