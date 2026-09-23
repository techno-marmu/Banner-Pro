#!/data/data/com.termux/files/usr/bin/bash
# Banner-Pro optional requirements

echo "[*] Updating Termux packages..."
pkg update -y

echo "[*] Installing banner tools..."
pkg install -y bash figlet toilet cowsay

echo "[+] Requirements installation complete."
echo "[i] Optional tools such as termux-api can be installed separately."
