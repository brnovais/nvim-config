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
NEOVIM=v0.10.0
curl -LO https://github.com/neovim/neovim/releases/download/$NEOVIM/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo rm -rf /usr/local/nvim
sudo mv squashfs-root /usr/local/nvim
rm -rf nvim.appimage squashfs-root
```

If it's the first install, add it to `alternatives`.

```sh
sudo update-alternatives --install /usr/bin/nvim nvim /usr/local/nvim/AppRun 110
sudo update-alternatives --install /usr/bin/vi vi /usr/local/nvim/AppRun 110
sudo update-alternatives --install /usr/bin/vim vim /usr/local/nvim/AppRun 110
```

# Configure

Clone this repository, open Neovim and wait for
[lazy.nvim](https://github.com/folke/lazy.nvim) to sync plugins.
Restart Neovim and everything should be working properly.

```sh
git clone --depth 1 https://github.com/brnovais/nvim-config.git ~/.config/nvim
```

# Update

Update to newest personal configuration.

```sh
cd ~/.config/nvim
git pull
```

# Cleanup

It's easier to remove old settings, but be careful with custom stuff!

```sh
rm -rf ~/.local/share/nvim
```
