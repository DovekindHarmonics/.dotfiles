{ config, pkgs, ... }:
{
  imports = [
    #mpd
    ./home-manager/mpd.nix
    
    #vesktop
    ./home-manager/vesktop.nix
    
    #git 
    ./home-manager/git.nix

    #fcitx5
    ./home-manager/fcitx5.nix

    #sway
    ./home-manager/sway.nix

    #foot
    ./home-manager/foot.nix

    #zsh
    ./home-manager/zsh.nix
    
    #feh
    ./home-manager/feh.nix

    #qutebrowser
    ./home-manager/qutebrowser.nix

    #waybar
    ./home-manager/waybar.nix
  ];

  


  xdg.desktopEntries = { # edit launch arguments here
    vesktop = {
      name = "Vesktop";
      exec = "${pkgs.vesktop}/bin/vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
      icon = "vesktop";
      terminal = false;
      categories = [ "Network" "Chat" "InstantMessaging" ];
      mimeType = [ "x-scheme-handler/discord" ];
    };
  };



  nixpkgs.config.allowUnfree = true; 


  # Packages that should be installed to the user profile.
  home.packages = [
    # pkgs.htop
    # pkgs.fortune
    pkgs.ncmpcpp
    pkgs.rmpc

    #pkgs.qutebrowser
    #pkgs.steam

  ];
  
  home.sessionVariables = {

  };

  programs.home-manager.enable = true;  
  home.username = "dovekind";
  home.homeDirectory = "/home/dovekind";
  home.stateVersion = "26.05";
}
