return { 
 "catppuccin/nvim",
  enabled = false,
  lazy = false,
  name = "catppuccin",
  priority = 100,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}
