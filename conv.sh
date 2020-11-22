#/bin/bash

#Create Directory Structure
if [[ $1 != "" ]]; then
	tree=$(find $1 -type d);
	for i in $tree; do
		mkdir -pv conv/$i;
	done;
else
	echo "Requires directory as argument 1";
	exit;
fi;

#Test for already converted files
differ=$(diff -qr $1 conv/$1 | sed "s/Files.*differ/\ /g;s/\:\ /\//g;s/Only\ in\ //g;s/\(.*\....\)/\1/g");
echo $differ
IFS=$'\n'
for i in $differ; do
	echo -e "${i}\n";
	ffmpeg -i $(echo ${i} | sed "s/\ /\\\ /g;s/\'/ /g;s/\(^.*\....\).*/\1/") -c:v libx265 -x265-params crf=14 -c:s copy conv/$i;
done
