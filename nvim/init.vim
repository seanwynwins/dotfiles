" Load Packer
lua << EOF
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Add your plugins here
    use 'nvim-treesitter/nvim-treesitter' -- Treesitter for syntax highlighting
    use 'neovim/nvim-lspconfig' -- LSP configurations
    use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
    use 'mfussenegger/nvim-jdtls' -- Java Development Tools Language Server
    use 'github/copilot.vim' -- GitHub Copilot

    -- Optional: Add dependencies for Telescope
    use {'nvim-lua/plenary.nvim'} -- Required for Telescope
end)
EOF

" Key mappings
inoremap jj <ESC>
let mapleader = "'"

" General settings
set number " Show line numbers
syntax on " Highlight syntax
set noswapfile " Disable the swapfile
set hlsearch " Highlight all results
set ignorecase " Ignore case in search
set incsearch " Show search results as you type
set mouse=a " Enable mouse support
set completeopt=menuone,noselect " Better completion experience
set termguicolors " Enable true colors
set clipboard=unnamedplus " Use system clipboard
set showcmd " Show command in the bottom bar
set cursorline " Highlight the current line
set expandtab " Use spaces instead of tabs
set tabstop=4 " Number of spaces for a tab
set shiftwidth=4 " Number of spaces for autoindent

" Additional Treesitter configuration
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "java", "ruby" },  -- Specify languages to install

    highlight = {
        enable = true,                  -- Enable highlighting
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,                  -- Enable Treesitter-based indentation
    },
}
EOF

" LSP Configuration
lua << EOF
local lspconfig = require('lspconfig')

-- Example for TypeScript
lspconfig.ts_ls.setup{
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Go to definition
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- Hover documentation
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- References
    end,
}

-- Example for Python
lspconfig.pyright.setup{}

-- Example for Ruby
lspconfig.solargraph.setup{
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    end,
}
EOF

" Telescope Configuration
lua << EOF
local telescope = require('telescope')

telescope.setup{
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        layout_strategy = "flex",
        layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false },
        },
    },
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
