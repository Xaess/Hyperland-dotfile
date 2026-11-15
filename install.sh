#!/bin/bash
set -euo pipefail
SCRIPT_TITLE="Dotfiles Installer"
ask_menu() {
    local result
    # || true empêche set -e de tuer le script si Échap
    result=$(whiptail --title "$1" --menu "$2" "$3" "$4" "$5" \
        "${@:6}" 3>&1 1>&2 2>&3) || {
        echo -e "Annulé par l'utilisateur." >&2
        exit 0
    }
    echo -e "$result"
}

COMPONENT=$(ask_menu "Config manager" "Select component to install" 18 78 9 \
    "1" everything \
    "2" "scripts" \
    "3" "hypr" \
    "4" "waybar" \
    "5" "wofi" \
    "6" "swaync" \
    "7" "kitty" \
    "8" "wlogout" \
    "0" "Quit")

install_everything() {
    echo "\e[33mInstalling up every dotfile\e[0m"
    install_scripts
    install_hypr
    install_waybar
    install_wofi
    install_swaync
    install_kitty
    install_wlogout
    echo -e "\e[32m󰩐 Installation finished.\e[0m"
}

install_scripts() {
    echo -e "\e[33m Installing scripts.\e[0m"
    cp -r "scripts/." "$HOME/.local/bin/"
    echo -e "\e[32m󰩐 scripts installed !\e[0m"
}

install_hypr() {
    echo -e "\e[33m Installing hyperland configurations.\e[0m"
    cp -r "hypr/." "$HOME/.config/hypr/"
    hyprctl configerrors
    echo -e "\e[32m󰩐 hyperland configurations installed !\e[0m"
}

install_waybar() {
    echo -e "\e[33m Installing waybar configurations.\e[0m"
    rm -Rf ~/.config/waybar
    mkdir ~/.config/waybar
    cp -r ./waybar/. ~/.config/waybar
    echo -e "\e[32m󰩐 waybar configurations installed !\e[0m"
    sh ~/.config/waybar/launch.sh
    echo -e "\e[32m󰩐 Restarted waybar"
}

install_wofi() {
    echo -e "\e[33m Installing wofi configurations.\e[0m"
    rm -Rf ~/.config/wofi
    mkdir ~/.config/wofi
    cp -r ./wofi/. ~/.config/wofi
    echo -e "\e[32m󰩐 wofi configurations installed !\e[0m"
}

install_swaync() {
    echo -e "\e[33m Installing swaync configurations.\e[0m"
    rm -Rf ~/.config/swaync
    mkdir ~/.config/swaync
    cp -r ./swaync/. ~/.config/swaync
    echo -e "\e[32m󰩐 swaync configurations installed !\e[0m"
}

install_kitty() {
    echo -e "\e[33m Installing kitty configurations.\e[0m"
    rm -Rf ~/.config/kitty
    mkdir ~/.config/kitty
    cp -r ./kitty/. ~/.config/kitty
    echo -e "\e[32m󰩐 kitty configurations installed !\e[0m"
}

install_wlogout() {
    echo -e "\e[33m Installing wlogout configurations.\e[0m"
    rm -Rf ~/.config/wlogout
    mkdir ~/.config/wlogout
    cp -r ./wlogout/. ~/.config/wlogout
    echo -e "\e[32m󰩐 wlogout configurations installed !\e[0m"
}

case $COMPONENT in
1) install_everything ;;
2) install_scripts ;;
3) install_hypr ;;
4) install_waybar ;;
5) install_wofi ;;
6) install_swaync ;;
7) install_kitty ;;
8) install_wlogout ;;
0)
    echo -e "Bye !"
    exit 0
    ;;
*)
    echo "Sorry, what did you mean? $COMPONENT" >&2
    exit 1
    ;;
esac
