## Showcase

![demo1](https://github.com/arturgoms/nvim/blob/main/images/1.png)
![demo2](https://github.com/arturgoms/nvim/blob/main/images/2.png)
![demo3](https://github.com/arturgoms/nvim/blob/main/images/3.png)

## Plugins:

Not all but the main ones

- Core
  - [Packer](https://github.com/wbthomason/packer.nvim") -> Manage Plugins
  - [Plenary](https://github.com/nvim-lua/plenary.nvim) -> Dependence for a lot of plugins
  - [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) -> File Explorer
  - [Bufferline](https://github.com/akinsho/bufferline.nvim) -> Show buffers in little tabs
- Appearance
  - [Ayu Theme](https://github.com/Shatur/neovim-ayu) -> Ayu colorsheme
  - [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim) -> Gruvbox colorsheme
  - [Web Devicons](https://github.com/kyazdani42/nvim-web-devicons) -> Add icons to vim
  - [Alpha](https://github.com/goolord/alpha-nvim) -> Dashboard
  - [Navic](https://github.com/SmiteshP/nvim-navic) -> Show context on winbar
- Utils
  - [Whichkey](https://github.com/folke/which-key.nvim) -> Tools to show keymaps helper
  - [Harpoon](https://github.com/ThePrimeagen/harpoon) -> Quick switch between files
  - [Bbye](https://github.com/moll/vim-bbye) -> Better way to close buffers
  - [Scope](https://github.com/tiagovla/scope.nvim) -> Focus on one tab when creating new ones
  - [Maximizer](https://github.com/szw/vim-maximizer) -> Focus on one buffer
  - [Surround](https://github.com/kylechui/nvim-surround) -> Surround words with what you want
  - [Comment](https://github.com/numToStr/Comment.nvim) -> Comment stuff
  - [Telescope](https://github.com/nvim-telescope/telescope.nvim) -> LSP and Helpers
  - [Cmp](https://github.com/hrsh7th/nvim-cmp) -> Auto completions
  - [Auto Session](https://github.com/rmagatti/auto-session) -> Auto create and restore sessions
  - [Vista](https://github.com/liuchengxu/vista.vim) -> Vizualizer for ctags

## Maybe Plugins:

Not in the system but may be in the future

- [undotree](https://github.com/mbbill/undotree) -> Buffer that shows the history of undo

## Keybinds:

WIP: but you can hit space to see whichkey

- Normal/Insert `S-Up` -> Move line 1 to top
- Normal/Insert `S-Down` -> Move line 1 to Botton
- Normal `S-u` -> Open quick menu Harpoon
- Normal `S-l` -> Add harpoon bookmark
- Normal `S-h` -> Go to 1 file in Harpoon
- Normal `S-j` -> Go to 2 file in Harpoon
- Normal `S-a` -> Go to 3 file in Harpoon
- Normal `S-x` -> Go to 4 file in Harpoon

## Vim Motions:

WIP: i keep forgeting these

- `ciw` -> delete the hole word that the cursor is in
- `yap` -> yank the hole block of code
- `ys<motiom/ex:iw><some_char>` -> surround the word with that char
- `ds<some_char>` -> delete the surround
- `cs<some_char><another_char>` -> change the surround from some_char to another_char
- `zz` -> put current line on the middle of the screen
- `zt` -> put current line on the top of the screen
- `zb` -> put current line on the bottom of the screen
- `gc` -> toggle inline comment
- `gb` -> toggle inline comment

## Install:

```shell
mv ~/.config/nvim/ ~/.config/nvim.bak
git clone https://github.com/arturgoms/nvim.git ~/.config/nvim
```

## TODO:

- [x] When closing the last buffer also closes the neotree and vista and get out of vim
- [x] Make function to close vim and save session even with a lot of buffers opened (`<leader>q`)

## Credits:

A lot from here is a combination os things that i did but also a lot from others config.

- [Lunarvim]
- [AstroNvim]
