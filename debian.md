- install sudo
- add user to sudo group
- disablle install-recommends and install-suggests in apt
- install vim, neovim, btop, fastfetch, git
- install xorg xauth x11-utils xinit xclip
- install xterm
- install i3, i3status, dunst, feh, rofi, flameshot, picom
- install fonts-jetbrains-mono, fonts-roboto, papirus-icon-theme, librsvg2-common
- install pipewire, wireplumber, pipewire-pulse. start them as user services.
- install pavucontrol
- install pcmanfm, vlc, gpicview, libreoffice
- install firefox-esr
- install brightnessctl, libnotify-bin
- install herbstluftwm, spectrwm, bspwm, sxhkd
- IMPORTANT: add official brightnessctl udev rules: https://github.com/Hummer12007/brightnessctl/blob/master/90-brightnessctl.rules
```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chgrp input /sys/class/leds/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chmod g+w /sys/class/leds/%k/brightness"
```
- install build-essential, valgrind, cmake, pkg-config, clang, clangd
- install 
- install zathura, zathura-pdf-poppler
- install ffmpegthumbnailer
- install qt5ct qt6ct qt5-style-kvantum qt6-style-kvantum
- install BreezeX Cursors manually. place under ~/.icons
- enable NetworkManager. disable wpa_supplicant. set up /etc/NetworkManager/NetworkManager.conf
- install vscode

## TODOs
- BreezeX_Cursor theme not working
