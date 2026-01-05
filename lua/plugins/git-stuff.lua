return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })
    end
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = true,
    keys = {
      { "<leader>gm", "<cmd>DiffviewOpen<cr>", desc = "Solve Conflicts (Diffview)" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
  },

  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%Y-%m-%d',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = "Git Graph",
      },
    },
  },
}
