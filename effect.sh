#!/data/data/com.termux/files/usr/bin/bash
# Setup-only loading effect. Do not add this file to shell startup.

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"

printf "\n${CYAN}[ Banner-Pro ] Initializing"
i=1
while [ "$i" -le 18 ]; do
  printf "."
  sleep 0.04
  i=$((i + 1))
done
printf "\n"

i=0
while [ "$i" -le 20 ]; do
  filled=$((i / 2))
  empty=$((10 - filled))
  bar=""
  j=0
  while [ "$j" -lt "$filled" ]; do bar="${bar}█"; j=$((j + 1)); done
  j=0
  while [ "$j" -lt "$empty" ]; do bar="${bar}░"; j=$((j + 1)); done
  printf "\r${CYAN}[ Loading ] [${bar}] %02d%%${RESET}" "$((i * 5))"
  sleep 0.03
  i=$((i + 1))
done

printf "\n${GREEN}[+] System ready.${RESET}\n"
