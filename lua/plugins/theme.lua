-- everforest 主题
return {
  "neanias/everforest-nvim",
  config = function()
    require("everforest").setup {
      background = "medium", -- 可选: "soft", "medium", "hard"
      transparent_background = false, -- 设置为 true 可启用透明背景
      disable_italics = false, -- 设置为 true 可禁用斜体
      dim_inactive_windows = false, -- 设置为 true 可使非活动窗口变暗
    }
    -- 应用主题
    vim.cmd.colorscheme "everforest"
  end,
}
