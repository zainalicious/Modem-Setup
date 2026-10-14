#!/bin/sh

set -e

cd /tmp && mount -o remount,rw /

if ! command -v wget >/dev/null 2>&1; then
  echo "[!] wget tidak ditemukan, menginstall wget..."
  curl -sL https://raw.githubusercontent.com/zainalicious/wget-rg501q/main/install_wget.sh | sh
  echo "[+] wget berhasil diinstall"
else
  echo "[*] wget sudah tersedia: $(which wget)"
fi


# install entware
cd /tmp && curl -sL https://raw.githubusercontent.com/zainalicious/Modem-Setup/main/installentware.sh | sh

# install quectool
cd /tmp && wget -O /tmp/q.tar.gz https://raw.githubusercontent.com/zainalicious/Modem-Setup/main/q.tar.gz
tar -xzf /tmp/q.tar.gz
./install.sh
opkg install dropbear --force-reinstall

# install adguardhome
cd /tmp && curl -sL https://raw.githubusercontent.com/zainalicious/Modem-Setup/main/install_adguardhome.sh | sh

