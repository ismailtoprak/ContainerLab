#!/usr/bin/env bash

set -e

# remember current directory
OLD_PATH=$(pwd)
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cleanup() {
  cd "$OLD_PATH"
}
trap cleanup EXIT

cd "$SCRIPT_PATH"

echo "[+] Starting docker compose (build + up)..."
docker compose up -d --build

echo "[+] Opening a shell inside the container..."
docker compose exec pluto-build bash

echo "[+] Stopping container..."
docker compose stop -t 0

echo "[+] Done."
