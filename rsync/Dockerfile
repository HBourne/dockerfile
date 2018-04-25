FROM alpine:3.7

RUN apk add --no-cache --update rsync

COPY rsyncd.conf /etc/rsyncd.conf
COPY rsync.passwd /etc/rsync.passwd

VOLUME ["/var/data"]
ENTRYPOINT ["/usr/bin/rsync"]
