#!/bin/bash

killall syndaemon
syndaemon -i 2 -dtk &
synclient TouchpadOff=1
