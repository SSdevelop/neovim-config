-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "http://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
augroup end
]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- colorscheme
	use("bluz71/vim-nightfly-colors")

	-- tmux and window maximizer
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer") -- maximizer a window pane in split mode

	-- essentials
	use("tpope/vim-surround") -- surround characters with quotes using ys and ds
	use("vim-scripts/ReplaceWithRegister") -- yw to copy text and grw to replace

	-- comments
	use("numToStr/Comment.nvim") -- gcc to (un)comment and gc'n''j' for (un)comment group a specific number of lines (n) up or down (j or k)

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code style icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- tree-sitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			--- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- none-ls
	use("nvimtools/none-ls.nvim")

	-- contexts
	use("nvim-treesitter/nvim-treesitter-context")

	use("lukas-reineke/indent-blankline.nvim")

	if packer_bootstrap then
		require("packer").sync() -- PackerSync
	end
end)
