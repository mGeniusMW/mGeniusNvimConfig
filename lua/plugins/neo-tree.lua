return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    keys = {
        { "<C-n>", ":Neotree filesystem toggle left<CR>", desc = "Toggle Neo-tree" },
    },

    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = true,
            },
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function(file_path)
                    -- auto close
                    require("neo-tree.command").execute({ action = "close" })
                end
            },
        },
    },  
}
