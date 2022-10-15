#!/bin/sh 

WIN=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) _NET_WM_NAME)
MY_WIN="$(echo $WIN | sed -n 's/^[^=]*= ["]\([^"]*\)["]/\1/p')"

if [ -z "$MY_WIN" ]; then
    convert -resize 75% ~/afs/bash-commands/background.jpg /tmp/blur.png
else
    echo "Got a window" >> ~/afs/bash-commands/name.term
    scrot /tmp/current.png
    
    # Adding the blur
    convert -blur 0x6 /tmp/current.png /tmp/blur.png
fi

echo "$MY_WIN this is a test" >> ~/afs/bash-commands/name.term


# Adding Composite
convert -resize 150% ~/afs/bash-commands/bob.png /tmp/bob.png
composite -gravity southeast /tmp/bob.png /tmp/blur.png /tmp/lock_temp.png
convert -resize 50% ~/afs/bash-commands/acdc.png /tmp/acdc.png
composite -gravity northwest /tmp/acdc.png /tmp/lock_temp.png /tmp/lock_temp2.png

convert -resize 30% ~/afs/bash-commands/Chronos.png /tmp/chronos.png
composite -gravity northeast /tmp/chronos.png /tmp/lock_temp2.png /tmp/lock.png

rm /tmp/current.png /tmp/bob.png /tmp/lock_temp.png /tmp/lock_temp2.png


#WIN=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) _NET_WM_NAME)
#MY_WIN="$(echo $WIN | sed -n 's/^[^=]*= ["]\([^"]*\)["]/\1/p')"
#echo "$MY_WIN + This is a term" > ~/afs/bash-commands/name.term



i3lock -i /tmp/lock.png
