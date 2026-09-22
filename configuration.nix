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
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      dovekind = import ./home.nix;
    };
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
  };

  users.users.dovekind = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

   nixpkgs.config.allowUnfree = true;

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
     waybar
     steam-run
     obsidian
     syncthing

     _7zip-zstd
   ];
  

  system.stateVersion = "26.05"; 

}


