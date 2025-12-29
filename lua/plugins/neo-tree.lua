return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- Load immediately so icons work
  
  -- The only keymap you need:
  keys = {
    { "<C-n>", ":Neotree filesystem toggle left<CR>", desc = "Toggle Neo-tree" },
  },
  
  -- Optional: Custom settings
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Check this if you want to see hidden files (dotfiles)
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
