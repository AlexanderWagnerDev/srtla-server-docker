# SRTLA Docker Server

For all systems: docker run -d --name srtla-server --restart always -p 8080:8080/tcp -p 5000:5000/udp -p 4001:4001/udp alexanderwagnerdev/srtla-server:latest

## Project Information

This project is based on the following components:

- SRT: [onsmith/srt](https://github.com/onsmith/srt)
- SRTLA: [OpenIRL/srtla](https://github.com/OpenIRL/srtla)
- SRT-Live-Server: [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)
- SRTLA-Reciver: [OpenIRL/srtla-receiver](https://github.com/OpenIRL/srtla-receiver)

## Usage:

SRTLA-Stream-URL: srtla://ip:5000?streamid=publish/stream/{livekey}

SRT-Stream-URL: srt://ip:4001?streamid=publish/stream/{livekey}

Watch-URL: srt://ip:4001?streamid=play/stream/{livekey}

Stats-URL: http://ip:8080/stats/publish/stream/{livekey}

{livekey} is your streamkey, that can be anything

## Build Docker Image self:

wget https://raw.githubusercontent.com/AlexanderWagnerDev/srtla-server-docker/main/Dockerfile

Build Image: docker build --no-cache -t srtla-server .

Run Container: docker run -d --name srtla-server --restart always -p 8080:8080/tcp -p 5000:5000/udp -p 4001:4001/udp srtla-server

Docker Hub: https://hub.docker.com/r/alexanderwagnerdev/srtla-server
