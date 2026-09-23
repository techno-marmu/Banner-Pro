#!/data/data/com.termux/files/usr/bin/bash
# Banner-Pro main setup
# Termux / Bash / Zsh compatible hook

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
MAGENTA="\033[1;35m"
WHITE="\033[1;37m"

echo -e "${CYAN}========================================${RESET}"
echo -e "${GREEN}        BANNER-PRO INSTALLER${RESET}"
echo -e "${CYAN}========================================${RESET}"
echo -e "${WHITE}  1) Alien${RESET}"
echo -e "${WHITE}  2) Hacker${RESET}"
echo -e "${WHITE}  3) Cyber Matrix${RESET}"
echo -e "${WHITE}  4) Wolf${RESET}"
echo -e "${WHITE}  5) Spider${RESET}"
echo -e "${WHITE}  6) Bat${RESET}"
echo -e "${WHITE}  7) Lobster${RESET}"
echo -e "${WHITE}  8) Matrix Skull${RESET}"
echo -e "${WHITE}  9) Cyber Dragon${RESET}"
echo -e "${WHITE} 10) Name / System${RESET}"
echo -e "${WHITE}  R) Restore original${RESET}"
echo -e "${WHITE}  0) Exit${RESET}"
echo -e "${CYAN}========================================${RESET}"

read -r -p "Select: " choice

case "$choice" in
  1) selected="$HOME/Banner-Pro/banner-logo/Arts/alien.sh" ;;
  2) selected="$HOME/Banner-Pro/banner-logo/Arts/hacker.sh" ;;
  3) selected="$HOME/Banner-Pro/banner-logo/cyber.sh" ;;
  4) selected="$HOME/Banner-Pro/banner-logo/Arts/wolf.sh" ;;
  5) selected="$HOME/Banner-Pro/banner-logo/Arts/spider.sh" ;;
  6) selected="$HOME/Banner-Pro/banner-logo/Arts/bat.sh" ;;
  7) selected="$HOME/Banner-Pro/banner-logo/Arts/lobster.sh" ;;
  8) selected="$HOME/Banner-Pro/banner-logo/Arts/matrix-skull.sh" ;;
  9) selected="$HOME/Banner-Pro/banner-logo/Arts/cyber-dragon.sh" ;;
  10)
    read -r -p "Enter your name: " banner_name
    printf '%s\n' "$banner_name" > "$HOME/.banner-name"
    selected="$HOME/Banner-Pro/banner-logo/name.sh"
    ;;
  [Rr])
    bash "$HOME/Banner-Pro/banner-logo/restore-original.sh"
    exit 0
    ;;
  0)
    exit 0
    ;;
  *)
    echo -e "${RED}[!] Invalid option.${RESET}"
    exit 1
    ;;
esac

if [ ! -f "$selected" ]; then
  echo -e "${RED}[!] Banner file not found: $selected${RESET}"
  exit 1
fi

bash "$HOME/Banner-Pro/effect.sh"

printf '%s\n' '# Banner-Pro current banner' > "$HOME/.current-banner.sh"
printf '%s\n' "source \"$selected\"" >> "$HOME/.current-banner.sh"
chmod +x "$HOME/.current-banner.sh"

if [ -f "$PREFIX/etc/bash.bashrc" ]; then
  grep -qxF 'source ~/.current-banner.sh' "$PREFIX/etc/bash.bashrc" ||     printf '%s\n' 'source ~/.current-banner.sh' >> "$PREFIX/etc/bash.bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
  grep -qxF 'source ~/.current-banner.sh' "$HOME/.zshrc" ||     printf '%s\n' 'source ~/.current-banner.sh' >> "$HOME/.zshrc"
fi

echo -e "${GREEN}[+] Banner installed successfully.${RESET}"
echo -e "${YELLOW}[i] Restart Termux or run: source ~/.current-banner.sh${RESET}"
