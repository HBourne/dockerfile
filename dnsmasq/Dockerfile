FROM alpine:3.7

RUN apk add --no-cache --update dnsmasq iptables

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY entrypoint.sh /

ENV IP 192.168.10.1/24
ENV DEVICE eth0
ENV BOOT pxelinux.0

VOLUME ["/var/tftpd"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["dnsmasq","-d"]
