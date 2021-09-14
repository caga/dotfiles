" Başlangıç:9 Mart 2021
" Edit:
"<Vim-Plugins>
call plug#begin('~/.vim/plugged') " https://github.com/junegunn/vim-plug
    Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
    Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
    Plug 'vifm/vifm.vim' " https://github.com/vifm/vifm.vim
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " https://github.com/SirVer/ultisnips  " https://github.com/honza/vim-snippets
    Plug 'tweekmonster/django-plus.vim' " https://github.com/tweekmonster/django-plus.vim 
    Plug 'vim-syntastic/syntastic' " https://github.com/vim-syntastic/syntastic
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' } " https://github.com/ycm-core/YouCompleteMe
    Plug 'vim-scripts/taglist.vim' "  https://github.com/vim-scripts/taglist.vim
    Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
    Plug 'dense-analysis/ale' " https://github.com/dense-analysis/ale
    Plug 'sillybun/vim-repl' " https://github.com/sillybun/vim-repl
    Plug 'yang-ling/rst' " https://github.com/yang-ling/rst
    Plug 'gu-fan/riv.vim' "https://github.com/gu-fan/riv.vim
    Plug 'gu-fan/InstantRst' " https://github.com/gu-fan/InstantRst
    Plug 'morhetz/gruvbox'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'Yggdroot/indentLine' 
    " Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " https://github.com/python-mode/python-mode
call plug#end()

"<Basic Ayarlar>"

    filetype plugin indent on
    syntax on
    set number

    "<Basic Key Mapping>
        let mapleader=","
        map <space>f :tab split<CR>
        map <space>k :tabc<CR>
        imap kj <esc>
        "<system vim clipboard mappings>
        noremap <Leader>y "*y
        noremap <Leader>p "*p
        noremap <Leader>Y "+y
        noremap <Leader>P "+p

	"<shiftwidt,tabstop and softtabstop for Python Files>
	autocmd FileType python set sw=4
	autocmd FileType python set ts=4
	autocmd FileType python set sts=4

	" <fzf>
	map <leader>f :Files<CR>
	map <leader>g :Rg<CR>
	map <leader><Enter> :Buf<CR>

	"<vifm>
	map <leader>e :Vifm<CR>

	"<vim-repl>
	nnoremap <leader>r :REPLToggle <CR>
	map <leader>h :REPLHide <CR>
	
	" <youcompleteme>
	nnoremap<leader>ü :YcmCompleter GoTo<CR>


	autocmd Filetype python nnoremap <leader>1 <Esc>:REPLDebug<Cr>
	autocmd Filetype python nnoremap <leader>2 <Esc>:REPLPDBN<Cr>
	autocmd Filetype python nnoremap <leader>3 <Esc>:REPLPDBS<Cr>" nnoremap <leader> d :REPLDebug
	autocmd Filetype python nnoremap <leader>4 <Esc>:REPLDebugStopAtCurrentLine<Cr>
	" autocmd Filetype python nnoremap <leader><ESC>b :REPLDebugStopAtCurrentLine<CR>
	" autocmd Filetype python nnoremap <leader><ESC>k :REPLPDBN<CR>
	" autocmd Filetype python nnoremap <leader><ESC>m :REPLPDBS<CR>
	
	"<taglist>
	nnoremap <silent>t :TlistToggle<CR>

" <PLUGin Settings>

    "<YOUCOMPLETEME>
        let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
        let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
        let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
        let g:ycm_complete_in_comments = 1 " Completion in comments
        let g:ycm_complete_in_strings = 1 " Completion in string

    "<Ultisnips>
        let g:UltiSnipsExpandTrigger       = "<c-j>"
        let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
        let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
        let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

    "<Surround> Settings for django templates
        let g:surround_{char2nr("v")} = "{{ \r }}"
        let g:surround_{char2nr("{")} = "{{ \r }}"
        let g:surround_{char2nr("%")} = "{% \r %}"
        let g:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
        let g:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
        let g:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
        let g:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
        let g:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

	"<Ale> Python linter and fixer plugin
	let g:ale_linters={'python':['flake8','pydocstyle']}    
	let g:ale_fixers={'*':[],'python':['black','isort']}
	let g:ale_fix_on_save=1

    "<Syntastic>
       set statusline+=%#warningmsg#
       set statusline+=%{SyntasticStatuslineFlag()}
       set statusline+=%*

       let g:syntastic_always_populate_loc_list = 1
       let g:syntastic_auto_loc_list = 1
       let g:syntastic_check_on_open = 1
       let g:syntastic_check_on_wq = 0
       let g:syntastic_python_checkers=['pylint']

	" <Fzf>
    " Open files in vertical horizontal split
    nnoremap <silent> <Leader>v :call fzf#run({
    \   'right': winwidth('.') / 2,
    \   'sink':  'vertical botright split' })<CR>

    " Open files in horizontal split
    nnoremap <silent> <Leader>s :call fzf#run({
    \   'down': '40%',
    \   'sink': 'botright split' })<CR>
"<InstantRst>
let g:instant_rst_localhost_only=1    
"<Gruv color sheme>
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
