#!/data/data/com.termux/files/usr/bin/bash
# Banner-Pro compatibility launcher.
# The primary setup entry point is banner-setup.sh.

cd "$HOME/Banner-Pro" 2>/dev/null || {
    printf '\033[1;31m[!] Banner-Pro directory not found.\033[0m\n'
    exit 1
}

exec bash "$HOME/Banner-Pro/banner-setup.sh"
