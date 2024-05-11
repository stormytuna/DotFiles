return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
    vim.keymap.set("n", "<C-N>", ":Neotree filesystem reveal left toggle<CR>")
    vim.keymap.set("n", "<C-b>", ":Neotree buffers reveal right<CR>")
    vim.keymap.set("n", "<C-B>", ":Neotree buffers reveal right toggle<CR>")
    vim.keymap.set("n", "<leader>1", ":b 1<CR>")
    vim.keymap.set("n", "<leader>2", ":b 2<CR>")
    vim.keymap.set("n", "<leader>3", ":b 3<CR>")
    vim.keymap.set("n", "<leader>4", ":b 4<CR>")
    vim.keymap.set("n", "<leader>5", ":b 5<CR>")
    vim.keymap.set("n", "<leader>6", ":b 6<CR>")
    vim.keymap.set("n", "<leader>7", ":b 7<CR>")
    vim.keymap.set("n", "<leader>8", ":b 8<CR>")
    vim.keymap.set("n", "<leader>9", ":b 9<CR>")
  end,
}

