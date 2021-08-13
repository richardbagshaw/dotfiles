nmap <silent> <leader>tn :TestNearest --colors=always<CR>
nmap <silent> <leader>tf :TestFile --colors=always<CR>
nmap <silent> <leader>tt :TestSuite --colors=always<CR>
nmap <silent> <leader>tl :TestLast --colors=always<CR>
nmap <silent> <leader>tv :TestVisit --colors=always<CR>
nmap <silent> <leader>ts :TestToggleStrategy<CR>

let g:shtuff_receiver = 'tests'

" ------------------------------------------------------------------------------
" # Manually Toggle Test Strategy
" ------------------------------------------------------------------------------

let g:test#strategy = "shtuff"

function! TestToggleStrategy()
  if get(g:, 'test#strategy', 'floaterm') == 'floaterm'
    let g:test#strategy = "shtuff"
    echo "Test Strategy: shtuff into test"
  else
    let g:test#strategy = "floaterm"
    echo "Test Strategy: floaterm"
  endif
endfunction

command! TestToggleStrategy call TestToggleStrategy()

let test#php#runner = 'phpunit'
let test#php#phpunit#executable = 'composer test-run-plain -- '

let g:test#echo_command = 0

