-- =========================
-- LSP Capabilities
-- =========================
-- This enables better completion integration if nvim-cmp is installed.

local capabilities = (function()
  local ok, cmp = pcall(require, "cmp_nvim_lsp")
  return ok and cmp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()
end)()

-- =========================
-- on_attach callback
-- =========================
-- Runs when the LSP server attaches to a buffer.
-- Used to define buffer-local keymaps for LSP actions.

local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Basic LSP actions
  map("n", "K",          vim.lsp.buf.hover,          "Show Hover Info")
  map("n", "gd",         vim.lsp.buf.definition,      "Go to Definition")
  map("n", "gD",         vim.lsp.buf.declaration,     "Go to Declaration")
  map("n", "gi",         vim.lsp.buf.implementation,  "Go to Implementation")
  map("n", "gr",         vim.lsp.buf.references,      "List References")
  map("n", "<leader>rn", vim.lsp.buf.rename,          "Rename Symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action,     "Code Action")
  map("n", "<leader>f",  function() vim.lsp.buf.format({ async = true }) end, "Format File")

  -- Diagnostics navigation
  map("n", "]d",         vim.diagnostic.goto_next,    "Next Diagnostic")
  map("n", "[d",         vim.diagnostic.goto_prev,    "Previous Diagnostic")
  map("n", "<leader>e",  vim.diagnostic.open_float,   "Show Diagnostic")
end

-- =========================
-- MSVC Query Driver Path
-- =========================
-- clangd needs this to properly locate MSVC's standard library and headers.
local msvc_query = "C:/Program Files (x86)/Microsoft Visual Studio/*/bin/Hostx64/x64/cl.exe"

-- =========================
-- Clangd Configuration
-- =========================
-- The actual server configuration (NOT started yet).
local clangd_cfg = {
  name = "clangd",
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--cross-file-rename",
    "--header-insertion=iwyu",
    "--query-driver=" .. msvc_query,   
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("LspStartClangd", { clear = true }),
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function(args)
    -- Root finden (compile_commands.json bevorzugt)
    local root = vim.fs.root(args.buf, { "compile_commands.json", "compile_flags.txt", ".git" }) or vim.loop.cwd()

    -- Schon ein clangd-Client am Buffer?
    local attached = vim.lsp.get_clients({ bufnr = args.buf, name = "clangd" })[1]
    if attached then return end

    -- Starten; bufnr mitgeben, Config MERGEN (kein Funktionsaufruf von vim.lsp.config!)
    local cfg = vim.tbl_extend("force", clangd_cfg, { root_dir = root, bufnr = args.buf })
    vim.lsp.start(cfg)
  end,
})

-- =========================
-- Diagnostic Symbols
-- =========================
-- Adds pretty icons to the sign column for diagnostics.
for type, icon in pairs({
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
