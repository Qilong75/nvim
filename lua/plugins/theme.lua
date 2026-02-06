-- Matrix 主题
return {
  "luisiacc/the-matrix.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "thematrix"
  end,
}
