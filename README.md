# SRTLA Docker Server BETA

For all systems: docker run -d --name srtla-server --restart always -p 4000:4000/udp -p 4001:4001/udp -p 5000:5000/udp -p 8080:8080/tcp alexanderwagnerdev/srtla-server:beta

## Usage:

SRTLA-Stream-URL: srt://ip:5000?streamid={livekey}

SRT-Stream-URL: srt://ip:4000?streamid={livekey}

Watch-URL: srt://ip:4001?streamid={livekey}

Stats-URL: http://ip:8080/stats/{livekey}

{livekey} is your streamkey, that can be anything

## Build Docker Image self:

wget https://raw.githubusercontent.com/AlexanderWagnerDev/srtla-server-docker/beta/Dockerfile

Build Image: docker build --no-cache -t srtla-server .

Run Container: docker run -d --name srtla-server --restart always -p 4000:4000/udp -p 4001:4001/udp -p 5000:5000/udp -p 8080:8080/tcp srtla-server

Docker Hub: https://hub.docker.com/r/alexanderwagnerdev/srtla-server
