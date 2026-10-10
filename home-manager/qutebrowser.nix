{ pkgs, config, ... }: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      content = {
        blocking.method = "both"; # uses both host blocking and python-adblock
        blocking.adblock.lists = [
          "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2024.txt"
          "https://easylist.to/easylist/easylist.txt"
          "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
          "https://easylist.to/easylist/easyprivacy.txt"
        ];
      };
    };
  };
}

