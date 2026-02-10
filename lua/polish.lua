-- Custom tweaks loaded last

-- NOTE: [AfterHook]
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Auto-reload files changed outside of Neovim (e.g., opencode)
vim.o.autoread = true
-- Check for file changes within ~0.5s idle (<= 1s requirement)
vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- Notify after an external change is detected and reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.notify("已检测到外部修改并重载", vim.log.levels.INFO)
    end)
  end,
})
