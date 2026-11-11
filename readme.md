# neovim

Configuration for [neovim][1].

## installation oneliner

```bash
curl -fsSL https://raw.githubusercontent.com/managanemeke/neovim/main/install.sh | bash
```

## install all on android-termux

```bash
pkg install curl git lua5.1 luarocks neovim -y
```

## install curl and git

```bash
pkg install curl git -y
```

## install lua

```bash
pkg install lua5.1 luarocks -y
```

## install neovim


```bash
pkg install neovim -y
```

```bash
sudo apt install neovim
```

```bash
sudo pacman -S neovim
```

## check neovim version

```bash
nvim --version
```

## create neovim link

```bash
sudo ln -s /usr/bin/nvim /usr/bin/neovim
```

## clone this repository

```bash
cd ~/.config
```

```bash
git clone git@github.com:managanemeke/nvim-config.git nvim
```

```bash
cd nvim
```

## install packer and plugins

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```bash
nvim lua/plugins.lua
```

```vim
:PackerSync
```

## install lsp

```vim
:Mason
```

- lua-language-server (lua)
- pyright (python)

## links

- [one-nvim-to-rule-them-all](https://habr.com/ru/articles/706110/)
- [fastest-vimer](https://youtu.be/y6VJBeZEDZU?si=_-0nfEhPhGH4DaEQ)

[1]: https://github.com/neovim/neovim "neovim"

