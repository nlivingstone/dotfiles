<div align="center">

<img src="https://github.com/nlivingstone/dotfiles/assets/1995501/a294c5cb-f4d0-4c89-bbcf-41541dd3dea5" height="150px" alt="Dotfiles">

![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/m/nlivingstone/dotfiles/master?style=for-the-badge&logo=github)
![GitHub repo size](https://img.shields.io/github/repo-size/nlivingstone/dotfiles?style=for-the-badge)

</div>


* 🌈 [TokyoNight](https://github.com/folke/tokyonight.nvim) 
* ✍️  [Neovim](https://neovim.io/) with [Neovide](https://neovide.dev/)
* 🐚 [Oh My ZSH!](https://ohmyz.sh/) with [Starship Prompt](https://starship.rs/)
* ☎️  [iTerm2](https://iterm2.com/)



## Install
```
git clone git@github.com:nlivingstone/dotfiles.git
cd dotfiles
ln -s nvim ~/.config/nvim
ln -s neovide ~/.config/neovide
ln -s starship.toml ~/.config/starship.toml
ln -s zsh/.zshrc ~/.zshrc
```

## Neovim

### Plugins
- [auto-session](https://github.com/rmagatti/auto-session): Automatic session managementA
- [buffertabs.nvim](https://github.com/tomiis4/BufferTabs.nvim): Floating tabline
- [conform.nvim](https://github.com/stevearc/conform.nvim): Automatic document formatting
- [laravel.nvim](https://github.com/adalessa/laravel.nvim): Enhanced development experience of Laravel projects 
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): Sidebar file browser


### Keybinds

#### Navigation

| Keybind                 | Description                       |
| ----------------------- | --------------------------------- |
| <kbd>CMD</kbd> + <kbd>RIGHT</kbd>         | Move to next buffer               |
| `CMD` + `LEFT`          | Move to previous buffer           |
| `CMD` + `b`             | Open Neotree                      |
| `CMD` + `SHIFT` + `b`   | Focus Neotree                     |

#### Laravel + PHP

| Keybind      | Description             |
| ------------ | ----------------------- |
| `<leader>la` | Run artisan command     |
| `<leader>lr` | List application routes |
| `<leader>su` | Sort use statements     |

