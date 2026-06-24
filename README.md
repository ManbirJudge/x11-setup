# X11 Setup 
## TODOs
- Try out - dwm, stumpwm
- Maybe - add proper window rules for dialogs and pop-ups and stuff in all WM configs.

## Configuration
- Disable installing weak dependencies in DNF.
- Configure networking.
- Setup RPM Fusion.
- Setup `greetd` and `tuigreet`.

## Software
### System
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|Greeter|greetd, tuigreet||greetd, tuigreet|
|Network & WiFi|wpa_supplicant, NetworkManager, NetworkManager-tui, NetworkManager-wifi||NetworkManager|
|FFmpeg|ffmpeg, ffmpeg-libs|ffmpeg, ffmpeg-libs|ffmpeg|
|Archive Utils|tar, unzip||unzip, xz|
|Volume Management Utils|udisks2, gvfs, gvfs-mtp, gvfs-gphoto2||udisks2, gvfs, gvfs-mtp, gvfs-gphoto2|
|Download Utils|wget, aria2|wget, aria2|wget, aria2|

### Desktop/X11
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|X11 Base|xorg-x11-server-Xorg, xorg-x11-xinit, xorg-x11-xauth, xsetroot, xrandr|xorg-server, xinit, xrandr, xf86-input-libinput, xsetroot|xorg-minimal, xinit, xauth, xrandr, xrdb, xsetroot|
|Audio Stack|pipewire, wireplumber|pipewire, wireplumber, pipewire-pulse|pipewire, wireplumber|
|picom|picom|picom|picom|
|feh|feh|feh|feh|
|rofi|rofi|rofi|rofi|
|xclip|xclip|xclip|xclip|
|flameshot|flameshot|
|dunst|dunst|dunst|dunst|
|NewtorkManager Tray|network-manager-applet||network-manager-applet|
|X11 Lock|xlock, xss-lock, xidlehook (⚒)|
|Misc|brightnessctl|||

### Applications (general)
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|git|git|git|git|
|vim|vim|vim|vim|
|neovim|neovim|neovim|neovim|
|btop|btop|btop|btop|
|fastfetch|fastfetch|fastfetch|fastfetch|

### Looks
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|JetBrains Mono|jetbrains-mono-fonts|font-jetbrains-mono|⚒|
|Noto Fonts|google-noto-fonts-common, google-noto-sans-cjk-fonts, google-noto-emoji-fonts|font-noto, font-noto-cjk, font-noto-emoji|noto-fonts-ttf, noto-fonts-cjk, noto-fonts-emoji, noto-fonts-ttf-extra|
|Roboto|google-roboto-fonts|font-roboto|fonts-roboto-ttf|
|Papirus Icon Theme|papirus-icon-theme, papirus-icon-theme-dark|papirus-icon-theme|papirus-icon-theme|
|BreezeX Cursor Theme|⚒|⚒|⚒|[GitHub](https://github.com/ful1e5/BreezeX_Cursor)|

### Window Managers
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|i3|i3, i3status|i3wm, i3status|i3, i3status|
|herbstluftwm|herbstluftwm||herbstluftwm, dzen2|
|bspwm|bspwm, sxhkd||bspwm, sxhkd|
|awesome|awesome||awesome|
|ratpoison|ratpoison||ratpoison|
|musca|⚒||musca|
|spectrww|⚒||spectrwm|
|wmii|⚒|

### Applications (GUI)
|Software|Fedora|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|
|xterm|xterm|xterm|xterm|
|PCManFM|pcmanfm, ffmpegthumbnailer|pcmanfm|pcmanfm, ffmpegthumbnailer|
|GPicView|gpicview|gpicview|gpicview|
|VLC|vlc, vlc-plugin-ffmpeg|vlc|vlc|
|Firefox|firefox|firefox|firefox|
|PulseAudio Volume Control|pavucontrol||pavucontrol|
|Zathura|zathura, zathura-pdf-mupdf|zathura, zathura-pdf-mupdf|zathura, zathura-pdf-mupdf|
|Proton VPN|🌐|
|LibreOffice|libreoffice||libreoffice|
|Qt Utils|qt6ct, qt5ct, kvantum, kvantum-qt5||qt6ct, qt5ct, kvantum|

### Developement
|C/C++ Toolchain|@developement-tools, @c-developement, clang, clang-tools-extra||gcc, make, cmake, pkg-config|
|Rust Toolchain|rust, cargo||rustup|
|VSCode|🌐||vscode|
