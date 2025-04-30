FROM alpine:latest AS builder

ENV LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib64
WORKDIR /tmp

RUN apk update && apk upgrade \
    && apk add --no-cache linux-headers alpine-sdk cmake tcl openssl-dev zlib-dev spdlog spdlog-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/AlexanderWagnerDev/srtla.git srtla \
    && cd srtla \
    && git submodule update --init --recursive \
    && cmake . \
    && make -j${nproc}

FROM alpine:latest

ENV LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib64

RUN apk update && apk upgrade \
    && apk add --no-cache openssl libstdc++ supervisor coreutils spdlog perl \
    && rm -rf /var/cache/apk/*

COPY --from=builder /tmp/srtla/srtla_rec /usr/local/bin

COPY --from=ghcr.io/openirl/srt-live-server:latest /usr/local/bin/* /usr/local/bin
COPY --from=ghcr.io/openirl/srt-live-server:latest /usr/local/lib/libsrt* /usr/local/lib

COPY --chmod=755 bin/logprefix /bin/logprefix

RUN wget -O /etc/sls/sls.conf https://raw.githubusercontent.com/AlexanderWagnerDev/srtla-server-docker/main/conf/sls.conf

RUN wget -O /etc/supervisord.conf https://raw.githubusercontent.com/AlexanderWagnerDev/srtla-server-docker/main/conf/supervisord.conf

EXPOSE 5000/udp 4000/udp 8789/tcp

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
