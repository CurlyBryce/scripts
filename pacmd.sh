#!/bin/bash
ammount=0.05

if [[ $1 == "toggle" ]]; then
	if [[ "`pacmd list-sinks | grep muted`" == "	muted: no" ]]; then
		pacmd set-sink-mute 0 1; else
		pacmd set-sink-mute 0 0;
	fi

  exit;
fi

if [[ $1 == "raise" ]]; then
	 vol=`pacmd list-sinks | grep front-left: | sed "s/.*\(ft:\ \([0-9]\{1,5\}\)\).*/\2/"`;
	 max=`pacmd list-sinks | grep steps: | sed "s/.*\(ps:\ \([0-9]\{1,5\}\)\).*/\2/"`;
	 maxvol=`echo "($vol + ($max * $ammount))>$max" | bc`;
	 if [[ $maxvol == 0 ]]; then
		 setvol=`echo "$vol + ($max * $ammount)" | bc | sed "s/\...//"`;
		 pacmd set-sink-volume 0 $setvol;
		 percent=`echo "scale=2; $setvol / $max" | bc | sed "s/\.//"`;
		 notify-send -u low -c "pacmd" "Vol: $percent";
		 echo $setvol;
	fi
    exit;
fi

if [[ $1 == "lower" ]]; then
	 vol=`pacmd list-sinks | grep front-left: | sed "s/.*\(ft:\ \([0-9]\{1,5\}\)\).*/\2/"`;
	 max=`pacmd list-sinks | grep steps: | sed "s/.*\(ps:\ \([0-9]\{1,5\}\)\).*/\2/"`;
	 maxvol=`echo "($vol - ($max * $ammount))<0" | bc`;
	 if [[ $maxvol == 0 ]]; then
		 setvol=`echo "$vol - ($max * $ammount)" | bc | sed "s/\...//"`;
		 pacmd set-sink-volume 0 $setvol;
		 percent=`echo "scale=2; $setvol / $max" | bc | sed "s/\.//"`;
		 notify-send -u low -c "pacmd" "Vol: $percent";
		 echo $setvol;
	fi
    exit;
fi
