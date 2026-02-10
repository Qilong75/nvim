-- Ayu 主题
return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "ayu"
  end,
}
