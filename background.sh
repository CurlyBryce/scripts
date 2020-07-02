#!/bin/bash
imgdir="$HOME/media/pictures/Desktop/"
images=$(find ${imgdir})
feh --randomize --bg-fill ${images};
exit
