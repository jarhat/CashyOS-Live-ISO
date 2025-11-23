#!/bin/bash
level=2

resources="/usr/local/share/aoc"

key="$HOME/.aoc/$level.key"

img="$HOME/Public/$(($level-1))/$(($level-1)).png"

door="$HOME/Public/$level"

vault="$resources/$level.lvl"

url="https://ctf.cash/aoc/$level"

flag=$(curl --connect-timeout 1 "$url" | jq -r '.[]')

[ "$flag" == "" ] \
    && notify-send -i $img "Something went wrong!" && exit 0
[ "$flag" == "Too Many Requests" ] \
    && notify-send -i $img "Try again later today!" && exit 0
[ "$flag" == "Not Found" ] \
    && notify-send -i $img "Try again later today!" && exit 0
                           
echo -n $flag > "$key~"

sudo cryptsetup open --key-file "$key~" $vault $level

mv "$key~" "$key" # key is ok

sudo mount "/dev/mapper/$level" "$door"

sudo chown $USER:$USER "$door"

xfconf-query --channel thunar --property /last-show-hidden \
	--create --type bool --set false

bash "$resources/filehighl/script/filehighl" "$door"
bash "$resources/gvfs-set-emblem/gvfs-set-emblem-unlocked.sh" "$door"

pkill -f thunar

thunar "$door" &

next_img="$door/$level.png"
next_txt="$door/$level.txt"

notify-send -u critical -i "$next_img" "$(cat $next_txt)"
