#!/bin/bash

# Obtener el directorio donde está este script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#--Hyprland--#
rm -rf "$HOME/.config/hypr"
ln -sf "$SCRIPT_DIR/hyprland" "$HOME/.config/hypr"
hyprctl reload

#--Waybar--#
rm -rf "$HOME/.config/waybar"
ln -sf "$SCRIPT_DIR/waybar" "$HOME/.config/waybar"

nohup waybar >/dev/null 2>&1 &

#--Kitty--#
rm -rf "$HOME/.config/kitty"
ln -sf "$SCRIPT_DIR/kitty" "$HOME/.config/kitty"

#--P10k--#
rm -rf "$HOME/.p10k.zsh"
ln -sf "$SCRIPT_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

#--bat--#
rm -rf "$HOME/.config/bat"
ln -sf "$SCRIPT_DIR/bat" "$HOME/.config/bat"

#--lsd--#
rm -rf "$HOME/.config/lsd"
ln -sf "$SCRIPT_DIR/lsd" "$HOME/.config/lsd"

#--Wofi--#
rm -rf "$HOME/.config/wofi"
ln -sf "$SCRIPT_DIR/wofi" "$HOME/.config/wofi"

#--Wallpaper--#
$SCRIPT_DIR/wallpapers/wallpaperChanger.sh
