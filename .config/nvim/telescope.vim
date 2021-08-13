nmap <C-p> :Telescope find_files<CR>
nmap <C-g> :Telescope git_files<CR>
nmap <leader>bb :Telescope buffers<CR>
nmap <leader>ff :Telescope live_grep<CR>
nmap <leader>fs :Telescope coc document_symbols<CR>
" nmap <leader>ff :Telescope grep_string search=foo<CR>

lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = ">> ",
        file_ignore_patterns = { 'node_modules' },
        layout_config = {
            prompt_position = 'bottom',
            width = 0.75
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    },
}
require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
EOF
