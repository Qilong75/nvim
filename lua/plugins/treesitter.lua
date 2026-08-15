-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  main = "nvim-treesitter",
  opts = {
    install_dir = vim.fn.stdpath "data" .. "/site",
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    -- Enable Neovim's built-in Treesitter highlighting for configured languages.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "vim", "go", "gomod", "gosum", "gowork" },
      ---@param args { buf: integer }
      callback = function(args) vim.treesitter.start(args.buf) end,
      desc = "Start Treesitter highlighting",
    })
  end,
}
