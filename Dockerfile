FROM  alpine:3@sha256:ff6bdca1701f3a8a67e328815ff2346b0e4067d32ec36b7992c1fdc001dc8517

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
