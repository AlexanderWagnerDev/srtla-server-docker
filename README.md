# SRTLA Docker Server BETA

For all systems: docker run -d --name srtla-server --restart always -p 4000:4000/udp -p 4001:4001/udp -p 5000:5000/udp -p 8080:8080/tcp alexanderwagnerdev/srtla-server:beta

## Project Information

This project is based on the following components:

- SRT: [onsmith/srt](https://github.com/onsmith/srt)
- SRTLA: [OpenIRL/srtla](https://github.com/OpenIRL/srtla)
- SRT-Live-Server: [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)
- SRTLA-Reciver: [OpenIRL/srtla-receiver](https://github.com/OpenIRL/srtla-receiver)

## Usage:

SRTLA-Stream-URL: srt://ip:5000?streamid={livekey}

SRT-Stream-URL: srt://ip:4000?streamid={livekey}

Watch-URL: srt://ip:4001?streamid={livekey}

Stats-URL: http://ip:8080/stats/{livekey}

{livekey} is your streamkey, that musst be configure with sls-managment-ui

Docker Hub: https://hub.docker.com/r/alexanderwagnerdev/srtla-server
