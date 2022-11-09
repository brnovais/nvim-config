# Introduction

Neovim configuration that I use in my development environment.

# Install

Make sure Neovim is installed.

```sh
sudo apt-get install neovim
```

Maybe it is worth installing a newer version.
Check the [release](https://github.com/neovim/neovim/releases) page for updates.

```sh
NEOVIM=v0.8.0
curl -L https://github.com/neovim/neovim/releases/download/$NEOVIM/nvim-linux64.deb -o nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm -rf nvim-linux64.deb
```

# Configure

Clone this repository, open Neovim and wait for packer to sync plugins.
Restart Neovim and everything should be working properly.

```sh
git clone --depth 1 https://github.com/brnovais/nvim-config.git ~/.config/nvim
```
