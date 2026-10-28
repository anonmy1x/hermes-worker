#!/bin/sh
set -e

# If /opt/data/config.yaml is missing, seed it from /opt/hermes/seed-data/
if [ ! -f /opt/data/config.yaml ]; then
    echo "[hermes-worker] Seeding initial config into /opt/data..."
    mkdir -p /opt/data/platforms/pairing
    cp -r /opt/hermes/seed-data/* /opt/data/ 2>/dev/null || true
    chmod -R 777 /opt/data 2>/dev/null || true
fi

echo "[hermes-worker] Starting Hermes gateway..."
exec /opt/hermes/.venv/bin/hermes gateway run
