#!/bin/sh

SS_PASSWORD="${PASSWORD}"
SS_METHOD="${ENCRYPT:-aes-256-gcm}"
WS_PATH="${WS_PATH:-/vpn}"

exec ss-server \
  -s 0.0.0.0 -p 443 \
  -k "${SS_PASSWORD}" -m "${SS_METHOD}" \
  --plugin v2ray-plugin \
  --plugin-opts "server;tls;host=${RENDER_INTERNAL_HOST};path=${WS_PATH}"
