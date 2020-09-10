FROM archlinux

COPY ./pacman.conf /etc/pacman.conf

RUN pacman --noconfirm --needed -Syyu sudo

RUN pacman --noconfirm --needed -Syyu wine-staging wine-mono wine-gecko winetricks lib32-mesa mesa-demos pulseaudio-alsa
RUN pacman --noconfirm --needed -S base base-devel chromium wine-nine zenity lib32-mpg123 lib32-gst-plugins-base-libs lib32-libpulse lib32-gst-plugins-base lib32-gst-plugins-good

ENV MESA_LOADER_DRIVER_OVERRIDE=iris
ENV GALLIUM_HUD=fps

# Configure sudo
RUN sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

RUN useradd -m -G wheel,storage,audio,video martin
USER martin

RUN mkdir "/home/martin/My Games/"

WORKDIR /home/martin

# winetricks d3dx9 d3dx9_43 xact dotnet45 vcrun2010 msxml6
# export MESA_LOADER_DRIVER_OVERRIDE=iris
# export GALLIUM_HUD=fps
# wine ninewinecfg
# https://linuxreviews.org/Intel_Iris