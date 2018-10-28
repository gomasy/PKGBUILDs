FROM base/archlinux:latest
LABEL maintainer="Gomasy <nyan@gomasy.jp>"

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -Sgq base | sed -e ':loop; N; $!b loop; s/\n/ /g' | sed -e 's/linux //' | xargs pacman -S --noconfirm --needed acl base-devel gawk git glibc gpm libffi libgcrypt libxt lua pcre python python2 ruby zlib && \
    useradd -m gomasy

ADD . /home/gomasy/vim-mainline/

RUN chown -R gomasy. /home/gomasy && \
    su -l gomasy -c "cd vim-mainline && makepkg"
