## Showcase

![demo1](https://github.com/arturgoms/nvim/blob/main/images/1.png)
![demo2](https://github.com/arturgoms/nvim/blob/main/images/2.png)
![demo3](https://github.com/arturgoms/nvim/blob/main/images/3.png)
![demo4](https://github.com/arturgoms/nvim/blob/main/images/4.png)

## Plugins:

WIP

- [Harpoon](https://github.com/ThePrimeagen/harpoon) -> Quick switch betwheen files

## Keybinds:

WIP but you can hit space to see whichkey

- Normal/Insert `S-Up` -> Move line 1 to top
- Normal/Insert `S-Down` -> Move line 1 to Botton
- Normal `S-u` -> Open quick menu Harpoon
- Normal `S-l` -> Add harpoon bookmark
- Normal `S-h` -> Go to 1 file in Harpoon
- Normal `S-j` -> Go to 2 file in Harpoon
- Normal `S-a` -> Go to 3 file in Harpoon
- Normal `S-x` -> Go to 4 file in Harpoon

## Vim Motions:

- `yap` -> yank the hole block of code
- `csw<some_char>` -> surround the word with that char
- `cs<some_char><another_char>` -> change the surround from some_char to another_char

## Install:

```shell
mv ~/.config/nvim/ ~/.config/nvim.bak
git clone https://github.com/arturgoms/nvim.git ~/.config/nvim
```

## TODO:

- [] When closing the last buffer also closes the neotree and vista and get out of vim
- [] Make function to close vim and save session even with a lot of buffers opened (<leader>q)
