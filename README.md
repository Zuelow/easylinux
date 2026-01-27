# EasyLinux

A beginner-friendly Linux distribution built on Fedora Atomic (Kinoite) with KDE Plasma.

Inspired by SteamOS, EasyLinux features:
- **Immutable root filesystem** - Hard to break, easy to recover
- **Atomic updates** - Update the whole system at once, rollback if needed
- **Flatpak apps** - Install apps safely in sandboxed containers
- **Gaming ready** - Steam, Gamescope, and MangoHud pre-installed

## Installation

### From an existing Fedora Atomic installation

You can rebase any Fedora Atomic installation to EasyLinux:

```bash
# First, rebase to the unsigned image to get the keys
rpm-ostree rebase ostree-unverified-registry:ghcr.io/zuelow/easylinux:latest

# Reboot
systemctl reboot

# Then rebase to the signed image
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/zuelow/easylinux:latest

# Reboot again
systemctl reboot
```

### Fresh installation

Download the ISO from the Releases page and flash it to a USB drive using:
- [Fedora Media Writer](https://flathub.org/apps/org.fedoraproject.MediaWriter)
- [balenaEtcher](https://etcher.balena.io/)

## Building locally

Install the BlueBuild CLI:

```bash
# Using cargo
cargo install blue-build

# Or download from releases
# https://github.com/blue-build/cli/releases
```

Build the image:

```bash
cd easylinux
bluebuild build recipes/recipe.yml
```

## Customization

Edit `recipes/recipe.yml` to:
- Add/remove packages in the `rpm-ostree` module
- Add/remove Flatpak apps in the `default-flatpaks` module
- Add custom config files in `recipes/files/`
- Add setup scripts for branding

## Project structure

```
easylinux/
├── .github/
│   └── workflows/
│       └── build.yml      # GitHub Actions build workflow
├── recipes/
│   ├── files/             # Custom files to include in the image
│   └── recipe.yml         # Main build recipe
├── cosign.pub             # Public key for image verification
└── README.md
```

## Resources

- [BlueBuild Documentation](https://blue-build.org/)
- [Universal Blue](https://universal-blue.org/)
- [Fedora Atomic Desktops](https://fedoraproject.org/atomic-desktops/)
