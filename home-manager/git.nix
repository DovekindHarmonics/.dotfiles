{inputs, config, lib, pkgs, ...}:
{
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
}
