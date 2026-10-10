{inputs, config, lib, pkgs, ...}:
let
  colors = import .colors/main.nix;

  cssVariables = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: value: "  --${name}: ${value};") colors
  );
in
{

   xdg.configFile."css/colors.css".text = ''
    :root {
    ${cssVariables}
    }
   '';
  programs.waybar = {
    enable = true;
    
    style = ''
    @import "${config.xdg.configHome}/css/colors.css";

    window#waybar {
      background: var(three);
    }
    '';
  };
}
