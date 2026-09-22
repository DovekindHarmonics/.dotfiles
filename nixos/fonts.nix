{inputs, config, lib, pkgs, ...}:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu-classic
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Ubuntu Mono" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };

  };
}
