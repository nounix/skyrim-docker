#!/bin/bash

# -v $dbus:$dbus \
# dbus="$(echo $DBUS_SESSION_BUS_ADDRESS | cut -d '=' -f 2)"
pulse="$XDG_RUNTIME_DIR/pulse/native"

docker run -d -i --rm --name skyrim --net=none \
    -e DISPLAY \
    -e DBUS_SESSION_BUS_ADDRESS \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v /dev/:/dev/ \
    -v $pulse:$pulse \
    -v /home/martin/.Xauthority:/home/martin/.Xauthority \
	-v /home/martin/games/skyrim/wine/:/home/martin/.wine/ \
	-v /home/martin/games/skyrim/config/:"/home/martin/My Games/Skyrim/" \
	-v /home/martin/games/skyrim/:/home/martin/skyrim \
	-v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
    -v /etc/localtime:/etc/localtime:ro \
    skyrim sh
