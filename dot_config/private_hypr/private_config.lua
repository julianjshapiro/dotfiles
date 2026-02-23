{ config, pkgs, inputs, ... }:

{
	imports =
	[
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	networking.hostName = "rooflaptop"; # Define your hostname.
		networking.wireless.enable = true;# Enables wireless support via wpa_supplicant.
		networking.networkmanager.enable = true;
		networking.wireless.networks = {
		Fingerling-Potato = { psk = "Beetsoup"; };
	};
	
	time.timeZone = "America/New_York";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};
	
	services.xserver.xkb = { layout = "us"; variant = ""; };
	
	users.users.roof = {
		isNormalUser = true;
		description = "roof";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
		
	nixpkgs.config.allowUnfree=true;
	nix.settings.experimental-features = ["nix-command" "flakes"];
	
	environment.systemPackages = with pkgs; [
		vim neovim vscode pkgs.kitty 
		phinger-cursors nwg-look
		rofi-wayland-unwrapped rofimoji
		grim slurp wl-clipboard neofetch
		waybar hyprpaper
		killall file git 
		nodejs 
		discord google-chrome
	];
	
	programs.hyprland.enable = true;
	
	home-manager = {
		extraSpecialArgs = {inherit inputs;};
		users={"roof"=import ./home.nix;};
	};
	
	system.stateVersion = "24.11"; # Did you read the comment?
}
