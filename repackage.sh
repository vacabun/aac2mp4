SHELL_FOLDER=$(cd "$(dirname "$0")"; pwd)
cd $SHELL_FOLDER
for i in *.aac; do
    name=`echo "$i" | cut -d'.' -f1`
    ./ffmpeg -loop 1 -y -i ${name}.png -i "$i" -shortest -r 24 -b:v 2400k -b:a 320k ${name}.mp4
done 