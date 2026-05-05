-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Force enable autoformat globally
vim.g.autoformat = true

-- Alt+t → floating terminal with custom size (80% width, 70% height)
vim.keymap.set("n", "<M-t>", function()
  require("snacks").terminal(nil, {
    win = {
      style = "terminal",
      relative = "editor",
      width = 0.80, -- 80% of editor width
      height = 0.20, -- 20% of editor height
      row = 0.15, -- center vertically
      col = 0.10, -- center horizontally
    },
  })
end, { desc = "Toggle Floating Terminal (80x20%)" })

-- In terminal mode, allow Alt+t to close
vim.keymap.set("t", "<M-t>", "<cmd>close<cr>", { desc = "Close Floating Terminal" })

-- Delete without yanking (using black hole register)
vim.keymap.set("n", "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete to end of line without yanking" })
vim.keymap.set("n", "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set("v", "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set("n", "C", '"_C', { desc = "Change to end of line without yanking" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete character without yanking" })
vim.keymap.set("v", "x", '"_x', { desc = "Delete character without yanking" })

-- Alt + z to toggle wrap nowrap
vim.keymap.set("n", "<M-z>", function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    print("Wrap disabled")
  else
    vim.wo.wrap = true
    print("Wrap enabled")
  end
end, { desc = "Toggle Wrap" })
