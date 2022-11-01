# Introduction

Neovim configuration that I use in my development environment.

# Install

Make sure Neovim is installed.

```sh
sudo apt-get install neovim
```

Maybe it's worth it to install a newer version.
Check the [release](https://github.com/neovim/neovim/releases) page for updates.

```sh
curl --location https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb --output nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
```

# Configure

Clone this repository, open Neovim and wait for packer to sync plugins.
Restart Neovim and everything should be working properly.

```sh
git clone --depth 1 https://github.com/brnovais/nvim-config.git ~/.config/nvim
```

This is usually not required, but the plugin manager can be manually installed.

```sh
git clone --depth=1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
