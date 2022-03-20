
--------key maps
    local map = vim.api.nvim_set_keymap

    local opt = {
            silent = true,
            noremap = true
    }


--leader key
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '


--insert mode
    map("i", "jj", "<esc>", opt)
    map("i", "<c-j>", "<esc>:m+<CR>i", opt) -- move the line down
    map("i", "<c-k>", "<esc>:m-2<CR>i", opt) -- move the line up


-- visual mode
    map("v", "J", ":<C-u>m+<CR>==gv", opt)
    map("v", "K", ":<C-u>m-2<CR>==gv", opt)
    map("v", ">", "> gv", opt)
    map("v", "<", "< gv", opt)


-- normal mode
    map("n", "<leader>w", ":w!<cr>", opt)
    map("n", "<leader>q", ":q<cr>", opt)
    map("n", "<leader>h", ":noh<cr>", opt)
    -- begging and the end of the line and bla bla
    --map("n", "J", "}", opt)
    --map("n", "K", "{", opt)
    --map("n", "H", "0", opt)
    --map("n", "L", "$", opt)

--        map("n", "<leader>/", )
-- to-do e need to maake it in to an exploreri
