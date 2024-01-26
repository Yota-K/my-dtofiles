-- ホバーしてる単語をカレントディレクトリ内から検索
return {
  "pechorin/any-jump.vim",
  cmd = "AnyJump",
  config = function()
    vim.cmd([[
      " agではなく、ripgrepを使用する
      let g:any_jump_search_prefered_engine = 'rg'
      " Custom ignore files
      let g:any_jump_ignored_files = ['log', 'logs', 'images', 'imgs', 'img', 'node_modules', 'out', 'build', 'vendor', '.git', 'jquery-*.js', '*.bak', '*.map', '*.tmp', '*.temp']
    ]])
  end,
}
