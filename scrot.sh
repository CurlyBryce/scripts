#!/bin/bash

if [[ $1 == "screen" ]]; then
  scrot -e 'xclip -selection clipboard -t image/png $f' ${HOME}/media/pictures/screenshots/%m%d%y-%H%M%S-`date +%N`.png;
  exit;

  elif [[ $1 == "focused" ]]; then
    scrot -ue 'xclip -selection clipboard -t image/png $f' ${HOME}/media/pictures/screenshots/%m%d%y-%H%M%S-`date +%N`.png;
    exit;

  elif [[ $1 == "select" ]]; then
    scrot -se 'xclip -selection clipboard -t image/png $f' ${HOME}/media/pictures/screenshots/%m%d%y-%H%M%S-`date +%N`.png;
    exit;

  else echo "error"; exit;
fi
