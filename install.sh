#!/bin/bash

# Rutas
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Yay

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Funciones

#Funcion para comprobar si se desea instalar la configuracion de un paquete o no.
ask_install() {
	read -p "Instalar configuracion de $1? (s/n):" respuesta
	[["$respuesta" == "s"]]
}

# Funcion para copiar por medio de symlinks la configuracion a la carpeta correspondiente

link_config() {
	origen="$1"
	destino="$2"
	# Verificar si hay un archivo existente y preguntar si sobreescribe o no
	if [ -e "$destino"] || [-L "destino"]; then
		read -p "Ya existe $destino, Deseas reemplazarlo (s/n): " resp
		if [["resp"=="s"]]; then
			rm -rf "$destino"
		else
			echo "Omitiendo $destino"
			return
		fi
	fi
	# Symlink con la configuracion
	ln -s "$origen" "$destino"
	echo "Configuracion enlazada: $destino"
}

# Wallpapers + Scripts
link_config "$REPO_DIR/Scripts" "$HOME/"
chmod +x "$HOME/Scripts/*"

link_config "$REPO_DIR/Wallpaper" "$HOME/Pictures/Wallpaper"

read -p "Es Wayland (s/n)" respuesta
if [["respuesta"=="s"]]; then		
	# Hyprland + Hyprpaper 
	if ask_install "Configuracion para Hyprland/Hyprpaper"; then
		link_config "$REPO_DIR/hypr" "$HOME/.config/hypr"
	fi
		
	# kitty
	if ask_install "Configuracion para Kitty [theme=kitty +kitten --theme]"; then
		link_config "$REPO_DIR/kitty" "$HOME/.config/kitty"
	fi
	
	# nvim 
	if ask_install "Configuracion para Neovim"; then
		link_config "$REPO_DIR/nvim" "$HOME/.config/nvim"
	fi	
		
	# rofi 
	if ask_install "Configuracion para Rofi"; then
		link_config "$REPO_DIR/rofi" "$HOME/.config/rofi"
	fi
		
	# swaylock 
	if ask_install "Configuracion para Swaylock"; then
		link_config "$REPO_DIR/swaylock" "$HOME/.config/swaylock"
	fi
		
	# waybar 
	if ask_install "Configuracion para Waybar"; then
		link_config "$REPO_DIR/waybar" "$HOME/.config/waybar"
	fi
		
	# Wlogout 
	if ask_install "Configuracion para Wlogout"; then
		link_config "$REPO_DIR/wlogout" "$HOME/.config/wlogout"
	fi
		
	# alacritty
	if ask_install "Configuracion para Alacritty"; then
		link_config "$REPO_DIR/alacritty" "$HOME/.config/alacritty"
	fi
		
	else
	
	# picom 
	if ask_install "Configuracion para Picom"; then
		link_config "$REPO_DIR/picom" "$HOME/.config/picom"
	fi
		
	# rofi 
	if ask_install "Configuracion para Rofi"; then
		link_config "$REPO_DIR/rofi" "$HOME/.config/rofi"
	fi
			
	# qtile 
	if ask_install "Configuracion para Qtile"; then
		link_config "$REPO_DIR/qtile" "$HOME/.config/qtile"
	fi
	
	# kitty
	if ask_install "Configuracion para Kitty [theme=kitty +kitten --theme]"; then
		link_config "$REPO_DIR/kitty" "$HOME/.config/kitty"
	fi
		
	# alacritty
	if ask_install "Configuracion para Alacritty"; then
		link_config "$REPO_DIR/alacritty" "$HOME/.config/alacritty"
	fi
		
	# nvim 
	if ask_install "Configuracion para Neovim"; then
		link_config "$REPO_DIR/nvim" "$HOME/.config/nvim"
	fi
		
fi
