#!/bin/sh

STEP=5

notify_brightness() {
    local current max percent

    current=$(brightnessctl g)
    max=$(brightnessctl m)
    percent=$(( current * 100 / max ))

    notify-send \
        -h string:x-dunst-stack-tag:brightness \
        -h int:value:"$percent" \
        -t 1000 \
        "Brightness" "${percent}%"
}

case "$1" in
    up)
        brightnessctl set "${STEP}%+"
        ;;
    down)
        brightnessctl set "${STEP}%-"
        ;;
    *)
        echo "usage: $0 {up|down}"
        exit 1
        ;;
esac

notify_brightness
