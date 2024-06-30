{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireless.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "jellyfin";
  };

  users.users.gustavo = {
    isNormalUser = true;
    extraGroups = [ "wheel" "jellyfin"];
  };

  users.groups.jellyfin = {};

  environment.systemPackages = with pkgs; [
    neovim
    wget
    vim
    wpa_supplicant
    git
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 2222 8096 8920 ];

  system.stateVersion = "24.05";
}
