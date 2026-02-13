# 🎥 SRTLA Docker Server

[![Docker Hub](https://img.shields.io/docker/pulls/alexanderwagnerdev/srtla-server?style=flat-square)](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
[![GitHub](https://img.shields.io/github/license/AlexanderWagnerDev/srtla-server-docker?style=flat-square)](https://github.com/AlexanderWagnerDev/srtla-server-docker)

A Docker container for running an SRTLA server with SRT-Live-Server for low-latency streaming.

---

## 🚀 Quick Start

```bash
docker run -d \
  --name srtla-server \
  --restart unless-stopped \
  -p 4000:4000/udp \
  -p 4001:4001/udp \
  -p 5000:5000/udp \
  -p 8080:8080/tcp \
  alexanderwagnerdev/srtla-server:latest
```

## 📖 Usage

### Stream URLs

- **SRTLA Stream:** `srt://ip:5000?streamid={livekey}`
- **SRT Stream:** `srt://ip:4001?streamid={livekey}`
- **Watch/Playback:** `srt://ip:4000?streamid={playkey}`

### Statistics

- **Modern Stats:** `http://ip:8080/stats/{playkey}`
- **Legacy Stats:** `http://ip:8080/stats/{playkey}?legacy=1`

> **Note:** `{livekey}` and `{playkey}` must be configured with [slspanel](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 🔌 Port Configuration

| Port | Protocol | Description |
|------|----------|-------------|
| 4000 | UDP | SRT Playback |
| 4001 | UDP | SRT Streaming |
| 5000 | UDP | SRTLA Streaming |
| 8080 | TCP | Statistics/HTTP |

## 📦 Built With

This project is based on the following open-source components:

- **SRT:** [IRLServer/srt](https://github.com/irlserver/srt)
- **SRTLA:** [IRLServer/srtla](https://github.com/IRLServer/srtla)
- **SRT-Live-Server:** [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)

## 🔗 Links

- **Docker Hub:** [alexanderwagnerdev/srtla-server](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
- **Management Panel:** [slspanel-docker](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 📄 License

See LICENSE file for details.

---

# 🎥 SRTLA Docker Server (Deutsch)

Ein Docker-Container für einen SRTLA-Server mit SRT-Live-Server für Streaming mit niedriger Latenz.

---

## 🚀 Schnellstart

```bash
docker run -d \
  --name srtla-server \
  --restart unless-stopped \
  -p 4000:4000/udp \
  -p 4001:4001/udp \
  -p 5000:5000/udp \
  -p 8080:8080/tcp \
  alexanderwagnerdev/srtla-server:latest
```

## 📖 Verwendung

### Stream-URLs

- **SRTLA Stream:** `srt://ip:5000?streamid={livekey}`
- **SRT Stream:** `srt://ip:4001?streamid={livekey}`
- **Wiedergabe:** `srt://ip:4000?streamid={playkey}`

### Statistiken

- **Moderne Stats:** `http://ip:8080/stats/{playkey}`
- **Legacy Stats:** `http://ip:8080/stats/{playkey}?legacy=1`

> **Hinweis:** `{livekey}` und `{playkey}` müssen mit [slspanel](https://github.com/AlexanderWagnerDev/slspanel-docker) konfiguriert werden

## 🔌 Port-Konfiguration

| Port | Protokoll | Beschreibung |
|------|-----------|--------------|
| 4000 | UDP | SRT Wiedergabe |
| 4001 | UDP | SRT Streaming |
| 5000 | UDP | SRTLA Streaming |
| 8080 | TCP | Statistiken/HTTP |

## 📦 Basiert auf

Dieses Projekt basiert auf folgenden Open-Source-Komponenten:

- **SRT:** [IRLServer/srt](https://github.com/irlserver/srt)
- **SRTLA:** [IRLServer/srtla](https://github.com/IRLServer/srtla)
- **SRT-Live-Server:** [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)

## 🔗 Links

- **Docker Hub:** [alexanderwagnerdev/srtla-server](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
- **Verwaltungs-Panel:** [slspanel-docker](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 📄 Lizenz

Details siehe LICENSE-Datei.