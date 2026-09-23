#!/data/data/com.termux/files/usr/bin/bash
# Live Cyber Matrix banner
# Designed to be source-able from Bash and Zsh.

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
DIM="\033[2m"

clear
printf "${CYAN}╔══════════════════════════════════════════════════════╗${RESET}\n"
printf "${CYAN}║             B A N N E R - P R O  //  C Y B E R     ║${RESET}\n"
printf "${CYAN}╚══════════════════════════════════════════════════════╝${RESET}\n"

user_name="${USER:-${LOGNAME:-termux}}"
host_name="$(hostname 2>/dev/null || printf 'android')"
arch="$(uname -m 2>/dev/null || printf 'unknown')"
day="$(date '+%A')"
date_now="$(date '+%Y-%m-%d')"
time_now="$(date '+%H:%M:%S')"

battery="N/A"
if command -v termux-battery-status >/dev/null 2>&1; then
  battery="$(termux-battery-status 2>/dev/null | grep -m1 '"percentage"' | tr -cd '0-9')%"
fi

printf "${GREEN}[ SYSTEM ]${RESET} User      : %s\n" "$user_name"
printf "${GREEN}[ SYSTEM ]${RESET} Host      : %s\n" "$host_name"
printf "${GREEN}[ SYSTEM ]${RESET} Arch      : %s\n" "$arch"
printf "${GREEN}[ SYSTEM ]${RESET} Battery   : %s\n" "$battery"
printf "${GREEN}[ CLOCK  ]${RESET} Day       : %s\n" "$day"
printf "${GREEN}[ CLOCK  ]${RESET} Date      : %s\n" "$date_now"
printf "${GREEN}[ CLOCK  ]${RESET} Time      : %s\n" "$time_now"

printf "\n${DIM}${GREEN}DIGITAL STREAM :: ${RESET}"
i=1
while [ "$i" -le 32 ]; do
  printf '%s' "$((RANDOM % 10))"
  i=$((i + 1))
done
printf "\n"

printf "${GREEN}SCANNER     :: ["
i=1
while [ "$i" -le 24 ]; do
  printf '#'
  sleep 0.01
  i=$((i + 1))
done
printf "] OK${RESET}\n"

printf "${CYAN}STATUS      :: ONLINE // SECURE SHELL // BANNER-PRO${RESET}\n"
printf "${DIM}Tip: run 'banner-setup.sh' again to change the banner.${RESET}\n"
