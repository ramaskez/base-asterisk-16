# TelXLv2-Asterisk

This is the asteirsk container for the TelXL-v2-POD This container is based on the [TelXL-Base](https://gitlab.com/telxl/docker-base) image. 

## Getting Started

First steps require this repository to be cloned to your local machine:
```
git clone https://gitlab.com/telxl/docker-asterisk.git
```
Which will create a folder called docker-asterisk


### Prerequisites

You must have a working version of docker and docker-compose. You must also have access to the image [TelXL-Base](https://gitlab.com/telxl/docker-base).


### Installing

To install docker and docker-compose please see: [here](https://gitlab.com/telxl/docker-base#installing) 


## Deployment

To build a new version of this image locally:
```
docker build -t telxl-asterisk:latest .
```

To run a single use container based on this image:
```
docker run --rm -it telxl-asterisk:latest  

```

To run a single use container and start a bash shell based on this image:
```
docker run --rm -it telxl-asterisk:latest bash 

```


Example of docker-compose.yml
```
version: "3"
services:
    asterisk:
    build:
      context: ../Docker-Build/asterisk/
    command: "-vvvvgc"
    restart: unless-stopped
    ports:
      # guest:host
      - 8089:8089
      - "10000-10100:10000-10100/udp"
    volumes:
      - /home/docker/asterisk/certs/:/certs
    networks:
      - ext

networks:
  ext:
    driver: bridge
```

### Docker Run
To run this container:
```
docker run --rm -it -p 8089:8089 -p 10000-10100:10000-10100/udp -v /home/docker/asterisk/certs/:/certs telxl-asterisk
```

To run this container and connect to bash:
```
docker run --rm -it -p 8089:8089 -p 10000-10100:10000-10100/udp -v /home/docker/asterisk/certs/:/certs telxl-asterisk bash
```

### Docker Compose
'''
version: "3"
services:
    asterisk:
    build:
      context: ../Docker-Build/asterisk/
    command: "-vvvvgc"
    restart: unless-stopped
    ports:
      # guest:host
      - 8089:8089
      - "10000-10100:10000-10100/udp"
    volumes:
      - /home/docker/asterisk/certs/:/certs
    networks:
      - ext

networks:
  ext:
    driver: bridge
'''

## Built With

* [Debian](https://www.python.org/) - API's
* [Asterisk](https://hub.docker.com/_/rabbitmq)
* [Docker-ce](https://docs.docker.com/) - Container Platform
* [Docker-Compose](https://docs.docker.com/compose/) - Docker-Compose

## Authors

* **Simon Sharman** - *Initial work*