# Debian X11 Setup
## Configuration
- Add your user to `sudo` group.
- Disablle automatically installing recommended and suggested dependencies in `apt`. Check system dotfile #3.
- Enable `NetworkManager` service. Disable `wpa_supplicant` service.
- Enabled `greetd`.
## System Dotfiles
1. `/etc/NetworkManager/NetworkManager.conf`
```
[main]
plugins=ifupdown,keyfile
auth-polkit=false

[ifupdown]
managed=true
```
2. `/etc/greetd/conf.toml`
```
[terminal]
vt = 7

[default_session]
command = "tuigreet --time --remember --asterisks --cmd startx"
user = "_greetd"
```
3. `/etc/apt/apt.conf.d/99-no-install-extras`
```
APT::Install-Recommends "false";
APT::Install-Suggests "false";
```
4. `/etc/udev/rules.d/90-backlight.rules`
```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chgrp input /sys/class/leds/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chmod g+w /sys/class/leds/%k/brightness"
```