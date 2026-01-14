local M = {}

function M.telescope()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
      },
      layout_strategy = "horizontal",
      layout_config = { preview_width = 0.55 },
    },
    pickers = {
      find_files = { hidden = true },
    },
  })
  pcall(telescope.load_extension, "fzf")

  -- Keymaps
  local tb = require("telescope.builtin")
  local map = vim.keymap.set
  map("n", "<leader>ff", tb.find_files, { desc = "Find files" })
  map("n", "<leader>fg", tb.live_grep,  { desc = "Grep" })
  map("n", "<leader>fb", tb.buffers,    { desc = "Buffers" })
  map("n", "<leader>fh", tb.help_tags,  { desc = "Help" })
  map("n", "<leader>fs", tb.lsp_document_symbols, { desc = "LSP symbols (doc)" })
  map("n", "<leader>fS", tb.lsp_dynamic_workspace_symbols, { desc = "LSP symbols (ws)" })
end

function M.which_key()
  local wk = require("which-key")
  wk.setup({})
  wk.add({
    { "<leader>f", group = "Find (Telescope)" },
    { "<leader>d", group = "Debug (DAP)" },
    { "<leader>e", "Explorer" },
  })
end

return M
