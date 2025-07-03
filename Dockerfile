FROM ubuntu:22.04

RUN apt update && apt install -y curl sudo gnupg docker.io unzip

RUN useradd -m -d /home/container -s /bin/bash container
USER container
WORKDIR /home/container

RUN curl -L https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64 -o wings && \
    chmod +x wings

EXPOSE 8080

CMD ["./wings"]
