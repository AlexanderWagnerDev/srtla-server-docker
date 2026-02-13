# SRTLA Docker Server

For all systems: docker run -d --name srtla-server --restart unless-stopped -p 4000:4000/udp -p 4001:4001/udp -p 5000:5000/udp -p 8080:8080/tcp alexanderwagnerdev/srtla-server:latest

## Project Information

This project is based on the following components:

- SRT: [IRLServer/srt](https://github.com/irlserver/srt)
- SRTLA: [IRLServer/srtla](https://github.com/IRLServer/srtla)
- SRT-Live-Server: [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)

## Usage:

SRTLA-Stream-URL: srt://ip:5000?streamid={livekey}

SRT-Stream-URL: srt://ip:4001?streamid={livekey}

Watch-URL: srt://ip:4000?streamid={playkey}

Stats-URL: http://ip:8080/stats/{playkey}?legacy=1 (for legacy Stats Support)

Stats-URL: http://ip:8080/stats/{playkey}

{livekey} and {playkey} is your key, that musst be configure with [slspanel](https://github.com/AlexanderWagnerDev/slspanel-docker)

Docker Hub: [alexanderwagnerdev/srtla-server](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
