# KarmicDude dotfiles #

This repository contains a set of configuration files for the `bash` shell, `DE` and programs that I use most regularly.

My favorite OS is [Arch Linux][Arch Linux] and [Plasma][Plasma] en (now), so package names and config paths are relevant for it and may a bit differ for other distros.

In addition, I use two workstations (PC and a laptop), which have slightly differences in the configs. So some configs are separated for use on different devices.

The installation itself requires [GNU Stow][GNU Stow] - awesome tool as a symlink manager.

# Table of contents #
<!-- TOC -->

- [Dependencies](#dependencies)
- [How to use it?](#how-to-use-it)
- [Dependencies configuration](#dependencies-configuration)
    - [SSH Agent](#ssh-agent)
    - [Gist](#gist)
    - [Fonts](#fonts)
    - [Google Chrome](#google-chrome)
    - [Profile Sync Daemon](#profile-sync-daemon)
    - [Kubectl](#kubectl)
- [Features](#features)

<!-- /TOC -->

## Dependencies ##

* [GNU Stow][GNU Stow] - Symlink manager
* [alsa-utils][alsa] - ALSA utilites (used in `sb_output_switcher.sh` script)
* [bat][bat] - A `cat` clone with syntax highlighting and Git integration
* [gist][gist] - GitHub gists tool (used in `out` alias)
* [git][git] - Most popular source distributed version control system
* [gnupg][gnupg] - OpenPGP standard implementation
* [Google Chrome Beta][chrome] - A beta version of Google Chrome Browser
* [goto][goto] - Fast projects navigation util (used in goto projects aliases)
* [helmenv][helmenv] - Helm version manager (used in `helmenv` function)
* [kbenv][kbenv] - `kubectl` version manager (used in `kbenv` function)
* [kitty][kitty] - Cross-platform, fast, feature-rich, GPU based terminal
* [kubectx][kubectx] - A util to manage and switch between clusters and namespaces (used in `k-context` and `k-namespace` aliases)
* [neofetch][neofetch] - A command-line system information tool
* [profile-sync-daemon][psd] - A tiny daemon designed to keep your browser profile in tempfs
* [parallel][parallel] - A shell tool for executing jobs in parallel (used in `kubectl` function)
* [pastebinit][pastebinit] - A multi pastebin service (used in `pb` alias)
* [pinentry-qt][pinentry] - GUI application used to enter passphrases
* [pwgen][pwgen] - password generation tool (used in `pwgen` alias)
* [starship][starship] - The minimal, blazing-fast and infinitely customizable prompt
* [VSCode][VSCode] - popular code editor (used in `c` alias)

```bash
# Install yay as AUR helper
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

# Install deps
yay -S \
  alsa-utils \
  bat \
  gistit \
  gnupg \
  google-chrome-beta \
  goto-git \
  helmenv-bin \
  imagemagick \
  kbenv-bin \
  kitty \
  kubectx \
  neofetch \
  openssh \
  pastebinit \
  pinentry \
  profile-sync-daemon \
  pwgen \
  starship \
  stow \
  visual-studio-code-bin

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
## How to use it?

It is assumed that there are no configuration files for what you are installing.
If the destination config files exist, an error will appear and you will need to
manually resolve the conflict by deleting the existing files if you go to use mine.

```bash
# Just cd to repo_path/dotfiles
# Simple run stow [package]. E.g.:
cd repo_path/dotfiles
stow bash inputrc kitty
# Or install all of it at once
stow *
```

## Dependencies configuration ##

### SSH Agent ###

```bash
# Enable ssh-agent service
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
```

**NOTE:** If for some reason you decide to disable `ssh-agent.service`,
then the symlink to the source file in stow project will be deleted.
To bring it back, you can run from `repo_path/dotfiles` command `stow ssh-agent`

### Gist ###

```bash
# Create API Token for gist
# https://github.com/settings/tokens
shopt -ou history
echo YOUR_TOKEN_HERE > ~/.gist && \
chmod go-rwx ~/.gist
shopt -os history
```

### Fonts ###

```bash
# After install fonts update the cache
fc-cache -fr
# Show fonts list
fc-list
```
### Google Chrome ###

```bash
# Change the amount of available memory for tmpfs, where chrome will store
# its cache (see chrome-beta-flags.conf) and for storing the profile using psd
# 25% - Change the percentage of total memory for your own reasons.
sudo sed -i "s/.*RuntimeDirectorySize=.*/RuntimeDirectorySize=25%/g" /etc/systemd/logind.conf
```
### Profile Sync Daemon ###

```bash
# Add psd-overlay-helper binary to execute the sudo in passwordless way
echo "$USER ALL=(ALL) NOPASSWD: $(type -P psd-overlay-helper)" | sudo EDITOR='tee -a' visudo
# enable psd service
systemctl --user enable psd
```
### Kubectl ###

```bash
# You can create a file ~/.kube/config_list, in which you can
# list the full paths to the separate cluster configs. E.g.:
cat << EOF > ~/.kube/config_list
/home/user/.kube/cluster1
/home/user/.kube/cluster2
/home/user/.kube/config
EOF

# Note: shortening ~ for home directory does't work
```

## Features ##

* Disabled KDE [**Baloo**][KDE Baloo] service

[alsa]: https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_Utilities
[Arch Linux]: https://wiki.archlinux.org/index.php/Arch_Linux
[bat]: https://github.com/sharkdp/bat
[chrome]: https://www.google.com/intl/en/chrome/beta
[gist]: https://github.com/defunkt/gist
[git]: https://git-scm.com
[GNU Stow]: https://www.gnu.org/software/stow/
[gnupg]: https://gnupg.org
[goto]: https://github.com/iridakos/goto/
[helmenv]: https://github.com/little-angry-clouds/kubernetes-binaries-managers/blob/master/cmd/helmenv/
[kbenv]: https://github.com/little-angry-clouds/kubernetes-binaries-managers/tree/master/cmd/kbenv
[KDE Baloo]: https://wiki.archlinux.org/index.php/Baloo
[kitty]: https://github.com/kovidgoyal/kitty
[kubectx]: https://github.com/ahmetb/kubectx
[neofetch]: https://github.com/dylanaraps/neofetch
[parallel]: https://www.gnu.org/software/parallel
[pastebinit]: https://launchpad.net/pastebinit
[pinentry]: https://wiki.archlinux.org/index.php/GnuPG#pinentry
[Plasma]:https://kde.org/plasma-desktop/
[psd]: https://wiki.archlinux.org/title/Profile-sync-daemon
[pwgen]: https://sourceforge.net/projects/pwgen
[starship]: https://starship.rs
[VSCode]: https://code.visualstudio.com
