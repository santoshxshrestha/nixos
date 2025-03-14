FROM archlinux:latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel neofetch
RUN curl -sSL https://raw.githubusercontent.com/SantoshShrestha11/replica/refs/heads/main/script.sh | bash

WORKDIR /workspace

CMD ["/bin/bash"]
