FROM debian:stretch

LABEL maintainer="DerEnderKeks"

RUN apt-get update && apt-get -y install lib32gcc1 libc6 curl libcurl3 unionfs-fuse
# Allow users to create unionfs mounts
RUN chmod u+s "$(which unionfs-fuse)"

# Create directories
RUN mkdir /gmod-base
RUN mkdir /gmod-volume
RUN mkdir /gmod-union
RUN mkdir /gmod-extras

VOLUME /gmod-volume

# Download steamcmd
RUN mkdir /steamcmd
WORKDIR /steamcmd
RUN curl http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar xz
RUN cp /steamcmd/linux32/libstdc++.so.6 /gmod-base/bin/

# Create gmod user and group and adjust file ownership
RUN groupadd gmod && useradd -m -g gmod -s /bin/bash gmod
RUN chown gmod:gmod -Rf /gmod-* /steamcmd

USER gmod

## Server
# Download GMOD
RUN /steamcmd/steamcmd.sh +login anonymous +force_install_dir /gmod-base +app_update 4020 validate +quit

## Content
# Download CSS
RUN mkdir /gmod-extras/css && /steamcmd/steamcmd.sh +login anonymous +force_install_dir /gmod-extras/css +app_update 232330 validate +quit

WORKDIR /

ADD start.sh /
EXPOSE 27015/udp

ENV ISDOCKER="true"

CMD ["/bin/sh", "/start.sh"]