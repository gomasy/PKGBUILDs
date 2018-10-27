FROM base/archlinux:latest
LABEL maintainer="Gomasy <nyan@gomasy.jp>"

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -Sgq base | sed -e ':loop; N; $!b loop; s/\n/ /g' | sed -e 's/linux //' | xargs pacman -S --noconfirm --needed base-devel jemalloc libtermkey libuv msgpack-c unibilium libvterm luajit cmake lua51-mpack lua51-lpeg gperf git && \
    useradd -m gomasy

ADD . /home/gomasy/neovim-mainline/

RUN chown -R gomasy. /home/gomasy && \
    su -l gomasy -c "cd neovim-mainline && makepkg"
