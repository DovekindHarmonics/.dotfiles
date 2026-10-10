{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      #boot
      ./nixos/boot/boot.nix

      #hardware
      ./hardware-configuration.nix

      #audio
      ./nixos/audio/general.nix

      #networking
      ./nixos/networking/general.nix

      #fonts
      ./nixos/fonts.nix
      
      inputs.home-manager.nixosModules.home-manager

      inputs.septabee.nixosModules.default
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      dovekind = import ./home.nix;
    };
  };  
  

  stylix = {
    targets.regreet.enable = false;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-dark.yaml";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  hardware.graphics.enable = true; # required for swaywm
  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  environment.variables = {
    DEVICE = "wayland";
    XDG_DATA_DIRS = "$HOME/.local/share:/usr/local/share:/usr/share:var/lib";
    EDITOR = "nvim";
  };

  users.users.dovekind = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

   nixpkgs.config.allowUnfree = true;
   

   #

   environment.systemPackages = with pkgs; [
     neovim 
     wget
     git
     yazi
     fuzzel
     fastfetch
     ncmpcpp
     unzip
     prismlauncher
     thunar
     obsidian
     syncthing
     flatpak
     _7zip-zstd
     firefox
   ];

   xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
   };
  
   services.flatpak = {
     enable = true;
     packages = [
       "com.valvesoftware.Steam"
       "org.vinegarhq.Sober"

     ];
     overrides = {
       "org.vinegarhq.Sober".Context = {
         filesystems = [
           "xdg-run/app/com.discordapp.Discord:create"
	   "xdg-run/discord-ipc-0"
	 ];
       };
     };
   };

  # Septabee's options and their defaults
programs.septabee = {
    enable = true; 
    wayland-deps = true; # Install wayland only dependencies 
    version = "latest"; # like [ "latest" "B_T1" "B_T2" ... ]
    offline = true; # Doesn't require downloading LLVM stuff

  #  package = pkgs.septabee; # Septabee of version + wayland-deps
};

  system.stateVersion = "26.05"; 

}


