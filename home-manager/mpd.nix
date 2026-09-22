{ inputs, config, lib, pkgs, ...}:
{
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
}
