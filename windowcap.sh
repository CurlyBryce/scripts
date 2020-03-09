#/bin/bash
lockfile="/tmp/windowcap.lock"

function stop {
    kill -15 $1;
    sleep 3;
    kill -9 $1;
    rm $lockfile;
}

if [[ $1 == "stop" ]]; then
    stop $(cat $lockfile);
    exit;
fi;

if [[ $1 == "start" ]]; then
    if [ -f $lockfile ]; then
        exit;
    else
        geometry=$(xwininfo | grep 'geometry' | sed "s/^.*\-geometry //");
        size=$(echo $geometry | sed "s/\+.*//");
        offset=$(echo $geometry | sed "s/^[0-9]\{2,5\}x[0-9]\{2,5\}+\(\.*\)/\1/;s/\+/\,/");
        date=$(date +%y%m%d-%H%M%S-%N);
        directory="$HOME/media/video/windowcap/";
        
        ffmpeg -f x11grab -s $size -i $DISPLAY.0+$offset -r 30 -crf 30 -c:v libx264 -an $directory$date.mp4 &
        echo $! > $lockfile;
    fi;
fi;
