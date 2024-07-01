{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireless.enable = true;

  # Default dataDir = /var/lib/jellyfin/data
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "jellyfin";
  };

  # Before rebuild:
  # 
  # 1. Create your smb directories and copy the path
  # 
  #  After rebuild:
  # 
  # 1. Check if samba-smbd.service is running, if !running: reboot now
  # 2. sudo smbpasswd -a "yourUsername"
  # 3. Restart smdb service

  services.samba = {
    enable = true;
    package = pkgs.samba;
    openFirewall = true;
    securityType = "user";
    shares = {
	private = {
	 path = "/mnt/Private";
	 writeable = true;
	 browseable = false;
	 createMask = "0700";
	 directoryMask = "0700";
	 forceUser = "gustavo";
	 forceGroup = "users";
	};
	public = {
	 path = "/mnt/Public";
	 writeable = true;
	 browseable = true;
	 guestOk = true;
	 createMask = "0777";
	 directoryMask = "0777";
	};
	shared = {
	 path = "/mnt/Shared";
	 writeable = true;
	 browseable = true;
	 guestOk = true;
	 createMask = "0755";
	 directoryMask = "0755";
	 forceUser = "gustavo";
	 forceGroup = "users";
	};
    };
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
    # Media server
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    # SMB 
    samba
  ];

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 2222 8096 8920 137 138 139 445 ];

  system.stateVersion = "24.05";
}
