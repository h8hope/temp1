FROM ubuntu:focal
MAINTAINER Anton Kiselev

ENV TS_VERSION=1.1.77

EXPOSE 8090:8090

RUN apt-get update && apt-get install -y wget && \
    mkdir /torrserver/ && cd /torrserver/ && mkdir /db && \
    wget -O TorrServer -P /torrserver/ "https://github.com/YouROK/TorrServer/releases/download/$TS_VERSION/TorrServer-linux-arm64" && \
    chmod +x /torrserver/TorrServer

ENTRYPOINT ["/torrserver/TorrServer"]
CMD ["--path", "/torrserver/db"]
