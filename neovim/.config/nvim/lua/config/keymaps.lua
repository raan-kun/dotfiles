-- Shorten function name
local map = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Reload config
map('n', '<Leader>R', "<cmd>luafile $MYVIMRC<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--map("n", "<S-l>", ":bnext<CR>", opts)
--map("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
--map("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Insert --
-- Save
map('n', '<C-s>', "<Cmd>update<CR>", opts)
map('i', '<C-s>', "<Esc><Cmd>update<CR>", opts)

-- Tab navigation
map('n', '<C-Tab>', "<cmd>tabnext<CR>", opts)
map('n', '<C-S-Tab>', "<cmd>tabprevious<CR>", opts)
map('i', '<C-Tab>', "<cmd>tabnext<CR>", opts)
map('i', '<C-S-Tab>', "<cmd>tabprevious<CR>", opts)

-- Press jk fast to enter
--map("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Plugins --
-- NvimTree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>ft", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fp", ":Telescope projects<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)

map("n", "<Leader>P", ":Telescope commands<CR>", opts)
map("n", "<Leader>o", ":Telescope file_browser<CR>", opts)

-- Git
map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
-- map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
--map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
--map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
--map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
--map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
--map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

