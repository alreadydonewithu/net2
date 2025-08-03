FROM alpine:3.18

# نصب ابزارهای لازم
RUN apk add --no-cache curl tar libc6-compat

# نصب shadowsocks-libev
RUN curl -sSL https://github.com/shadowsocks/shadowsocks-libev/releases/latest/download/shadowsocks-libev-linux64.tar.gz | tar xz -C /usr/local/bin --strip-components=1

# نصب v2ray-plugin
RUN curl -sSL https://github.com/shadowsocks/v2ray-plugin/releases/latest/download/v2ray-plugin-linux-amd64.tar.gz | tar xz -C /usr/local/bin && \
    mv /usr/local/bin/v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin && \
    chmod +x /usr/local/bin/v2ray-plugin

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443
CMD ["/start.sh"]
