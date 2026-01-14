local cmp = require("cmp")
local luasnip = require("luasnip")

-- (optional) VSCode-kompatible Snippets laden
pcall(function() require("luasnip.loaders.from_vscode").lazy_load() end)

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  completion = {
    autocomplete = { require("cmp").TriggerEvent.TextChanged },
  },
})
