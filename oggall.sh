#Touchy
musicdir=~/media/music/
outdir=../music_ogg #Will be creating from the musicdir

#No Touchy
cd $musicdir
files=$(find ./ -type f)
tree=$(find ./ -type d)
IFS=$'\n'

mkdir -p $outdir
for i in $tree; do
	mkdir -pv $outdir/$i;
done;

for i in $files; do
    echo $i;
    ffmpeg -i $i -loglevel 16 -n -vn -ab 128k -f ogg $outdir/$(echo $i | sed "s/\.[a-zA-Z]\{1,4\}/.ogg/")
done;
