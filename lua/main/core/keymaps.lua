vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>nh", ":nohl<CR>") 
vim.keymap.set("n", "x", '"_x')

-- increment and decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") 
vim.keymap.set("n", "<leader>-", "<C-b>")

-- split open vertically, horizontally, split equal width and close split window
vim.keymap.set("n", "<leader>sv", "<C-w>v") 
vim.keymap.set("n", "<leader>sh", "<C-w>s") 
vim.keymap.set("n", "<leader>se", "<C-w>=") 
vim.keymap.set("n", "<leader>sx", ":close<CR>")

-- tab open vertically, horizontally, split equal width and close split window
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") 
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") 
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") 
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

-- vim maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree keymaps
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

