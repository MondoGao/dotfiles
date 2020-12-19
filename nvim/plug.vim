if !has('nvim')
	packadd! matchit
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Editor Enhancement
if exists('g:vscode')
	Plug 'asvetliakov/vim-easymotion'
else
	Plug 'easymotion/vim-easymotion'
endif
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
Plug 'nelstrom/vim-visual-star-search'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx,*.wpy"

Plug 'Valloric/MatchTagAlways'
Plug 'editorconfig/editorconfig-vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'jasonlong/vim-textobj-css'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'sgur/vim-textobj-parameter'
Plug 'jceb/vim-textobj-uri'
Plug 'Julian/vim-textobj-variable-segment'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Applications
if !exists('g:vscode')
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'mbbill/undotree'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'gregsexton/gitv'
	Plug 'kshenoy/vim-signature'
endif

if has('mac')
	Plug 'rizzatti/dash.vim'
	Plug 'zerowidth/vim-copy-as-rtf'
endif

" Workspace & File Management
if !exists('g:vscode')
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-ctrlspace/vim-ctrlspace'
	let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
	let g:CtrlSpaceUseTabline = 1
	" let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
	let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
	let g:CtrlSpaceSaveWorkspaceOnExit = 1
	Plug 'mileszs/ack.vim'
	Plug 'Shougo/denite.nvim'
	" Plug 'ervandew/supertab'
endif

" Auto Complete & Snippets
if !exists('g:vscode')
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --cs-completer --go-completer --js-completer' }
	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_insertion = 1
endif

" " deoplete is disabled by default, call #enable in ftplugins
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_hasSnippetSupport = 0

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

Plug 'w0rp/ale'
let g:ale_fix_on_save = 1

" UI
if !exists('g:vscode')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline_theme='codedark'
	" Plug 'gcmt/taboo.vim'
	" let g:taboo_tabline = 0
	"
	Plug 'flazz/vim-colorschemes'
	Plug 'tomasiser/vim-code-dark'

	Plug 'ryanoasis/vim-devicons'
	Plug 'nathanaelkane/vim-indent-guides'
	let g:indent_guides_enable_on_vim_startup = 1
	Plug 'luochen1990/rainbow'
	let g:rainbow_active = 1
endif

" Language Supports

"" Javascript/Typescript
" " Plug 'moll/vim-node'
" " let g:tsuquyomi_disable_default_mappings = 1
" " Plug 'pangloss/vim-javascript'
" " Plug 'neoclide/vim-jsx-improve'

" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" 
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'

"" HTML/XML
Plug 'digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete'
" Plug 'chemzqm/wxapp.vim'

"" CSS
" Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'stephenway/postcss.vim'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'

"" Others
" Plug 'elmcast/elm-vim'
" let g:elm_setup_keybindings = 0
" Plug 'reasonml-editor/vim-reason'
" Plug 'OrangeT/vim-csharp'
" Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-latex/vim-latex'
let g:tex_flavor='latex'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_level = 1
let g:vim_markdown_folding_disabled = 1

Plug 'jparise/vim-graphql'
Plug 'neovimhaskell/haskell-vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'rust-lang/rust.vim'

""" Plantuml
Plug 'aklt/plantuml-syntax'
let g:plantuml_executable_script = 'java -jar '.$HOME.'/Bin/plantuml.jar -tsvg $@'
Plug 'scrooloose/vim-slumlord'
Plug 'weirongxu/plantuml-previewer.vim'
let g:plantuml_previewer#plantuml_jar_path = $HOME.'/Bin/plantuml.jar'

Plug 'tyru/open-browser.vim'

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['json', 'css', 'markdown', 'elm', 'graphql']
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" Others
if has('mac')
	" Plug 'CodeFalling/fcitx-vim-osx'
endif

call plug#end()

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'

	let g:ackprg = 'ag --vimgrep'
else
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
