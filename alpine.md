- sudo kbd
- tar unzip xz
- wget aria2
- ffmpeg ffmpeg-libs
- greetd, greetd-tuigreet, elogind, dbus, polkit, libinput, eudev, seatd
- xorg-server, xinit, xrandr, xauth, xrdb, xsetroot, xterm, xf86-input-libinput
- vim neovim fastfetch btop git
- i3wm i3status bspwm herbstluftwm sxhkd ratpoison awesome spectrwm openbox tint2
- font-noto font-roboto font-jetbrains-mono
- papirus-icon-theme
- feh rofi picom xclip flameshot dunst
- pcmanfm vlc firefox-esr gpicview zathura zathura-pdf-mudpdf libreoffice
- qt5ct qt6ct kvantum
- acl
<br>
- enable community repositories. add testing repository
- allow users in `wheel` groups to use `sudo`
<br>
- `rc-update add dbus default`
- `rc-update add elogind boot`
- `rc-update add greetd default`
- `rc-update add seatd default`
<br>
- `rc-update add udev sysinit`
- `rc-update add udev-trigger sysinit`
- `rc-update add udev-settle sysinit`
- `rc-update add udev-postmount default`
<br>
- what is `libneif-plugins-all`
- firefox said `libpic` is missing
