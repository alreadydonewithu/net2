#!/bin/sh

SS_PASSWORD="${PASSWORD:-fardad1386}"
SS_METHOD="${ENCRYPT:-aes-256-gcm}"
WS_PATH="${WS_PATH:-/vpn}"
SERVER_HOST="${RENDER_EXTERNAL_HOSTNAME:-0.0.0.0}"

exec ss-server \
  -s 0.0.0.0 \
  -p 443 \
  -k "${SS_PASSWORD}" \
  -m "${SS_METHOD}" \
  --plugin v2ray-plugin \
  --plugin-opts "server;tls;host=${SERVER_HOST};path=${WS_PATH}"
