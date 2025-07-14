FROM alpine:latest AS builder

ENV LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib64

WORKDIR /tmp

RUN apk update && apk upgrade \
    && apk add --no-cache linux-headers alpine-sdk cmake tcl openssl-dev zlib-dev spdlog spdlog-dev sqlite-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/yhirose/cpp-httplib.git /tmp/cpp-httplib \
    && cp /tmp/cpp-httplib/httplib.h /usr/include/ \
    && rm -rf /tmp/cpp-httplib

RUN git clone https://github.com/onsmith/srt.git srt \
    && cd srt \
    && ./configure \
    && make -j$(nproc) \
    && make install

RUN git clone --branch 1.5.0 https://github.com/OpenIRL/srt-live-server.git srt-live-server \
    && cd srt-live-server \
    && make -j$(nproc)

RUN git clone https://github.com/OpenIRL/srtla.git srtla \
    && cd srtla \
    && git submodule update --init --recursive \
    && cmake . \
    && make -j${nproc}

FROM alpine:latest

ENV LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib64

RUN apk update && apk upgrade \
    && apk add --no-cache openssl libstdc++ supervisor coreutils spdlog perl procps net-tools sqlite sqlite-dev \
    && rm -rf /var/cache/apk/*

RUN adduser -D -u 3001 -s /bin/sh sls \
    && adduser -D -u 3002 -s /bin/sh srtla

COPY --from=builder /tmp/srtla/srtla_rec /usr/local/bin
COPY --from=builder /tmp/srt-live-server/bin /usr/local/bin
COPY --from=builder /usr/local/bin/srt-* /usr/local/bin
COPY --from=builder /usr/local/lib/libsrt* /usr/local/lib
COPY --from=builder /usr/include/httplib.h /usr/include/

COPY --chmod=755 bin/logprefix /bin/logprefix

COPY conf/sls.conf /etc/sls/sls.conf

RUN mkdir -p /etc/sls /var/lib/sls /tmp/sls && \
    chmod 755 /etc/sls /var/lib/sls /tmp/sls && \
    chmod 666 /etc/sls/sls.conf

COPY conf/supervisord.conf /etc/supervisord.conf

EXPOSE 5000/udp 4000/udp 4001/udp 8080/tcp

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
