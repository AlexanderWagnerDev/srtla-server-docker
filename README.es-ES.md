

# 🎥 SRTLA Docker Server

[![Docker Hub](https://img.shields.io/docker/pulls/alexanderwagnerdev/srtla-server?style=flat-square)](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
[![GitHub](https://img.shields.io/github/license/AlexanderWagnerDev/srtla-server-docker?style=flat-square)](https://github.com/AlexanderWagnerDev/srtla-server-docker)

Un contenedor Docker para ejecutar un servidor SRTLA con SRT-Live-Server para transmisión con baja latencia.

---

## 🚀 Inicio Rápido

> **Recomendado:** Utiliza el instalador automatizado para obtener la mejor experiencia:
> 
> **[stream-relay-installer](https://github.com/AlexanderWagnerDev/stream-relay-installer)**
>
> Este instalador proporciona la configuración, gestión y despliegue adecuados del servidor SRTLA.

## 📖 Uso

### URLs de transmisión

- **Transmisión SRTLA:** `srt://ip:5000?streamid={livekey}`
- **Transmisión SRT:** `srt://ip:4001?streamid={livekey}`
- **Visualización/Reproducción:** `srt://ip:4000?streamid={playkey}`

### Estadísticas

- **Estadísticas modernas:** `http://ip:8080/stats/{playkey}`
- **Estadísticas legadas:** `http://ip:8080/stats/{playkey}?legacy=1`

> **Nota:** `{livekey}` y `{playkey}` deben configurarse con [slspanel](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 🔌 Configuración de puertos

| Puerto | Protocolo | Descripción |
|------|----------|-------------|
| 4000 | UDP | Reproducción SRT |
| 4001 | UDP | Transmisión SRT |
| 5000 | UDP | Transmisión SRTLA |
| 8080 | TCP | Estadísticas/HTTP |

## 📦 Desarrollado con

Este proyecto se basa en los siguientes componentes de código abierto:

- **SRT:** [OpenIRL/srt](https://github.com/OpenIRL/srt)
- **SRTLA:** [OpenIRL/srtla](https://github.com/OpenIRL/srtla)
- **SRT-Live-Server:** [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)

## 🔗 Enlaces

- **Docker Hub:** [alexanderwagnerdev/srtla-server](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
- **Instalador:** [stream-relay-installer](https://github.com/AlexanderWagnerDev/stream-relay-installer)
- **Panel de administración:** [slspanel-docker](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 📄 Licencia

Consulta el archivo LICENSE para más detalles.

---

# 🎥 SRTLA Docker Server (Español)

Un contenedor Docker para ejecutar un servidor SRTLA con SRT-Live-Server para transmisión con baja latencia.

---

## 🚀 Inicio Rápido

> **Recomendado:** Utiliza el instalador automatizado para obtener la mejor experiencia:
> 
> **[stream-relay-installer](https://github.com/AlexanderWagnerDev/stream-relay-installer)**
>
> Este instalador proporciona la configuración, gestión y despliegue adecuados del servidor SRTLA.

## 📖 Uso

### URLs de transmisión

- **Transmisión SRTLA:** `srt://ip:5000?streamid={livekey}`
- **Transmisión SRT:** `srt://ip:4001?streamid={livekey}`
- **Reproducción:** `srt://ip:4000?streamid={playkey}`

### Estadísticas

- **Estadísticas modernas:** `http://ip:8080/stats/{playkey}`
- **Estadísticas legadas:** `http://ip:8080/stats/{playkey}?legacy=1`

> **Nota:** `{livekey}` y `{playkey}` deben configurarse con [slspanel](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 🔌 Configuración de puertos

| Puerto | Protocolo | Descripción |
|------|-----------|--------------|
| 4000 | UDP | Reproducción SRT |
| 4001 | UDP | Transmisión SRT |
| 5000 | UDP | Transmisión SRTLA |
| 8080 | TCP | Estadísticas/HTTP |

## 📦 Tecnologías utilizadas

Este proyecto se basa en los siguientes componentes de código abierto:

- **SRT:** [OpenIRL/srt](https://github.com/OpenIRL/srt)
- **SRTLA:** [OpenIRL/srtla](https://github.com/OpenIRL/srtla)
- **SRT-Live-Server:** [OpenIRL/srt-live-server](https://github.com/OpenIRL/srt-live-server)

## 🔗 Enlaces

- **Docker Hub:** [alexanderwagnerdev/srtla-server](https://hub.docker.com/r/alexanderwagnerdev/srtla-server)
- **Instalador:** [stream-relay-installer](https://github.com/AlexanderWagnerDev/stream-relay-installer)
- **Panel de administración:** [slspanel-docker](https://github.com/AlexanderWagnerDev/slspanel-docker)

## 📄 Licencia

Consulta el archivo LICENSE para más detalles.
