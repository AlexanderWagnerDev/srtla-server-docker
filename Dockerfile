FROM ghcr.io/alexanderwagnerdev/alpine:builder AS sls-builder

WORKDIR /tmp

RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers alpine-sdk cmake tcl openssl-dev zlib-dev spdlog spdlog-dev sqlite-dev && \
    rm -rf /var/cache/apk/*

RUN git clone -b v0.28.0 https://github.com/yhirose/cpp-httplib.git /tmp/cpp-httplib && \
    cp /tmp/cpp-httplib/httplib.h /usr/include/ && \
    rm -rf /tmp/cpp-httplib

RUN git clone -b v1.5.4-irl2 https://github.com/irlserver/srt.git srt && \
    cd srt && \
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
          -DCMAKE_BUILD_TYPE=Release \
          -DENABLE_SHARED=ON . && \
    make -j$(nproc) && \
    make install

RUN git clone -b 1.5.0 https://github.com/OpenIRL/srt-live-server.git srt-live-server && \
    cd srt-live-server && \
    make -j$(nproc)

FROM ghcr.io/alexanderwagnerdev/alpine:builder AS srtla-builder

WORKDIR /tmp

RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers alpine-sdk cmake tcl openssl-dev zlib-dev spdlog spdlog-dev && \
    rm -rf /var/cache/apk/*

RUN git clone -b main https://github.com/OpenIRL/srtla.git srtla && \
    cd srtla && \
    git submodule update --init --recursive && \
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DENABLE_SHARED=ON . && \
    make -j$(nproc)

FROM ghcr.io/alexanderwagnerdev/alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache openssl libstdc++ supervisor coreutils procps spdlog perl sqlite && \
    rm -rf /var/cache/apk/*

RUN adduser -D -u 3001 -s /bin/sh sls && \
    adduser -D -u 3002 -s /bin/sh srtla

COPY --from=srtla-builder /tmp/srtla/srtla_rec /usr/local/bin
COPY --from=sls-builder /tmp/srt-live-server/bin /usr/local/bin
COPY --from=sls-builder /usr/local/bin/srt-* /usr/local/bin
COPY --from=sls-builder /usr/local/lib/libsrt* /usr/local/lib
COPY --from=sls-builder /usr/include/httplib.h /usr/include/

COPY --chmod=755 bin/logprefix /bin/logprefix

COPY conf/sls.conf /etc/sls/
COPY conf/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/sls /var/lib/sls /tmp/sls && \
    chmod 755 /etc/sls /var/lib/sls /tmp/sls && \
    chmod 666 /etc/sls/sls.conf

EXPOSE 4000/udp 4001/udp 5000/udp 8080/tcp

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
