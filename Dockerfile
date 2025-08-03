FROM debian:bookworm-slim

# 1) نصب Shadowsocks-libev و v2ray-plugin از مخازن رسمی دِبیان
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y shadowsocks-libev v2ray-plugin && \
    rm -rf /var/lib/apt/lists/*

# 2) کپی اسکریپت شروع
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 3) expose پورت HTTPS
EXPOSE 443

# 4) entrypoint
CMD ["/start.sh"]
