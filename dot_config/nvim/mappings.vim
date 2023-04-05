" Map toggle NERDTree to Leader-t
map <Leader>t :NERDTreeToggle<CR>

" Map telescope-file-browser to Leader-p
nnoremap <Leader>p :Telescope file_browser<CR>

" Map bufferline to Leader-1,2,3,4,5,6,7,8,9
for i in range(1, 9)
  execute 'nnoremap <Leader>' . i . ' :BufferLineGoToBuffer ' . i . '<CR>'
endfor

" Map buffer destroy to Leader=backspace
nnoremap <Leader><BS> :bd<CR>

" Map exit to Leader-]
nnoremap <Leader>] :qa<CR>

" Map format to Leader-f
nnoremap <silent> <Leader>f :lua vim.lsp.buf.format()<CR>

" Map lspsaga to Leader-k
nnoremap <silent> <Leader>k :Lspsaga hover_doc<CR>

