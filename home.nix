{ config, pkgs, ... }:

{
    home.username = "owen";
    home.homeDirectory = "/home/owen";
    home.stateVersion = "26.05";

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

    home.file.".config/hypr".source = ./config/hypr;


}
