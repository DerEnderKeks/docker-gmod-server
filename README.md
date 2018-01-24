# docker-gmod-server

*Dockerized Garry's Mod Server*

## Usage

### Requirements

* Docker
* docker-compose

### Installation

Choose a location to store the server files and clone this repository there:

`git clone https://github.com/DerEnderKeks/docker-gmod-server.git`

### Starting the server

To build and start the server execute: 

`docker-compose up`

To rebuild the container (e.g. to update it) execute:

`docker-compose build`

### Automatic startup

#### Systemd

Copy `init/systemd/gmod.service` to `/etc/systemd/system/` and fill in the location of the server

## License

[Unlicense](LICENSE)