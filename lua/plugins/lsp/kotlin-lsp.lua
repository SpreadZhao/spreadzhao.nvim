vim.lsp.config('kotlin-lsp', {
  cmd = { 'kotlin-ls', '--stdio' },
  single_file_support = true,
  filetypes = { 'kotlin' },
  root_markers = { 'build.gradle', 'build.gradle.kts', 'pom.xml' },
})
vim.lsp.enable 'kotlin-lsp'
