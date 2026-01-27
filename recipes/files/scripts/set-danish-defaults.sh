#!/usr/bin/env bash
set -euo pipefail

echo "Setting Danish defaults..."

# Set Danish locale
cat > /etc/locale.conf << 'EOF'
LANG=da_DK.UTF-8
LC_MESSAGES=da_DK.UTF-8
EOF

# Set Danish console keymap
cat > /etc/vconsole.conf << 'EOF'
KEYMAP=dk
FONT=eurlatgr
EOF

# Set timezone to Copenhagen
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime

# Set X11 keyboard layout to Danish
mkdir -p /etc/X11/xorg.conf.d
cat > /etc/X11/xorg.conf.d/00-keyboard.conf << 'EOF'
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "dk"
EndSection
EOF

# Set default KDE Plasma keyboard layout for new users
mkdir -p /etc/skel/.config
cat > /etc/skel/.config/kxkbrc << 'EOF'
[Layout]
DisplayNames=
LayoutList=dk
LayoutLoopCount=-1
Model=pc105
ResetOldOptions=false
ShowFlag=false
ShowLabel=true
ShowLayoutIndicator=true
ShowSingle=false
SwitchMode=Global
Use=true
EOF

echo "Danish defaults configured!"
