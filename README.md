# EasyLinux - Repair Cafe Edition

A beginner-friendly Linux distribution built on Fedora Atomic (Kinoite) with KDE Plasma.

Designed for repair cafes, maker spaces, and community workshops.

## Features

- **Immutable root filesystem** - Hard to break, easy to recover
- **Atomic updates** - Update the whole system at once, rollback if needed
- **Flatpak apps** - Install apps safely in sandboxed containers
- **Gaming ready** - Steam, Gamescope, and MangoHud pre-installed
- **Danish localization** - Danish keyboard, language, and timezone
- **Repair Cafe themed** - Beautiful workshop wallpapers from Unsplash

## Wallpapers

Included repair cafe themed wallpapers:
- Workshop tools
- Electronics repair
- Soldering work
- Vintage tools

*Wallpapers sourced from [Unsplash](https://unsplash.com) - free for commercial use*

## Installation

### From an existing Fedora Atomic installation

```bash
# Rebase to EasyLinux
rpm-ostree rebase ostree-unverified-registry:ghcr.io/zuelow/easylinux:latest
systemctl reboot
```

### Fresh installation

Download the ISO from the [Releases](https://github.com/Zuelow/easylinux/actions) page (Actions > Build ISO > Artifacts).

Flash to USB using:
- [Fedora Media Writer](https://flathub.org/apps/org.fedoraproject.MediaWriter)
- [balenaEtcher](https://etcher.balena.io/)

## Included Software

### System Packages
- `htop` - System monitor
- `fastfetch` - System info display
- `fish` - Friendly interactive shell
- `fwupd` - Firmware updates
- `gamescope` - Gaming compositor
- `mangohud` - Gaming overlay

### Default Flatpak Apps
- Firefox, LibreOffice, VLC
- Spotify, Obsidian, Discord, Signal
- Steam, Warehouse (Flatpak manager)

## Customization

Edit `recipes/recipe.yml` to customize:
- Add/remove system packages
- Add/remove Flatpak apps
- Change wallpapers
- Modify branding

## Building

```bash
# Install BlueBuild CLI
cargo install blue-build

# Build locally
bluebuild build recipes/recipe.yml
```

## Resources

- [BlueBuild Documentation](https://blue-build.org/)
- [Universal Blue](https://universal-blue.org/)
- [Repair Cafe](https://www.repaircafe.org/)
