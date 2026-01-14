-- plugins lsp

return{
    { "williamboman/mason.nvim",           
        config = function() require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim", 
        config = function() require("mason-lspconfig").setup({ ensure_installed = { "clangd", "lua_ls" } }) end},
    { "hrsh7th/nvim-cmp", 
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", },
        config = function() require('plugins.config.completion_config') end, 
    },
}
