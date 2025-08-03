FROM alpine:latest

RUN apk add --no-cache shadowsocks-libev v2ray-plugin

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443

CMD ["/start.sh"]
