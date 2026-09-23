#!/data/data/com.termux/files/usr/bin/bash
# Name + system information sci-fi banner

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
MAGENTA="\033[1;35m"
YELLOW="\033[1;33m"

name="$(cat "$HOME/.banner-name" 2>/dev/null)"
[ -n "$name" ] || name="${USER:-TERMUX}"

clear
printf "${MAGENTA}╔════════════════════════════════════════════╗${RESET}\n"

if command -v figlet >/dev/null 2>&1; then
  figlet -f slant "$name" 2>/dev/null || figlet "$name"
elif command -v toilet >/dev/null 2>&1; then
  toilet "$name"
else
  printf "${CYAN}        >>> %s <<<${RESET}\n" "$name"
fi

printf "${MAGENTA}╚════════════════════════════════════════════╝${RESET}\n"

printf "${GREEN}USER${RESET} : %s\n" "${USER:-termux}"
printf "${GREEN}HOST${RESET} : %s\n" "$(hostname 2>/dev/null || printf android)"
printf "${GREEN}ARCH${RESET} : %s\n" "$(uname -m 2>/dev/null || printf unknown)"
printf "${GREEN}DATE${RESET} : %s\n" "$(date '+%Y-%m-%d')"
printf "${GREEN}TIME${RESET} : %s\n" "$(date '+%H:%M:%S')"

printf "${YELLOW}\n[ SIGNAL ] TONE RUNNING :: ${RESET}"
i=1
while [ "$i" -le 12 ]; do
  printf "▰"
  printf '\a'
  sleep 0.04
  i=$((i + 1))
done
printf "\n"

printf "${CYAN}[ DATA ] "
i=1
while [ "$i" -le 24 ]; do
  printf '%s' "$((RANDOM % 10))"
  i=$((i + 1))
done
printf "\n"
