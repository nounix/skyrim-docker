#!/bin/bash

# -v $dbus:$dbus \
# dbus="$(echo $DBUS_SESSION_BUS_ADDRESS | cut -d '=' -f 2)"
pulse="$XDG_RUNTIME_DIR/pulse/native"

docker run -d -i --rm --name skyrim --privileged --net=host --pid=host --uts=host --ipc=host \
    -e PATH \
    -e SHELL \
    -e VISUAL \
    -e EDITOR \
    -e SUDO_ASKPASS \
    -e DISPLAY \
    -e DBUS_SESSION_BUS_ADDRESS \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v /dev/:/dev/ \
    -v $pulse:$pulse \
    -v $HOME/:$HOME/ \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/localtime:/etc/localtime:ro \
    skyrim sh
