FROM base/archlinux:latest
LABEL maintainer="Gomasy <nyan@gomasy.jp>"

RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
    pacman-db-upgrade && \
    pacman -Sgq base | sed -e ':loop; N; $!b loop; s/\n/ /g' | sed -e 's/linux //' | xargs pacman -S --noconfirm --needed base-devel acl glibc gpm libxt libffi libgcrypt pcre zlib gawk lua python python2 ruby git && \
    useradd -m gomasy

ADD . /home/gomasy/vim-mainline/

RUN chown -R gomasy. /home/gomasy && \
    su -l gomasy -c "cd vim-mainline && makepkg"
