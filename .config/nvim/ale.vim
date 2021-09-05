" use the globally installed eslint
let g:ale_javascript_eslint_use_global=1

" clear the background in the gutter for the linting icons
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" only run the linters I ask for
let g:ale_linters_explicit = 1

let g:ale_open_list = 1

" use a location list for linting errors
let g:ale_set_loclist = 1
let g:ale_list_window_size = 5

" php standards
let g:ale_php_phpcbf_standard='./ruleset.xml'
let g:ale_php_phpcs_standard='./ruleset.xml'
" let g:ale_php_phpmd_ruleset='ruleset.xml'

" add linting issue details to the airline bar
let g:airline#extensions#ale#enabled = 1

" set the linters we want to use with ale
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'php': ['php', 'phpstan'],
    \ }

let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'php': ['php_cs_fixer', 'phpcbf']
    \ }

" when we save, fix linting issues
let g:ale_fix_on_save = 1
