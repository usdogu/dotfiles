#!/usr/bin/env bash
# Polybar launcher. Author on Muhammed Taha

# Önce varsa açık olan barları kapat
killall -q polybar

# İşlemler kapatılana kadar bekle
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Değişkenler
BAT=$(ls /sys/class/power_supply/ | grep BAT)
WLAN=$(ip route | grep '^default' | awk '{print $5}')
export WLAN
export BAT

# Barları başlat
polybar root &
polybar main &

echo "Barlar başlatıldı..."
