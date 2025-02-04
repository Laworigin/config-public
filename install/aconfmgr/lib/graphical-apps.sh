# shellcheck shell=bash

# Main desktop apps.
AddPackage chromium          # A web browser built for speed, simplicity, and security
AddPackage firefox           # Standalone web browser from mozilla.org
AddPackage rofi              # A window switcher, application launcher and dmenu replacement
AddPackage kitty             # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage gnome-terminal    # The GNOME Terminal Emulator
AddPackage rxvt-unicode      # Unicode enabled rxvt-clone terminal emulator (urxvt)
# AddPackage --foreign termite # A simple VTE-based terminal
AddPackage pavucontrol       # PulseAudio Volume Control
AddPackage pqiv              # Powerful image viewer with minimal UI
AddPackage geeqie            # A lightweight image browser and viewer
AddPackage arandr            # Provide a simple visual front end for XRandR 1.2.
AddPackage mpv               # a free, open source, and cross-platform media player
AddPackage espeak-ng         # Multi-lingual software speech synthesizer
AddPackage qbittorrent       # An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar.
AddPackage zathura           # Minimalistic document viewer
AddPackage zathura-djvu      # DjVu support for Zathura
AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
AddPackage zathura-ps        # Adds ps support to zathura by using the libspectre library
# NOTE(2018-10-18): I disabled volctl and polybar because they're not actually
# used yet. Will enable them if/when I actually use them.
# AddPackage --foreign volctl # Per-application volume control for GNU/Linux desktops
# AddPackage --foreign polybar # A fast and easy-to-use status bar
AddPackage pcmanfm     # Extremely fast and lightweight file manager
# file-roller enables extracting archives directly from pcmanfm.
AddPackage file-roller # Create and modify archives

AddPackage vlc # Multi-platform MPEG, VCD/DVD, and DivX player
IgnorePath '/usr/lib/vlc/plugins/plugins.dat'

# System administration, utilities, and development packages with X11 dependencies.
# AddPackage --foreign kalu              # Upgrade notifier w/ AUR support, watched (AUR) packages, news
AddPackage gparted            # A Partition Magic clone, frontend to GNU Parted
AddPackage gnome-disk-utility # Disk Management Utility for GNOME
AddPackage seahorse           # GNOME application for managing PGP keys
# deepin-clone seems to pull in a lot of dependencies so it's disabled for now.
# AddPackage deepin-clone       # Disk and partition backup/restore tool

if is_nvidia_gpu; then
  AddPackage nvidia-settings # Tool for configuring the NVIDIA graphics driver
fi

if is_primary_dev_machine; then
  AddPackage gvim                             # Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI)
  # The OSS version of VSCode doesn't support the remote extensions, so the
  # proprietary version is used.
  # AddPackage code                        # The Open Source build of Visual Studio Code (vscode) editor
  AddPackage --foreign visual-studio-code-bin # Visual Studio Code (vscode)
  # vscode-neovim requires neovim v0.5.0, which is downloaded to my home
  # directory. However, since VSCode doesn't support using environment variables
  # in ~/.config/Code/User/settings.json, I'm setting the neovim path to
  # /usr/local/bin/nvim-vscode and creating a symlink here.
  # Update 2021-09-11: neovim v0.5.0 was released so this is not needed.
  # CreateLink '/usr/local/bin/nvim-vscode' "${USER_BIN_DIR}/nvim-vscode"
  # This is required for the desktop entry of vscode to work inconsistently
  # (must have suid set for the chrome sandbox).
  SetFileProperty '/opt/visual-studio-code/chrome-sandbox' mode 4755
  AddPackage yubikey-manager-qt             # Cross-platform application for configuring any YubiKey over all USB transports
  AddPackage yubikey-personalization-gui    # Yubico YubiKey Personalization GUI
  AddPackage sqlitebrowser                  # SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt
  AddPackage libreoffice-fresh              # LibreOffice branch which contains new features and program enhancements
  AddPackage libreoffice-extension-texmaths # A LaTeX equation editor for LibreOffice
  AddPackage graphviz                       # Graph visualization software
  # File generated by graphviz.
  IgnorePath '/usr/lib/graphviz/config6'
  AddPackage keybase-gui  # GUI frontend for GPG with keybase.io
  # dolphin is only used for browsing files on my Android device.
  AddPackage dolphin      # KDE File Manager

  AddPackage freerdp      # Free implementation of the Remote Desktop Protocol (RDP)
  AddPackage remmina      # remote desktop client written in GTK+

  AddPackage virt-manager # Desktop user interface for managing virtual machines
  AddPackage virt-viewer  # A lightweight interface for interacting with the graphical display of virtualized guest OS.
  AddPackage qemu         # A generic and open source machine emulator and virtualizer
  AddPackage gnome-boxes  # Simple GNOME application to access virtual systems
  # AddPackage virtualbox           # Powerful x86 virtualization for enterprise as well as home use
  # AddPackage virtualbox-host-dkms # VirtualBox Host kernel modules sources

  AddPackage krita    # Edit and paint images
  AddPackage audacity # A program that lets you manipulate digital audio waveforms
fi

# hera11 is used as a media center.
if [[ "${HOST_ALIAS}" == hera11 ]]; then
  AddPackage kodi # A software media player and entertainment hub for digital media
  # AddPackage --foreign plex-media-server # Plex Media Server
  # NOTE: As of 2019-05-15, plex is not used, so it's disabled for performance
  # reasons.
  # CreateLink /etc/systemd/system/multi-user.target.wants/plexmediaserver.service /usr/lib/systemd/system/plexmediaserver.service
fi
