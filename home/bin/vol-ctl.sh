#!/bin/sh


STEP=5

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED
}

notify_volume() {
    local vol
    vol=$(get_volume)

    if is_muted; then
        notify-send \
            -h string:x-dunst-stack-tag:volume \
            -t 1000 \
            "Volume" "Muted"
    else
        notify-send \
            -h string:x-dunst-stack-tag:volume \
            -h int:value:"$vol" \
            -t 1000 \
            "Volume" "${vol}%"
    fi
}

case "$1" in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "${STEP}%+"
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "${STEP}%-"
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *)
        echo "usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

notify_volume
