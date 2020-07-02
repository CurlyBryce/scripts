#!/bin/bash
# Screenshot script 0.2 by Curly
# Requires xclip, scrot, and date

clipboard='xclip -selection clipboard -t image/png $f'
dir="${HOME}/media/pictures/screenshots/"
format="%m%d%y-%H%M%S-`date +%N`.png"

[[ $1 == "screen" ]] && scrot -e "$clipboard" "$dir$format";

[[ $1 == "focused" ]] && scrot -ue "$clipboard" "$dir$format";

[[ $1 == "select" ]] && scrot -se "$clipboard" "$dir$format";
