{ inputs, config, lib, pkgs, ... }:
{
  boot.loader = {
     grub = {
         enable = true;
         device = "nodev";
         efiSupport = true;
        };
     efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
