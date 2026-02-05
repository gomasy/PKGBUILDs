# syntax=docker/dockerfile:1.12
FROM ghcr.io/gomasy/archlinuxarm AS builder

RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    curl -s https://repos.gomasy.jp/gomasy.key | pacman-key --add - && \
    pacman-key --lsign-key D978AC7E && \
    echo "[gomasy]" >> /etc/pacman.conf  && \
    echo 'Server = https://repos.gomasy.jp/os/$arch' >> /etc/pacman.conf && \
    sed -i 's/#DisableSandbox/DisableSandbox/' /etc/pacman.conf && \
    sed -i 's/\[options]/\[options]\nIgnorePkg = filesystem/' /etc/pacman.conf && \
    pacman -Syu --noconfirm base-devel && \
    useradd -d /opt/builder builder && \
    echo "builder ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i -e '/^OPTIONS=/s/ debug/ !debug/' /etc/makepkg.conf && \
    echo 'PACKAGER="Gomasy <nyan@gomasy.jp>"' >> /etc/makepkg.conf

COPY --chown=builder:builder . /opt/builder

FROM builder

USER builder
WORKDIR /opt/builder

RUN makepkg -s --noconfirm
