vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

require("pam").manage({
    { source = "mvllow/pam.nvim" },
    { source = "rose-pine/neovim", as = "rose-pine" },
    {
        source = "nvim-treesitter/nvim-treesitter",
        post_checkout = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup()
        end
    },
    {
        source = "ThePrimeagen/harpoon",
        as = "baboon",
        branch = "harpoon2",
        dependencies = {
            { source = "nvim-lua/plenary.nvim" }
        }
    },
    { source = "nvim-tree/nvim-web-devicons" },
    {
	source = "goolord/alpha-nvim",
	config = function()
      	local startify = require("alpha.themes.startify")
      	startify.file_icons.provider = "devicons"
      	require("alpha").setup(
            startify.config
      	)
   	end,
    },
    { source = "hrsh7th/nvim-cmp" },
    { source = "hrsh7th/cmp-nvim-lsp" },
    { source = "hrsh7th/cmp-buffer" },
    { source = "hrsh7th/cmp-path" },
    { source = "hrsh7th/cmp-cmdline" },
    { source = "L3MON4D3/LuaSnip" },
    { source = "hrsh7th/cmp-nvim-lua" },
    { source = "williamboman/mason.nvim" },
    { source = "williamboman/mason-lspconfig.nvim" },
    { source = "neovim/nvim-lspconfig",
    	config = function()
      	-- configuración de Mason para instalar automáticamente algunos LSPs
      	require("mason").setup()
      	require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "gopls", "lua_ls" }
      	})

      	local nvim_lsp = require("lspconfig")
      	local on_attach = function(client, bufnr)
        -- configura keymaps y otras opciones para el buffer
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      	end

        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      	nvim_lsp.pyright.setup({ on_attach = on_attach })
      	nvim_lsp.gopls.setup({ on_attach = on_attach })
      	nvim_lsp.lua_ls.setup({ on_attach = on_attach })
    	end,
  },
})

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

require("rose-pine").setup({
  variant = "default",
})

vim.cmd("colorscheme rose-pine")
