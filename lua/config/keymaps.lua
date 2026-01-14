-- setting variable for 
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ========================
-- Basics 
-- ========================
map('n', '<Space>', '<Nop>', opts)
map('n', '<ESC>', '<cmd>nohlsearch<CR>', opts)

-- save/quit
map('n', '<leader>w', '<cmd>update<CR>', { desc = 'save (when changed)', silent = true })
map('n', '<leader>q', '<cmd>quit<CR>', { desc = 'close window' })
map('n', '<leader>x', '<cmd>wq<CR>', { desc = 'save & close' })

-- ========================
-- Window-Nav & Management 
-- ========================

-- jump splits
map('n', '<C-h>', '<C-w>h', { desc = 'left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'lower split' })
map('n', '<C-k>', '<C-w>k', { desc = 'upper split' })
map('n', '<C-l>', '<C-w>l', { desc = 'right split' })

-- Splits Management 
map('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'Vertical Split' })
map('n', '<leader>sh', '<cmd>split<CR>',  { desc = 'Horizontal Split' })
map('n', '<leader>se', '<C-w>=',          { desc = 'Splits' })
map('n', '<leader>sx', '<cmd>close<CR>',  { desc = 'close split' })

-- Resize
map('n', '<C-Left>',  '<cmd>vertical resize -3<CR>', { desc = 'Split schmaler' })
map('n', '<C-Right>', '<cmd>vertical resize +3<CR>', { desc = 'Split breiter' })
map('n', '<C-Up>',    '<cmd>resize +2<CR>',          { desc = 'Split höher' })
map('n', '<C-Down>',  '<cmd>resize -2<CR>',          { desc = 'Split niedriger' })

-- ========================
-- Buffer workflow
-- ========================

-- change buffer
map("n", "<S-l>", "<cmd>bnext<CR>",     { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- buffer management
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bo", ":%bd|e#|bd#<CR>",   { desc = "Only current buffer" })
map("n", "<leader>bl", "<cmd>ls<CR>",       { desc = "List buffers" })

-- ========================
-- Navigation & search 
-- ========================

-- search navigation
map("n", "n", "nzzzv", { desc = "Next search hit (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search hit (centered)" })

-- half page navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- center current line
map("n", "zz", "zz", { desc = "Center current line" })

-- ========================
-- Reflow code blocks 
-- ========================

-- moving line
map("n", "<C-S-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-S-Up>",   "<cmd>m .-2<CR>==", { desc = "Move line up" })

-- moving block
map("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("v", "<C-S-Up>",   ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- ========================
-- System clipboard 
-- ========================

-- yank system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]],          { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

-- ========================
-- Quickfix & location lists 
-- ========================

-- quickfix management
map("n", "<leader>qo", "<cmd>copen<CR>",  { desc = "Quickfix open" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix close" })

-- quickfix navigation
map("n", "]q", "<cmd>cnext<CR>zz",       { desc = "Next quickfix item" })
map("n", "[q", "<cmd>cprev<CR>zz",       { desc = "Prev quickfix item" })

-- ========================
-- Diagnostics
-- ========================

-- diagnostics management
map("n", "]d", vim.diagnostic.goto_next,        { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev,        { desc = "Prev diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float,{ desc = "Diagnostic details" })
