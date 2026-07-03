{ config, pkgs, ... }:

{
  home.username = "owen";
  home.homeDirectory = "/home/owen";
  home.stateVersion = "26.05";

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  home.packages = [
    pkgs.lua-language-server
    pkgs.libclang
    pkgs.pyright
    pkgs.nixd
    jdt-language-server
  ];

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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";

    extraConfig = ''
            set -a terminal-features "tmux-256color"

            set -g renumber-windows on
            set -g mode-keys vi
            set -g status-position top
            set -g status-justify absolute-centre
            set -g status-style "bg=default"

            set -g window-status-current-style "fg=colour255,bg=default,bold"
            set -g window-status-separator ""
            set -g window-status-format "#[fg=colour240]#[default] #I:#W#{?window_flags,#{window_flags},} #[fg=colour240]#[default]"
            set -g window-status-current-format "#[fg=colour252]#[default] #I:#W#{?window_flags,#{window_flags},} #[fg=colour252]#[default]"

            set -g status-interval 5
            set -g status-left "#S"
            set -g status-right ""

            bind r source-file "~/.config/tmux/tmux.conf"
            bind b set -g status
            bind x kill-pane

            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R

            bind -n M-h select-pane -L
            bind -n M-j select-pane -D
            bind -n M-k select-pane -U
            bind -n M-l select-pane -R

            bind -n M-1 select-window -t 1
            bind -n M-2 select-window -t 2
            bind -n M-3 select-window -t 3
            bind -n M-4 select-window -t 4
            bind -n M-5 select-window -t 5
            bind -n M-6 select-window -t 6
            bind -n M-7 select-window -t 7
            bind -n M-8 select-window -t 8
            bind -n M-9 select-window -t 9
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
home.file.".config/nvim".source = ./config/nvim;


}
