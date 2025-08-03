# —————————————————————————————
# 1) Base image
# —————————————————————————————
FROM alpine:3.18

# —————————————————————————————
# 2) ابزارهای مورد نیاز
#    - curl برای دانلود
#    - tar و xz برای اکسترکت
# —————————————————————————————
RUN apk add --no-cache curl tar xz

# —————————————————————————————
# 3) دانلود آخرین نسخه Shadowsocks-Rust و نصبش
#    - می‌گیریم tag آخر رو از API
#    - می‌سازیم URL صحیح
#    - دانلود و اکسترکت و انتقال باینری
# —————————————————————————————
RUN export VER=$(curl -sSL https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest \
                  | grep '"tag_name":' \
                  | cut -d '"' -f4) \
    && echo "Installing shadowsocks-rust $VER" \
    && curl -L -o ss.tar.xz \
         https://github.com/shadowsocks/shadowsocks-rust/releases/download/${VER}/shadowsocks-${VER}.x86_64-unknown-linux-musl.tar.xz \
    && tar -xJf ss.tar.xz \
    && mv ssserver /usr/local/bin/ssserver \
    && chmod +x /usr/local/bin/ssserver \
    && rm ss.tar.xz

# —————————————————————————————
# 4) دانلود و نصب v2ray-plugin
# —————————————————————————————
RUN curl -L -o v2ray-plugin.tar.gz \
         https://github.com/shadowsocks/v2ray-plugin/releases/latest/download/v2ray-plugin-linux-amd64.tar.gz \
    && tar -xzf v2ray-plugin.tar.gz \
    && mv v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin \
    && chmod +x /usr/local/bin/v2ray-plugin \
    && rm v2ray-plugin.tar.gz

# —————————————————————————————
# 5) Copy start script
# —————————————————————————————
COPY start.sh /start.sh
RUN chmod +x /start.sh

# —————————————————————————————
# 6) Exposure and entrypoint
# —————————————————————————————
EXPOSE 443
CMD ["/start.sh"]
