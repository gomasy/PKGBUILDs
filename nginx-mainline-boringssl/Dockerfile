FROM base/archlinux:latest
LABEL maintainer="Gomasy <nyan@gomasy.jp>"

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -Sgq base | sed -e ':loop; N; $!b loop; s/\n/ /g' | sed -e 's/linux //' | xargs pacman -S --noconfirm --needed base-devel pcre zlib geoip mailcap cmake git go && \
    useradd -m gomasy

ADD . /home/gomasy/nginx-mainline-boringssl/

RUN chown -R gomasy. /home/gomasy && \
    su -l gomasy -c "gpg --recv-keys 520A9993A1C052F8" && \
    su -l gomasy -c "cd nginx-mainline-boringssl && makepkg"
