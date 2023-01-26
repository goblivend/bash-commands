# Nvim Config

## Setup

### nvim packet manager 

{Packer repo}[https://github.com/wbthomason/packer.nvim]

Clone the repository using :
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then add these lines to a file such as `packer.lua` in your setup subfolder and add these lines

```lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

end)
```

Restart nvim and should be ready to source the file using `:so`
you can try it by using `:PackerSync`

### Telescope Fuzzy Finder

(fuzzy finder repo)[https://github.com/nvim-telescope/telescope.nvim]

Add these lines to the `packer.lua` file right before the `end)` line 
 
```lua
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
```
Telescope is almost installed, you just need to `:so` to source `packer.lua`, then `:PackerSync` to install Telescope

Once you're done, you'll need to map new keys to Telescope

For this create a file in `nvim/after.plugin/telescope.lua` and fill it with the new keymap
```lua
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
```
This will add the keymaps `<leader>pf` (`<space>pf` with the current setup) to look at the general files
And `<C-p>` to look at git files
And `<leader>ps` to search string in files

### ColorScheme and bg

Now we want to set a color scheme so you can download a personal one, I go with `slate` which is default

then in the file `nvim/after/colors.lua` insert those lines

```lua
function SetColorScheme(color)
	color = color or "slate"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetColorScheme()
```

### TreeSitter

Now it's time to use TreeSitter to get better colors and fast stuff

(TreeSitter repo)[https://github.com/nvim-treesitter/nvim-treesitter]

You can just insert this line in the `packer.lua` file :
```lua
	use ({ 'nvim-treesitter/nvim-treesitter', {run = ':TsUpdate'})
```

just resync the packages using `:PackerSync` and here we go

Now we need to set it up, just create a file `nvim/after/plugin/treesitter.lua`

and enter those lines 
```lua

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "javascript", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
```

You can now source the file using `:so` to set everything up and some downloading should be happenimg

You now have a parser taking care of well coloring your nvim

### Harpoon
(Harpoon repo)[https://github.com/ThePrimeagen/harpoon]

I don't really use it but it can be usefull if you want ot have easy access to selected files, first insert this line to `packer.lua`

```lua
	use ( 'theprimeagen/harpoon')
```
and inside `after/plugin/harpoon.lua` insert those

```lua
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
```

### UndoTree

don't use it either but is quite nice you can look at it's repo (UndoTree)[https://github.com/mbbill/undotree]

### Vim fugitive (git integration)

(vim fugitive Repo)[https://github.com/tpope/vim-fugitive]

just add the line in `packer.lua`

```lua
	set ( 'tpope/vim-fugitive' )
```

and this line in `after/pluign/figitive.lua`

```lua
vim.keymap.set("n", "<leader>gs", vim.cnd.Git)
```

### LSP-0

For the LSP, I took (LSP-0)[https://github.com/VonHeikemen/lsp-zero.nvim]

For this add those lines to the `packer.lua`

```lua
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
```

Once you're done, you'll need to set up your version of the lsp, 
for this add either these lines to your `nvim/after/plugin/lsp.lua` or find a better setup

```lua
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
```
Then each time you'll open a new type of file, the plugin will ask you which matching lsp you want to install, you'll have the possibility to see all available plugins 





