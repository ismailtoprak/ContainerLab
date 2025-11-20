#!/usr/bin/env bash

set -e

SERVICE=${1:-ollama}

echo "[+] Docker Compose başlatılıyor..."
# docker compose up -d --build

echo "[+] $SERVICE container'ı bekleniyor..."
until docker ps | grep -q "$SERVICE"; do
   sleep 1
done

if docker compose exec $SERVICE bash -c "exit" 2>/dev/null; then
   docker compose exec $SERVICE bash
else
   docker compose exec $SERVICE sh
fi
