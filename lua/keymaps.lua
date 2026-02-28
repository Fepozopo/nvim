-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Custom keymaps for plugins
-- vim.keymap.set('n', '<leader>no', ':Oil --float<CR>', { desc = '[N]avigate using [O]il' })
vim.keymap.set('n', '<leader>o', ':Oil --float<CR>', { desc = '[O]il' })

-- Terminal keymaps
vim.api.nvim_set_keymap('n', '<leader>mt', ':terminal<CR>', { noremap = true, silent = true, desc = '[M]ake [T]erminal' })
vim.api.nvim_set_keymap('n', '<leader>mv', ':vsplit | terminal<CR>', { noremap = true, silent = true, desc = '[M]ake Terminal ([V]ertical Split)' })
vim.api.nvim_set_keymap('n', '<leader>mh', ':split | terminal<CR>', { noremap = true, silent = true, desc = '[M]ake Terminal ([H]orizontal Split)' })

-- Tab keymaps
vim.keymap.set('n', '<leader>be', ':tabe<CR>', { desc = 'Ta[b] N[e]w' })
vim.keymap.set('n', '<leader>bc', ':tabc<CR>', { desc = 'Ta[b] [C]lose' })
vim.keymap.set('n', '<leader>bn', ':tabn<CR>', { desc = 'Ta[b] [N]ext' })
vim.keymap.set('n', '<leader>bp', ':tabp<CR>', { desc = 'Ta[b] [P]revious' })

-- Copilot keymaps
vim.keymap.set('n', '<leader>pt', ':Copilot toggle<CR>', { desc = 'Co[p]ilot [T]oggle Buffer Status' })
vim.keymap.set('n', '<leader>ps', ':Copilot status<CR>', { desc = 'Co[p]ilot [S]tatus' })
vim.keymap.set('n', '<leader>pl', ':Copilot model list<CR>', { desc = 'Co[p]ilot [L]ist Models' })
vim.keymap.set('n', '<leader>pp', ':Copilot panel<CR>', { desc = 'Co[p]ilot [P]anel' })
vim.keymap.set('n', '<leader>pa', ':Copilot suggestion toggle_auto_trigger<CR>', { desc = 'Co[p]ilot Toggle [A]uto Trigger' })
vim.keymap.set('n', '<leader>pd', ':Copilot disable<CR>', { desc = 'Co[p]ilot [D]isable' })
vim.keymap.set('n', '<leader>pe', ':Copilot enable<CR>', { desc = 'Co[p]ilot [E]nable' })

-- CodeCompanion keymaps
-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])

-- vim: ts=2 sts=2 sw=2 et
