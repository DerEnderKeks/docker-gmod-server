# docker-gmod-server

*Dockerized Garry's Mod Server*

This is a Docker container for [Garry's Mod](https://gmod.facepunch.com/).

## Usage

### Requirements

* Docker
* docker-compose

### Installation

Choose a location to store the server files and clone this repository there:

`git clone https://github.com/DerEnderKeks/docker-gmod-server.git`

### Configuration

Inside of the container the server is installed in `/gmod-base` and has the volume `/gmod-volume` overlayed using UnionFS.
By default the volume is mounted on the host in `./server`, where you can place your configuration files.

### Starting the server

To build and start the server execute: 

`docker-compose up`

To rebuild the container (e.g. to update it) execute:

`docker-compose build`

### Adding content (like CSS)

By default the Dockerfile installs *Counter Strike: Source* content to  `/gmod-extras/css`. To add more just edit the Dockerfile and add lines like there are already present for CSS.

### Automatic startup

#### Systemd

Copy `init/systemd/gmod.service` to `/etc/systemd/system/`, fill in the location of the server files and execute `systemctl enable gmod`.

## License

[Unlicense](LICENSE)