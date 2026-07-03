{ config, pkgs, ... }:

{
    home.username = "owen";
    home.homeDirectory = "/home/owen";
    home.stateVersion = "26.05";

    home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 4;
            tabstop = 4;
            number = true;
            relativenumber = true;
        };
        extraConfig = ''
            filetype plugin indent on
            syntax on
            set showmatch
            set smartindent
            set softtabstop=4
        '';
    };

    programs.foot = {
        enable = true;
        settings = {
            main.font = "monospace:size=14";
        };
    };

    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 24;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [ "pulseaudio" "network" "battery" "clock" ];

          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{name}";
          };

          "hyprland/window" = {
            format = "{}";
            max-length = 80;
          };

          clock = {
            format = "{:%a %b %d %H:%M}";
          };

          battery = {
            format = "BAT {capacity}%";
          };

          network = {
            format-wifi = "WIFI {essid}";
            format-ethernet = "ETH";
            format-disconnected = "NO NET";
          };

          pulseaudio = {
            format = "VOL {volume}%";
            format-muted = "MUTE";
          };
        };
      };

      style = ''
        * {
        font-family: monospace;
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
        }

        window#waybar {
        background: #111111;
        color: #eeeeee;
        }

    #workspaces button {
        padding: 0 8px;
        color: #bbbbbb;
        background: transparent;
        }

    #workspaces button.active {
        color: #ffffff;
        background: #333333;
        }

    #workspaces button.urgent {
        color: #ffffff;
        background: #cc241d;
        }

    #window,
    #clock,
    #battery,
    #network,
    #pulseaudio {
        padding: 0 8px;
        }
      '';
    };

    home.file.".config/hypr".source = ./config/hypr;


}
