#!/bin/sh

options="\
Lock\x00icon\x1fsystem-lock-screen\n\
Sleep\x00icon\x1fsystem-suspend\n\
Logout\x00icon\x1fsystem-log-out\n\
Restart\x00icon\x1fsystem-reboot\n\
Shutdown\x00icon\x1fsystem-shutdown\n\
"

chosen=$(printf "%b" "$options" | \
    rofi -dmenu -theme ~/.local/share/themes/my-theme/rofi/theme.rasi -show-icons -i -p "Power"
)

case "$chosen" in
    Lock)
        ~/bin/lock.sh
        ;;
    Sleep)
        systemctl suspend
        ;;
    Logout)
        loginctl terminate-session "$XDG_SESSION_ID"
        ;;
    Restart)
        systemctl reboot
        ;;
    Shutdown)
        confirm=$(printf "No\nYes" | rofi -dmenu -theme ~/.local/share/themes/my-theme/rofi/theme.rasi -p "Shutdown?")
        [ "$confirm" = "Yes" ] && systemctl poweroff
        ;;
esac
