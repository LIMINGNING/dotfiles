" comments in vimscript start with a `"`.

" if you open this file in vim, it'll be syntax highlighted for you.

" vim is based on vi. setting `nocompatible` switches from the default
" vi-compatibility mode and enables useful vim functionality. this
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because vim automatically enters nocompatible mode if that file
" is present. but we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then vim started with
" `vim -u foo`).
set nocompatible

" turn on syntax highlighting.
syntax on

" disable the default vim startup message.
set shortmess+=i

" show line numbers.
set number

" this enables relative line numbering mode. with both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" this is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" the backspace key has slightly unintuitive behavior by default. for example,
" by default, you can't backspace before the insertion point set with 'i'.
" this configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" by default, vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. this is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. we find
" hidden buffers helpful enough to disable this protection. see `:help hidden`
" for more information on this.
set hidden

" this setting makes search case-insensitive when all characters in the string
" being searched are lowercase. however, the search becomes case-sensitive if
" it contains any capital letters. this makes searching more convenient.
set ignorecase
set smartcase

" enable searching as you type, rather than waiting till you press enter.
set incsearch

" unbind some useless/annoying default key bindings.
nmap q <nop> " 'q' in normal mode enters ex mode. you almost never want this.

" disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" enable mouse support. you should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" try to prevent bad habits like using the arrow keys for movement. this is
" not the only possible bad habit. for example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. the former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" do this in normal mode...
nnoremap <left>  :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up>    :echoe "use k"<cr>
nnoremap <down>  :echoe "use j"<cr>
" ...and in insert mode
inoremap <left>  <esc>:echoe "use h"<cr>
inoremap <right> <esc>:echoe "use l"<cr>
inoremap <up>    <esc>:echoe "use k"<cr>
inoremap <down>  <esc>:echoe "use j"<cr>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" inoremap { {<cr>}<up><enter>
set smartindent
inoremap { {}<left>
inoremap ( ()<left>
inoremap < <><left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
