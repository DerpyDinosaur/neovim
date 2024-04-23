return {
    -- Theme
    {
        "Shatur/neovim-ayu",
        priority = 1000,
        config = function()
            require('ayu').colorscheme()
            vim.cmd("colorscheme ayu-dark")
        end
    },

    -- Neovim Line at the bottom
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                icons_enabled = true,
                theme = 'ayu_dark',
            })
        end
    },

    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Tree Sitter
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     build = ":TSUpdate",
    --     config = function ()
    --         local configs = require("nvim-treesitter.configs")

    --         configs.setup({
    --             ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "python" },
    --             sync_install = false,
    --             highlight = { enable = true },
    --             indent = { enable = true },
    --         })
    --     end
    -- },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
}