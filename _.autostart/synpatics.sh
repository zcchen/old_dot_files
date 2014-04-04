#!/bin/bash

killall syndaemon
syndaemon -i 2 -dtk &
synclient TouchpadOff=$(synclient -l|grep -c 'TouchpadOff.*=.*0')
