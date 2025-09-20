{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-nix
      ctrlp
      vim-commentary
      vim-surround
      vim-fugitive
      vim-rhubarb
      indentLine
      vim-unimpaired
      falcon
    ];
    extraConfig = ''
      set expandtab
      set whichwrap=bs<>[]hl
      set nobackup nowritebackup
      set nowritebackup
      set undofile
      set updatetime=50
      set timeoutlen=300
      set ignorecase
      set smartcase
      set number
      set relativenumber
      set termguicolors
      set expandtab
      set splitbelow
      set splitright
      set softtabstop=4
      set smartindent
      set signcolumn=yes
      set scrolloff=10
      set numberwidth=4
      set linebreak
      set laststatus=2
      set fileencoding=utf-8
      set autoindent
      set autocomplete
      set incsearch
      set breakindent
      set mouse=a
      set clipboard=unnamedplus
      syntax on
      set autoindent
      colorscheme falcon

      let mapleader = " "

      " --- ctrlp keybindings to mimic telescope ---
      nnoremap <leader>sf :CtrlP<CR>
      nnoremap <leader><leader> :CtrlPBuffer<CR>
      nnoremap <leader>sh :Helptags<CR>
      nnoremap <leader>sc :CtrlPColorscheme<CR>
      nnoremap <leader>/ :CtrlPCurFile<CR>
      nnoremap <leader>sg :CtrlPMixed<CR>
      nnoremap <leader>s/ :CtrlPMixed<CR>
      " -------------------------------------------

      " --- commenting (vim-commentary) ---
      nnoremap <leader>cc :Commentary<CR>
      vnoremap <leader>cc :Commentary<CR>
      " --- surround (vim-surround) ---
      " (no extra mapping needed, uses s/ys/cs/ds)

      " --- splits ---
      nnoremap <leader>v :vsplit<CR>
      nnoremap <leader>o :split<CR>
      nnoremap <leader>q :close<CR>
      nnoremap <leader>x :only<CR>

      " --- buffer navigation (vim-unimpaired) ---
      nnoremap ]b :bnext<CR>
      nnoremap [b :bprevious<CR>

      " --- git (vim-fugitive) ---
      nnoremap <leader>gs :Git<CR>
      nnoremap <leader>gc :Git commit<CR>
      nnoremap <leader>ga :Git add .<CR>
      nnoremap <leader>gd :Gdiff<CR>
      nnoremap <leader>gl :Gclog<CR>
      nnoremap <leader>gb :Git blame<CR>
      nnoremap <leader>gp :Git push<CR>
      nnoremap <leader>gf :Git fetch<CR>
      nnoremap <leader>gr :Gread<CR>

      " --- indent guides (indentLine) ---
      let g:indentLine_char = '│'
      let g:indentLine_enabled = 1

      " --- airline ---
      let g:airline_powerline_fonts = 1

      " --- airline config: powerline symbols, no tabline ---
      let g:airline#extensions#tabline#enabled = 0
      let g:airline_section_a = airline#section#create_left(['mode'])
      let g:airline_section_b = airline#section#create_left(['branch', 'hunks'])
      let g:airline_section_c = airline#section#create_left(['readonly', 'filename', 'modified'])
      let g:airline_section_x = airline#section#create_right(['filetype'])
      let g:airline_section_y = airline#section#create_right(['fileencoding', 'fileformat'])
      let g:airline_section_z = airline#section#create_right(['linenr', 'maxlinenr', 'column'])
      " Diagnostics (if using ALE, coc, or syntastic)
      let g:airline#extensions#ale#enabled = 1
      let g:airline#extensions#coc#enabled = 1
      let g:airline#extensions#syntastic#enabled = 1
    '';

  };
}
