-- setting variable for nvim.api.nvim_create_autocmd
local autocmd = vim.api.nvim_create_autocmd

-- ========================
-- Hybrid Line Numbers 
-- ========================

autocmd('InsertEnter', {
    callback = function()
        vim.opt.relativenumber = false
    end,
})

autocmd('InsertLeave', {
    callback = function()
        vim.opt.relativenumber = true
    end,
})

-- ========================
-- Autoformat (needs LSP) 
-- ========================

--[[

autocmd('BufWritePre', {
    pattern = { '*.c', '*.cpp', '*.h', '*.hpp', '*.py' },
    callback = function()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        for _, clients in ipairs(clients) do
            if client.supports_method('textDocument/formatting') then
                vim.lsp.buf.format({ async = false })
                return
            end
        end
    end,
})

--]]

-- ========================
-- Auto-Reload changed files 
-- ========================

autocmd({ 'FocusGained', 'BufEnter' }, { command = 'checktime', })

-- ========================
-- Auto-Sava by lost focus 
-- ========================

autocmd({ 'FocusLost', 'BufLeave', 'WinLeave' }, {
    callback = function()
        if vim.bo.modified and vim.fn.expand('%') ~= '' and vim.bo.buftype == '' then
            vim.cmd('silent! update')
        end
    end,
})

-- ========================
-- Yank-Highligthing 
-- ========================

autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})



