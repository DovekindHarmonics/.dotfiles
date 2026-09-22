{ pkgs, ...}:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Ubuntu Mono:size=15";
      };
    };
  };
}
