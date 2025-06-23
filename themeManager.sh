#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#--Array of themes--#

declare -A themeMap
for theme in $SCRIPT_DIR/themes/*; do
  themeName=$(basename "$theme")
  themeMap["$themeName"]="$theme"
done

#--Wofi selection--#

selectedTheme=$(printf "%s\n" "${!themeMap[@]}" | wofi --dmenu --prompt "choose theme :)")

selectedThemePath="${themeMap[$selectedTheme]}"

#--Setdown previous theme--#

previousThemePath="./themes/paintingTheme"

$previousThemePath/setdown.sh

#--Setup actual theme--#

$selectedThemePath/setup.sh

#--Exports--#

sed -i \
  "0,/^previousThemePath=.*/s|^previousThemePath=.*|previousThemePath=\"$selectedThemePath\"|" \
  "./themeManager.sh"
