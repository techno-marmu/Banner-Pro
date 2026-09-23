#!/data/data/com.termux/files/usr/bin/bash
# Restore only Banner-Pro hooks and generated banner files.

echo "[*] Restoring original shell startup..."

if [ -f "$PREFIX/etc/bash.bashrc" ]; then
  sed -i '\|^source ~/.current-banner.sh$|d' "$PREFIX/etc/bash.bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
  sed -i '\|^source ~/.current-banner.sh$|d' "$HOME/.zshrc"
fi

rm -f "$HOME/.current-banner.sh"
rm -f "$HOME/.banner-name"

echo "[+] Banner-Pro startup hook removed."
echo "[+] Your other shell configuration was left untouched."
