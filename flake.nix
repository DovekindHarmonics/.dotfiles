{

  description = "My Own Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

  };

  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;


      config = {
        allowUnfree = false;
      };
    };

  in
  {

    nixosConfigurations = {
      harmonics = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };

        modules = [
        nix-flatpak.nixosModules.nix-flatpak

        ./configuration.nix  
        ];
      };
    };
  };
}
