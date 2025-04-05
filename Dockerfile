# syntax=docker/dockerfile:1.12
FROM archlinux:latest AS builder

RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    curl -s https://repos.gomasy.jp/gomasy.key | pacman-key --add - && \
    pacman-key --lsign-key D978AC7E && \
    echo "[gomasy]" >> /etc/pacman.conf  && \
    echo 'Server = https://repos.gomasy.jp/os/$arch' >> /etc/pacman.conf && \
    pacman -Syu --noconfirm base-devel && \
    useradd -d /opt/builder builder && \
    echo "builder ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo 'PACKAGER="Gomasy <nyan@gomasy.jp>"' >> /etc/makepkg.conf

COPY --chown=builder:builder . /opt/builder

# package: vim-mainline
FROM builder AS vim-builder

USER builder
WORKDIR /opt/builder/vim-mainline

RUN makepkg -s --noconfirm OPTIONS=-debug

# package: neovim-mainline
FROM builder AS neovim-builder

USER builder
WORKDIR /opt/builder/neovim-mainline

RUN makepkg -s --noconfirm OPTIONS=-debug

# merge
FROM builder

WORKDIR /opt/builder

COPY --from=vim-builder /opt/builder/vim-mainline/*.tar.zst /opt/builder/vim-mainline/
COPY --from=neovim-builder /opt/builder/neovim-mainline/*.tar.zst /opt/builder/neovim-mainline/
