#!/bin/sh
# Background script 0.5 by Curly
# Requires shuf, pywal
store="/etc/lightdm/bg/image"
imgdir="${HOME}/media/pictures/desktop/"

if [[ $1 == "rand" ]]; then
  img=$(find ${imgdir} -type f -printf "%h/%f\n" | shuf -n1)
elif [[ $1 == "last" ]]; then
  img=${store}
fi

cp "${img}" /etc/lightdm/bg/image;
wal -i "${img}" --saturate 0.8;
