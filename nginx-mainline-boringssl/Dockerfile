FROM base/archlinux:latest
LABEL maintainer="Gomasy <nyan@gomasy.jp>"

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -Sgq base | sed -e ':loop; N; $!b loop; s/\n/ /g' | sed -e 's/linux //' | xargs pacman -S --noconfirm --needed base-devel cmake git go && \
    pacman -Scc --noconfirm && \
    useradd -m gomasy

ADD . /home/gomasy/nginx-mainline-boringssl/

RUN makepkg
