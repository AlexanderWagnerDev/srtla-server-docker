FROM alpine:latest AS builder

WORKDIR /tmp

RUN apk update && apk upgrade \
    && apk add --no-cache linux-headers alpine-sdk cmake tcl openssl-dev zlib-dev spdlog spdlog-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/onsmith/srt.git srt \
    && cd srt \
    && ./configure \
    && make -j$(nproc) \
    && make install

RUN git clone https://github.com/OpenIRL/srt-live-server.git --branch 1.0.1 srt-live-server \
    && cd srt-live-server \
    && make -j$(nproc)

RUN git clone https://github.com/OpenIRL/srtla.git srtla \
    && cd srtla \
    && git submodule update --init --recursive \
    && cmake . \
    && make -j${nproc}

FROM alpine:latest

RUN apk update && apk upgrade \
    && apk add --no-cache openssl libstdc++ supervisor coreutils spdlog perl \
    && rm -rf /var/cache/apk/*

COPY --from=builder /tmp/srtla/srtla_rec /usr/local/bin
COPY --from=builder /tmp/srt-live-server/bin /usr/local/bin
COPY --from=builder /usr/local/bin/srt-* /usr/local/bin
COPY --from=builder /usr/local/lib/libsrt* /usr/local/lib

COPY --chmod=755 bin/logprefix /bin/logprefix

COPY conf/sls.conf /etc/sls/sls.conf

COPY conf/supervisord.conf /etc/supervisord.conf

EXPOSE 5000/udp 4001/udp 8080/tcp

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

