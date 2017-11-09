FROM ubuntu:16.04

WORKDIR /opt/dnsmasq
COPY src src
COPY Makefile .
COPY entries.conf.docker entries.conf

RUN apt-get update && apt-get install --yes make gcc
RUN make

EXPOSE 5353/tcp 5353/udp
ENTRYPOINT [ "src/dnsmasq", "--no-daemon", "-p", "5353", "-H", "entries.conf" ]