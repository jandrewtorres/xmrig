FROM  alpine:3@sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0efb90a

RUN apk add --no-cache git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev

RUN git clone https://github.com/xmrig/xmrig

RUN mkdir xmrig/build && cd xmrig/build && \
    cmake .. && \
    make -j$(nproc) && \
    chmod +x xmrig && \
    rm -r /xmrig/src

COPY config.json /xmrig/build/config.json

WORKDIR /xmrig/build
ENTRYPOINT ["./xmrig"]
