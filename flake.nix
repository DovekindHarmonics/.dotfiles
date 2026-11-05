{

  description = "My Own Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    quadra.url = "github:QuadraHQ/Quadra";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url =  "github:gmodena/nix-flatpak/?ref=latest";
    septabee = {
      url = "github:ap6661/septabee-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, quadra, ... }@inputs:
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
        inputs.stylix.nixosModules.stylix
        ./configuration.nix

	quadra.nixosModules.default
        {
          programs.quadrahq = {
            enable = true;
            runtime = "ciderdarling"; # Or "regular" or "rosemary"
            # withStudio = true;     # Also include Wine for Roblox Studio
          };
        }

        ];
      };
    };
  };
}
