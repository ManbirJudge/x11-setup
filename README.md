# X11 Setup 
## TODOs
- Try out - dwm, stumpwm
- Maybe - add proper window rules for dialogs and pop-ups and stuff in all WM configs.
- Migrate off of `xlock`.
- Maybe: Migrate from Proton VPN's Firefox extension to system application.

## Software
### System
|Software|Fedora|Debian|Arch Linux|Void Linux|
|---|---|---|---|---|
|Misc||sudo||sudo|
|Archive Utils|tar, unzip|tar, unzip||unzip, xz|
|Network & WiFi|wpa_supplicant, NetworkManager, NetworkManager-tui, NetworkManager-wifi|network-manager||NetworkManager|
|Volume Management Utils|udisks2|udisks2, libmtp-runtime, gphoto2||udisks2, gvfs, gvfs-mtp, gvfs-gphoto2|
|Download Utils|wget, aria2|wget, aria2|wget, aria2|wget, aria2|
|Greeter|greetd, tuigreet|greetd, tuigreet|greetd, tuigreet|
|FFmpeg|ffmpeg, ffmpeg-libs|ffmpeg|ffmpeg, ffmpeg-libs|ffmpeg|

### Desktop/X11
|Software|Fedora|Debian|Alpine Linux|Void Linux|
|---|---|---|---|---|
|X11 Base|xorg-x11-server-Xorg, xorg-x11-xinit, xorg-x11-xauth, xsetroot, xrandr|xorg, xauth, x11-utils, xinit|xorg-server, xinit, xrandr, xf86-input-libinput, xsetroot|xorg-minimal, xinit, xauth, xrandr, xrdb, xsetroot|
|Audio Stack|pipewire, wireplumber|pipewire, wireplumber, pipewire-pulse|pipewire, wireplumber, pipewire-pulse|pipewire, wireplumber|
|picom|picom|picom|picom|picom|
|feh|feh|feh|feh|feh|
|rofi|rofi|rofi|rofi|rofi|
|xclip|xclip|xclip|xclip|xclip|
|flameshot|flameshot|flameshot|
|dunst|dunst|dunst|dunst|dunst|
|NewtorkManager Tray|network-manager-applet|network-manager-applet|network-manager-applet|
|Misc|brightnessctl|brightnessctl, libnotify-bin||

### Applications (general)
|Software|Fedora|Debian|Alpine Linux|Void Linux|
|---|---|---|---|---|
|Git|git|git|git|git|
|vim|vim|vim|vim|vim|
|NeoVim|neovim|neovim|neovim|neovim|
|btop|btop|btop|btop|btop|
|fastfetch|fastfetch|fastfetch|fastfetch|fastfetch|

### Looks
|Software|Fedora|Debian|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|---|
|JetBrains Mono|jetbrains-mono-fonts|fonts-jetbrains-mono|font-jetbrains-mono|⚒|
|Noto Fonts|google-noto-fonts-common, google-noto-sans-cjk-fonts, google-noto-emoji-fonts|fonts-noto, fonts-noto-cjk, fonts-noto-cjk-extra, fonts-noto-color-emoji|font-noto, font-noto-cjk, font-noto-emoji|noto-fonts-ttf, noto-fonts-cjk, noto-fonts-emoji, noto-fonts-ttf-extra|
|Roboto|google-roboto-fonts|fonts-roboto|font-roboto|fonts-roboto-ttf|
|Papirus Icon Theme|papirus-icon-theme, papirus-icon-theme-dark|papirus-icon-theme, librsvg2-common|papirus-icon-theme|papirus-icon-theme|
|BreezeX Cursor Theme|⚒|⚒|⚒|⚒|[GitHub](https://github.com/ful1e5/BreezeX_Cursor)<br>For Debian, place under `~/.icons`|

### Window Managers
|Software|Fedora|Debian|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|---|
|i3|i3, i3status|i3, i3status|i3wm, i3status|i3, i3status|
|herbstluftwm|herbstluftwm|herbstluftwm||herbstluftwm, dzen2|
|bspwm|bspwm, sxhkd|bspwm, sxhkd||bspwm, sxhkd|
|awesome|awesome|awesome|awesome|
|ratpoison|ratpoison|ratpoison|
|musca|⚒|⚒||musca|
|spectrww|⚒|spectrwm||spectrwm|
|wmii|⚒|

### Applications (GUI)
|Software|Fedora|Debian|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|---|
|xterm|xterm|xterm|xterm|xterm|
|PCManFM|pcmanfm, ffmpegthumbnailer, gvfs, gvfs-mtp, gvfs-gphoto2|pcmanfm, ffmpegthumbnailer, gvfs, gvfs-backends|pcmanfm|pcmanfm, ffmpegthumbnailer|
|GPicView|gpicview|gpicview|gpicview|gpicview|
|VLC|vlc, vlc-plugin-ffmpeg|vlc|vlc|vlc|
|Firefox|firefox|firefox-esr|firefox|firefox|
|PulseAudio Volume Control|pavucontrol|pavucontrol||pavucontrol|
|Zathura|zathura, zathura-pdf-mupdf|zathura, zathura-pdf-poppler|zathura, zathura-pdf-mupdf|zathura, zathura-pdf-mupdf|
|LibreOffice|libreoffice|libreoffice||libreoffice|
|Qt Utils|qt6ct, qt5ct, kvantum, kvantum-qt|qt5ct, qt6ct, qt5-style-kvantum, qt6-style-kvantum||qt6ct, qt5ct, kvantum|

### Developement
|Software|Fedora|Debian|Alpine Linux|Void Linux|Note|
|---|---|---|---|---|---|
|C/C++ Toolchain|@developement-tools, @c-developement, clang, clang-tools-extra|build-essential, valgrind, cmake, pkg-config, clang, clangd||gcc, make, cmake, pkg-config|
|VSCode|🌐|🌐||vscode|
|X11 Developement||libx11-dev|
