-- Global options

local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}


-- Indentation
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
