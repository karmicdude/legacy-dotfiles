# KarmicDude dotfiles #

This repository contains a set of configuration files for the `bash` shell, `DE` and programs that I use most regularly.

My favorite OS is [Arch Linux][Arch Linux], so package names and config paths are relevant for it and may a bit differ for other distros.

In addition, I use two workstations (PC and a laptop), which have slightly differences in the configs. So some configs are separated for use on different devices.

The installation itself requires [GNU Stow][GNU Stow] - awesome tool as a symlink manager.

## Dependencies ##

* [GNU Stow][GNU Stow] - Symlink manager
* [kitty][kitty] - Cross-platform, fast, feature-rich, GPU based terminal
* [bat][bat] - A `cat` clone with syntax highlighting and Git integration
* [neofetch][neofetch] - A command-line system information tool
* [git][git] - most popular source distributed version control system

```bash
# Install deps
yay -S \
  stow \
  kitty \
  imagemagick \
  bat \
  neofetch
```

## Features ##

* Disabled KDE [**Baloo**][KDE Baloo] service


[Arch Linux]: https://wiki.archlinux.org/index.php/Arch_Linux
[GNU Stow]: https://www.gnu.org/software/stow/
[kitty]: https://github.com/kovidgoyal/kitty
[bat]: https://github.com/sharkdp/bat
[neofetch]: https://github.com/dylanaraps/neofetch
[git]: https://git-scm.com
[KDE Baloo]: https://wiki.archlinux.org/index.php/Baloo
