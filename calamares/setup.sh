#!/bin/bash
# SPDX-License-Identifier: MIT
# EasyLinux Calamares First-Boot Setup Script

set -euo pipefail

# Create temporary home directory for root
export HOME=/run/user/0/calamares-home
mkdir -p "$HOME"

# Set up Wayland environment
export XDG_RUNTIME_DIR=/run/user/0
export WAYLAND_DISPLAY=wayland-0
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland

# Accessibility
export QT_ACCESSIBILITY=1
export GTK_MODULES=gail:atk-bridge
export GNOME_ACCESSIBILITY=1

# KDE/Plasma settings for Calamares
mkdir -p "$HOME/.config"
cat > "$HOME/.config/kdeglobals" << EOF
[General]
ColorScheme=Vapor

[Icons]
Theme=Papirus-Dark

[KDE]
LookAndFeelPackage=com.easylinux.vapor
EOF

# Set wallpaper
cat > "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc" << EOF
[Containments][1][Wallpaper][org.kde.image][General]
Image=/usr/share/backgrounds/easylinux/workshop-tools.jpg
EOF

# Cleanup function
cleanup() {
    # Kill any processes we started
    jobs -p | xargs -r kill 2>/dev/null || true
}
trap cleanup EXIT

# Wait for graphics to be ready
udevadm settle || true
sleep 2

# Start KWin Wayland compositor
kwin_wayland --xwayland --no-lockscreen &
KWIN_PID=$!
sleep 3

# Start PipeWire for audio
pipewire &
pipewire-pulse &
wireplumber &

# Start accessibility daemon
/usr/libexec/at-spi2-registryd &

# Run Calamares
calamares -c /usr/share/calamares-easylinux

# If Calamares completed successfully, disable the firstboot service
if [ $? -eq 0 ]; then
    systemctl disable easylinux-firstboot.service
fi

exit 0
