-- checking for lazyvim packetmanager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- setting leader key
vim.g.mapleader = ' '

-- adding all lua config-files
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- adding all lua plugin-files
require('lazy').setup({ import = 'plugins' })

require('plugins.config.lsp_config')

