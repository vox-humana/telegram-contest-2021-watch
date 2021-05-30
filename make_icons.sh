#!/bin/bash

INK=/Applications/Inkscape.app/Contents/MacOS/inkscape

if [[ -z "$1" ]] 
then
    echo "SVG file needed."
    exit;
fi

BASE=`basename "$1" .svg`
DIRNAME="$(cd "$(dirname "$1")"; pwd)"
SVG="$DIRNAME/$(basename "$1")"

# https://developer.apple.com/design/human-interface-guidelines/watchos/visual/app-icon/
sizes_mapper=`cat << EOF
80                80
88                88
100              100
48                48
55                55
58                58
87                87
172              172
196              196
216              216
1024            1024
EOF`

IFS=$'\n'
for line in $sizes_mapper
do
    suffix=`echo $line|awk '{print $1}'`
    size=`echo $line|awk '{print $2}'`
    $INK -o "$DIRNAME/$BASE-$suffix.png" -w $size -h $size --export-png-color-mode=RGB_8 $SVG
done
