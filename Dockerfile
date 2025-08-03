# 1) ایمیج رسمی V2Fly
FROM v2fly/v2fly-core:latest

# 2) کپی کانفیگ
COPY config.json /etc/v2ray/config.json

# 3) expose پورت HTTPS
EXPOSE 443

# 4) entrypoint (همان باینری خود V2Fly است)
ENTRYPOINT ["/usr/bin/v2ray", "run", "-config", "/etc/v2ray/config.json"]
