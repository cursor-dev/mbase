FROM ubuntu:15.10
MAINTAINER Tim Haak <tim@haak.co>

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM="xterm"

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup &&\
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    apt-get -q update && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy --force-yes \
    ca-certificates curl openssl xmlstarlet curl sudo \
    python-software-properties

# Clean-up tasks
RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
