FROM alpine:3.18

# نصب ابزارهای لازم
RUN apk add --no-cache curl tar

# نصب Shadowsocks-Rust
RUN curl -L -o ss.tar.xz https://github.com/shadowsocks/shadowsocks-rust/releases/latest/download/shadowsocks-v1.17.4.x86_64-unknown-linux-musl.tar.xz && \
    tar -xf ss.tar.xz && \
    mv ssserver /usr/local/bin/ssserver && \
    chmod +x /usr/local/bin/ssserver && \
    rm -rf *.tar.*

# نصب v2ray-plugin
RUN curl -L -o v2ray-plugin.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/latest/download/v2ray-plugin-linux-amd64.tar.gz && \
    tar -xzf v2ray-plugin.tar.gz && \
    mv v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin && \
    chmod +x /usr/local/bin/v2ray-plugin && \
    rm -rf *.tar.gz

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443
CMD ["/start.sh"]
