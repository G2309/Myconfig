#!/bin/bash

# Rutas
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Instalar yay y verificar si esta o no
if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit 1
    makepkg -si --noconfirm
    cd "$REPO_DIR" || exit 1
fi

# Función para comprobar si se desea instalar algo
ask_install() {
    read -rp "Instalar configuración de $1? (s/n): " respuesta
    [[ "$respuesta" == "s" ]]
}

# Función para crear enlaces simbólicos
link_config() {
    origen="$1"
    destino="$2"

    if [[ -e "$destino" || -L "$destino" ]]; then
        read -rp "Ya existe $destino, ¿Deseas reemplazarlo? (s/n): " resp
        if [[ "$resp" == "s" ]]; then
            rm -rf "$destino"
        else
            echo "Omitiendo $destino"
            return
        fi
    fi

    ln -s "$origen" "$destino"
    echo "Configuración enlazada: $destino"
}

# Configuración general
link_config "$REPO_DIR/Scripts" "$HOME/Scripts"
chmod +x "$HOME"/Scripts/*

link_config "$REPO_DIR/Wallpaper" "$HOME/Pictures/Wallpaper"

read -rp "¿Estás usando Wayland? (s/n): " respuesta
if [[ "$respuesta" == "s" ]]; then
    # Hyprland
    if ask_install "Hyprland/Hyprpaper"; then
        link_config "$REPO_DIR/hypr" "$HOME/.config/hypr"
    fi

    if ask_install "Kitty [theme=kitty +kitten --theme]"; then
        link_config "$REPO_DIR/kitty" "$HOME/.config/kitty"
    fi

    if ask_install "Neovim"; then
        link_config "$REPO_DIR/nvim" "$HOME/.config/nvim"
    fi

    if ask_install "Rofi"; then
        link_config "$REPO_DIR/rofi" "$HOME/.config/rofi"
    fi

    if ask_install "Swaylock"; then
        link_config "$REPO_DIR/swaylock" "$HOME/.config/swaylock"
    fi

    if ask_install "Waybar"; then
        link_config "$REPO_DIR/waybar" "$HOME/.config/waybar"
    fi

    if ask_install "Wlogout"; then
        link_config "$REPO_DIR/wlogout" "$HOME/.config/wlogout"
    fi

    if ask_install "Alacritty"; then
        link_config "$REPO_DIR/alacritty" "$HOME/.config/alacritty"
    fi
else
    if ask_install "Picom"; then
        link_config "$REPO_DIR/picom" "$HOME/.config/picom"
    fi

    if ask_install "Rofi"; then
        link_config "$REPO_DIR/rofi" "$HOME/.config/rofi"
    fi

    if ask_install "Qtile"; then
        link_config "$REPO_DIR/qtile" "$HOME/.config/qtile"
    fi

    if ask_install "Kitty [theme=kitty +kitten --theme]"; then
        link_config "$REPO_DIR/kitty" "$HOME/.config/kitty"
    fi

    if ask_install "Alacritty"; then
        link_config "$REPO_DIR/alacritty" "$HOME/.config/alacritty"
    fi

    if ask_install "Neovim"; then
        link_config "$REPO_DIR/nvim" "$HOME/.config/nvim"
    fi
fi

if ask_install "Grub"; then
	sudo cp "$REPO_DIR/grub" /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Zsh y Powerlevel10k
if ask_install "Zsh + Powerlevel10k"; then
    sudo pacman -S --noconfirm zsh

    # Instalar Oh My Zsh sin lanzar zsh
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Powerlevel10k y plugins
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

    # Backup .zshrc existente
    if [[ -f "$HOME/.zshrc" ]]; then
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
    fi

    link_config "$REPO_DIR/.zshrc" "$HOME/.zshrc"

    chsh -s "$(which zsh)"
    echo "Zsh instalado. Iniciá una nueva sesión o ejecutá: source ~/.zshrc"
fi

