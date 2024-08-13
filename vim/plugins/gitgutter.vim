nnoremap<leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hN :GitGutterPrevHunk<CR>
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
command Diff :GitGutterDiffOrig
