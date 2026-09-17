{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dovekind";
  home.homeDirectory = "/home/dovekind";

  


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







  # Packages that should be installed to the user profile.
  home.packages = [
    # pkgs.htop
    # pkgs.fortune
    pkgs.ncmpcpp
    pkgs.rmpc
  ];
  
  home.sessionVariables = {

  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.vesktop = {
    enable = true;
    
    vencord = {

      settings = {
        autoUpdate = false;
        arRPC = true;
	checkUpdates = false;
	disableMinSize = true;
	minimizeToTray = false;
	tray = false;
	hardwareAcceleration = true;
	discordBranch = "stable";
	useQuickCss = true;
      };
     
      extraQuickCss = 
      ''
      /* ==UserStyle==
      @name           Discord (web) - Remove top bar in the new 2025 UI refresh
      @description    The bar is pretty useless and takes a ton of vertical space.
      @namespace      https://greasyfork.org/en/users/4813
      @author         Swyter
      @version        2025.03.28
      @license        CC-BY-SA 4.0
      @preprocessor   default
      ==/UserStyle== */
   
      @-moz-document domain('discord.com')
      {
         .visual-refresh {
           /* swy: change the CSS variable so that the rest of the layout that goes below complies :) */
           --custom-app-top-bar-height: 0px !important;

           /* swy: hide the top bar contents, otherwise some icons bleed through */
           div[class^='container_'] > div[class^='base_'] > div[class^='bar_'] {
              display: none !important;
          }
     
        /* swy: restore the top padding for the sidebar server icon list (so that the Direct Messages button doesn't look weird) */
        div[class^='sidebar_'] > nav[class^='wrapper_'] > ul[class^='tree_'] > div[class^='itemsContainer_'] > div[class^='stack_'] {
            padding-top: 12px !important; /* swy: 12px is the original value */
        }
    }
}
 

      '';
    };

  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "flowers";
	email = "330538276+DovekindHarmonics@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
    
  };

  programs.firefox = {
   enable = true;

   languagePacks = [ "en-US" ];

   policies = {
   
   #Features
   DisableMasterPasswordCreation = true;
   DisableSetDesktopBackground = true;
   
   OfferToSaveLogins = false;

   AIControls = {
     Default = {
       Value = "blocked";
       Locked = true;
     };
   };
   
   # Extensions
    ExtensionSettings = let
      moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
    in {
      "*".installation_mode = "blocked";

      "uBlock0@raymondhill.net" = {
        install_url       = moz "ublock-origin";
        installation_mode = "force_installed";
        updates_disabled  = true;
      };
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
        install_url       = moz "vimium-ff";
	installation_mode = "force_installed";
	updates_disabled  = true;
      };
      "Tab-Session-Manager@sienori" = {
        install_url       = moz "tab-session-manager";
	installation_mode = "force_installed";
	updates_disabled  = true;
      };
    };

   };



  };

  #programs.emacs = {
  #  enable = true;
  #  extraPackages = epkgs: [
  #    epkgs.nix-mode
  #    epkgs.magit
  #  ];
  #};
  

  services.mpd = {
    enable = true;
    musicDirectory = /home/dovekind/roots/music;
    extraConfig = ''
    audio_output {
    type "pipewire"
    name "My Pipewire Output"
    }
    '';
  };

  #services.gpg-agent = {
  #  enable = true;
  #  defaultCacheTtl = 1800;
  #  enableSshSupport = true;
  #};
}
