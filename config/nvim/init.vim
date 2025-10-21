" =====================================================
" Atexovi-Nvim Full Setup (Termux Compatible)
" =====================================================

" -------------------------------
" Plugin Manager - vim-plug
" -------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Theme Plugins
Plug 'atex-ovi/atexovi_aurora.nvim', { 'as': 'atexovi_aurora' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'habamax/vim-polar'
Plug 'jamescherti/vim-tomorrow-night-deepblue'
Plug 'ficcdaf/ashen.nvim'

" Syntax & Language
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'

" UI & Navigation
"Plug 'nvim-lualine/lualine.nvim'
Plug 'datwaft/bubbly.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocompletion & LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-lua']

call plug#end()

" ------------------------------- 
" General Settings 
" ------------------------------- 
set nocompatible
filetype plugin indent on
syntax enable
set number
set relativenumber
set cursorline
set termguicolors
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set tabstop=2 shiftwidth=2 expandtab smartindent nowrap
set signcolumn=yes
set guicursor=n-v-c-sm-ci-ve-r-cr-o:hor20,i:ver25

" -------------------------------
" Keymaps
" -------------------------------
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>e :NvimTreeFocus<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>d :CocDiagnostics<CR>
nnoremap <leader>r :CocRestart<CR>

" -------------------------------
" Theme Picker
" -------------------------------
lua require("atexovi.theme_picker")
command! ThemePicker lua require("atexovi.theme_picker").choose()


" -------------------------------
" Lualine Setup
" -------------------------------
"lua << EOF
"require('lualine').setup {
"options = { theme = 'auto', section_separators = '', component_separators = '' }
"}
"EOF

"Bubbly.nvim

lua << EOF
pcall(function()
  require('bubbly').setup{
      theme = {
          fg       = '#c0caf5',
          bg       = '#1e1e2e',
          yellow   = '#e5c07b',
          cyan     = '#56b6c2',
          darkblue = '#081633',
          green    = '#98c379',
          orange   = '#d19a66',
          violet   = '#a9a1e1',
          magenta  = '#c678dd',
          blue     = '#61afef',
          red      = '#e06c75',
      },

      components = {
          left = {
              'mode',
              { { data = '', color = 'blue', style = 'bold' } },
              'branch',
              { { data = ' Atexovi ', color = 'red', style = 'bold' } },
              'filename',
          },
          right = {
              'diagnostics',
              'filetype',
              'position',
          }
      },

      separators = { left = '', right = '' },
  }
end)
EOF

" -------------------------------
" Nvim Tree Setup
" -------------------------------
lua << EOF
require("nvim-tree").setup({
  sort_by = "name",
  view = { width = 28, side = "left" },
  renderer = { highlight_opened_files = "all" },
  filters = { dotfiles = false },
  update_focused_file = { enable = true, update_cwd = true },
})
EOF

" -------------------------------
" Treesitter Setup (syntax & indent)
" -------------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "python", "javascript" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
}
EOF

" -------------------------------
" Coc Basic Setup (non-Lua)
" -------------------------------
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>c :CocDiagnostics<CR>
nnoremap <leader>f :CocCommand eslint.executeAutofix<CR>

" -------------------------------
" Autocompletion untuk Lua tanpa LSP
" -------------------------------
autocmd FileType lua setlocal omnifunc=v:lua.vim.lsp.omnifunc

" -------------------------------
" Startup Message / Debug Info
" -------------------------------
augroup AtexoviDebug
  autocmd!
  autocmd VimEnter * echom "Atexovi-Nvim Loaded"
  autocmd VimEnter * echom "Filetype: " . &filetype
augroup END