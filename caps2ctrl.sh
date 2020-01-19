#!/bin/bash

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
if ! pgrep -x "xcape" > /dev/null
then
	xcape -e 'Control_L=Escape'
fi
