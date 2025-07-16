#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpaper"
MONITOR="DP-2" 
COUNTER_FILE="$HOME/.config/hypr/.wall_counter"

mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort -V)

NUM_WALLS=${#WALLS[@]}

if (( NUM_WALLS == 0 )); then
    echo "No se encontraron wallpapers en $WALL_DIR"
    exit 1
fi

if [[ -f "$COUNTER_FILE" ]]; then
    IDX=$(<"$COUNTER_FILE")
else
    IDX=0
fi

if (( IDX >= NUM_WALLS )); then
    IDX=0
fi

WALL="${WALLS[$IDX]}"

echo "Aplicando wallpaper: $WALL (Monitor: $MONITOR)"

SOCK_PATH=$(find /run/user/$(id -u)/hypr/ -name ".hyprpaper.sock" 2>/dev/null | head -n 1)

if [[ -S "$SOCK_PATH" ]]; then
    hyprctl hyprpaper preload "$WALL"
    hyprctl hyprpaper wallpaper "$MONITOR","$WALL"
else
    echo "Hyprpaper no está corriendo o no hay socket"
    exit 1
fi

echo $(( (IDX + 1) % NUM_WALLS )) > "$COUNTER_FILE"

