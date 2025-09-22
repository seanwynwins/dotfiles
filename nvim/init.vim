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
    use { 'github/copilot.vim',
          cond = function()
              return vim.env.TERM_PROGRAM ~= 'vscode'
          end }
    use { "catppuccin/nvim", as = "catppuccin" } -- Catppuccin theme

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

" Set up Catppuccin theme
lua << EOF
require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
EOF

" Set the colorscheme after setup
lua << EOF
vim.cmd.colorscheme "catppuccin"
EOF

" Key mappings for Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <leader>cd :Copilot disable<CR>
nnoremap <leader>ce :Copilot enable<CR>
