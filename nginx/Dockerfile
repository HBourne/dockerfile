FROM alpine:3.7

RUN apk add --no-cache --update nginx

COPY entrypoint.sh /
COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/tftpd"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx","-g","'daemon off;'"]
