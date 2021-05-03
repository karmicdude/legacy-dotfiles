# KarmicDude dotfiles #

This repository contains a set of configuration files for the `bash` shell, `DE` and programs that I use most regularly.

My favorite OS is [Arch Linux][Arch Linux], so package names and config paths are relevant for it and may a bit differ for other distros.

In addition, I use two workstations (PC and a laptop), which have slightly differences in the configs. So some configs are separated for use on different devices.

The installation itself requires [GNU Stow][GNU Stow] - awesome tool as a symlink manager.

## Dependencies ##

* [GNU Stow][GNU Stow] - Symlink manager
* [bat][bat] - A `cat` clone with syntax highlighting and Git integration
* [git][git] - most popular source distributed version control system
* [gnupg][gnupg] - OpenPGP standard implementation
* [kitty][kitty] - Cross-platform, fast, feature-rich, GPU based terminal
* [neofetch][neofetch] - A command-line system information tool
* [pinentry-qt][pinentry] - GUI application used to enter passphrases
* [starship][starship] - The minimal, blazing-fast and infinitely customizable prompt

```bash
# Install yay as AUR helper
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

# Install deps
yay -S \
  bat \
  gnupg \
  imagemagick \
  kitty \
  neofetch \
  openssh \
  pinentry \
  starship \
  stow

# Add stow default settings
cat << EOF > ~/.stowrc
--target=~
--verbose
EOF

# Starship requires the Nerd font package for your terminal to display icons.
# You can choose any of these. I prefer nerd-fonts-ubuntu-mono
yay -S \
  otf-nerd-fonts-fira-code \
  nerd-fonts-dejavu-complete \
  nerd-fonts-fantasque-sans-mono \
  nerd-fonts-iosevka \
  nerd-fonts-jetbrains-mono \
  nerd-fonts-mononoki \
  nerd-fonts-roboto-mono \
  nerd-fonts-ubuntu-mono
```

### SSH Agent ###

```bash
# Enable ssh-agent service
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
```

**NOTE:** If for some reason you decide to disable `ssh-agent.service`,
then the symlink to the source file in stow project will be deleted.
To bring it back, you can run from `repo_path/dotfiles` command `stow ssh-agent`

## Features ##

* Disabled KDE [**Baloo**][KDE Baloo] service

[Arch Linux]: https://wiki.archlinux.org/index.php/Arch_Linux
[GNU Stow]: https://www.gnu.org/software/stow/
[kitty]: https://github.com/kovidgoyal/kitty
[bat]: https://github.com/sharkdp/bat
[neofetch]: https://github.com/dylanaraps/neofetch
[git]: https://git-scm.com
[gnupg]: https://gnupg.org
[pinentry]: https://wiki.archlinux.org/index.php/GnuPG#pinentry
[KDE Baloo]: https://wiki.archlinux.org/index.php/Baloo
[starship]: https://starship.rs
