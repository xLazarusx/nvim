require("lualine").setup({
  options = {
    theme = "catppuccin",      -- kein require(...) -> robust
    globalstatus = true,
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = { { "mode", icon = "" } },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {
      {
        function()
          local c = vim.lsp.get_active_clients({ bufnr = 0 })[1]
          return c and ("  " .. c.name) or ""
        end,
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})


