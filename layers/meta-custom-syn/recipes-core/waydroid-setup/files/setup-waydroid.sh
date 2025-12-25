#!/bin/bash
set -e

SETUP_FLAG="/var/lib/waydroid-installed"

if [ -f "$SETUP_FLAG" ]; then
    echo "Waydroid déjà installé"
    exit 0
fi

echo "=== Installation de Waydroid ==="

curl -fsSL https://repo.waydro.id/waydroid.gpg | \
    gpg --dearmor -o /usr/share/keyrings/waydroid.gpg

CODENAME=$(lsb_release -cs)
echo "deb [signed-by=/usr/share/keyrings/waydroid.gpg] https://repo.waydro.id/ ${CODENAME} main" > \
    /etc/apt/sources.list.d/waydroid.list

apt-get update
apt-get install -y waydroid

echo "=== Initialisation de Waydroid ==="
waydroid init -s GAPPS

waydroid prop set persist.waydroid.multi_windows true

touch "$SETUP_FLAG"

echo "=== Waydroid installé avec succès ==="
echo "Lancer avec: waydroid show-full-ui"