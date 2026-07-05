{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
        ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "laptop";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Los_Angeles";

    services.tlp.enable = true;

    services.printing.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    services.libinput.enable = true;
	services.hypridle.enable = true;

    users.users.owen = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            packages = with pkgs; [
            tree
            hyprshutdown
            ];
    };

    programs.hyprland.enable = true;
	programs.thunar.enable = true;
	programs.xfconf.enable = true;

	services.gvfs.enable = true;
	services.tumbler.enable = true;

    environment.systemPackages = with pkgs; [
      vim
      tmux
      wget
      foot
      waybar
      git
	  gh
      brightnessctl
      ripgrep
	  fastfetch
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05"; # Did you read the comment?

}
