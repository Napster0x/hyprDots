SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

wallpaper=$(find "$SCRIPT_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.jpeg" \) | shuf -n 1)

swww img -t fade "$wallpaper"

wal -i "$wallpaper" # Aplicar el wallpaper y la paleta

killall waybar && waybar &
