#!/bin/zsh

WALLPAPER_DIR="/home/gustavo/Pictures/Wallpaper"
INDEX_FILE="$HOME/Scripts/SWWW/change_wallpaper_index"
TOTAL_WALLPAPERS=$(ls $WALLPAPER_DIR/*.jpg | wc -l)

if [ -f "$INDEX_FILE" ]; then
  CURRENT_INDEX=$(cat "$INDEX_FILE")
else
  CURRENT_INDEX=1
fi

NEXT_INDEX=$((CURRENT_INDEX + 1))

if [ "$NEXT_INDEX" -gt "$TOTAL_WALLPAPERS" ]; then
  NEXT_INDEX=1
fi

CURRENT_WALLPAPER="$WALLPAPER_DIR/$NEXT_INDEX.jpg"

RANDOM_POS_X=$(date +%N | awk '{print $1 / 1000000000}')
RANDOM_POS_Y=$(date +%N | awk '{print $1 / 1000000000}')

swww img --transition-type outer --transition-pos "$RANDOM_POS_X,$RANDOM_POS_Y" --transition-step 100 "$CURRENT_WALLPAPER"

echo "$NEXT_INDEX" > "$INDEX_FILE"
