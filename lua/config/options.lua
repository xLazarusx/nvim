-- setting variable for vim.opt
local opt = vim.opt

-- ========================
-- shell settings 
-- ========================

opt.shell = 'pwsh'
-- opt.shellcmdflag = '-NoProfile -NoLogo -Command'
opt.shellquote = ''
opt.shellxquote = ''

-- ========================
-- General Settings  
-- ========================

opt.fileencoding = 'UTF-8'

opt.confirm = true

opt.backup = false
opt.swapfile = false
opt.undofile = true

opt.hidden = true

-- ========================
-- User Interface Settings 
-- ========================

opt.shortmess:append({ I = true })
opt.shortmess:append({ c = true })

opt.winblend = 15
opt.pumblend = 15

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

opt.number = true
opt.relativenumber = true
opt.scrolloff = 999
opt.sidescrolloff = 8
opt.colorcolumn = '250' 

opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.showmode = false
opt.wrap = false

opt.laststatus = 3
opt.cmdheight = 0
opt.pumheight = 10
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- ========================
-- Search
-- ========================

opt.ignorecase = true
opt.smartcase = true

opt.incsearch = true
opt.hlsearch = false

-- ========================
-- Indentation / Tabs 
-- ========================

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.expandtab = true
opt.smartindent = true
opt.autoindent = true 

-- ========================
-- Window / Splits 
-- ========================

opt.splitbelow = true
opt.splitright = true

-- ========================
-- Performance 
-- ========================

opt.updatetime = 200

opt.timeoutlen = 300

-- ========================
-- chars 
-- ========================

opt.list = false

opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹"
}

opt.fillchars = { eob = " " }


