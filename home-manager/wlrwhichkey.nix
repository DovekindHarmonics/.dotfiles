{inputs, config, lib, pkgs, ...}:
{
  programs.wlr-which-key = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 12";
      background = "#282828d0";
      color = "#fbf1c7";
      border = "#8ec07c";
      separator = " ➜ ";
      border_width = 2;
      corner_r = 10;
      padding = 15;
      rows_per_column = 5;
      column_padding = 25;
      anchor = "center";
      margin_right = 0;
      margin_bottom = 0;
      margin_left = 0;
      margin_top = 0;
      inhibit_compositor_keyboard_shortcuts = true;
      menu = [
        {
	  key = "q";
          desc = "Power";
	  submenu = [
	    { key = "q"; desc = "Sleep"; cmd = "systemctl suspend"; }
	    { key = "w"; desc = "Reboot"; cmd = "reboot"; }
	    { key = "e"; desc = "Off"; cmd = "poweroff"; }
	  ];
	}
         #"Mod4+F" = "exec hyprpicker -a";

	 #"Mod4+Ctrl+F" = "exec wayshot --clipboard -g";

	{
	  key = "a";
          desc = "Apps";
	  submenu = [
	    { key = "a"; desc = "Terminal"; cmd = "foot"; }
	    { key = "s"; desc = "Fuzzel"; cmd = "fuzzel"; }
	    { key = "d"; desc = "Rmpc"; cmd = "foot -e rmpc"; }
	    { key = "f"; desc = "Yazi"; cmd = "foot -e yazi"; }

	  ];
	}
        {
	  key = "s";
          desc = "Apps";
	  submenu = [
	    { key = "a"; desc = "Septabee"; cmd = "septabee"; }
            { key = "s"; desc = "Umoupen"; cmd = "appimage-run /home/dovekind/AppImages/Umoupen-x86_64.AppImage"; }
	    { key = "d"; desc = "Sober"; cmd = "flatpak run org.vinegarhq.Sober"; }
	    { key = "f"; desc = "Steam"; cmd = "flatpak run com.valvesoftware.Steam"; }
	    { key = "q"; desc = "Vesktop"; cmd = "vesktop"; }

	  ];
	}
	{
	  key = "d";
	  desc = "Browser";
	  submenu = [
            { key = "a"; desc = "New Window"; cmd = "QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser"; }
            { key = "p"; desc = "Other"; cmd = "QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser -r p"; }

            { key = "s"; desc = "Research"; 
	      submenu = [
                { key = "a"; desc = "Religion"; cmd = "QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser -r rr";}
	      ];
	    }
	    { key = "d"; desc = "Skills"; 
	      submenu = [ 
                { key = "a"; desc = "Drawing"; cmd = "QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser -r sd";}
	      ];
	    }
            { key = "f"; desc = "Languages"; 
	      submenu = [
                { key = "a"; desc = "Mandarin"; cmd = "QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser -r lm";}
	      ];
	    }
 


	  ];
	}
        {
	  key = "f";
          desc = "Tools";
	  submenu = [
	    { key = "a"; desc = "Screenshot"; cmd = "wayshot --clipboard -g"; }
	    { key = "s"; desc = "Colorpicker"; cmd = "hyprpicker -a"; }
	  ];
	}
        {
	  key = "w";
          desc = "Heaven Ln";
	  submenu = [
	    { key = "q"; desc = "100"; cmd = "swaymsg workspace number 1"; }
            { key = "r"; desc = "101"; cmd = "swaymsg workspace number 2"; }
	    { key = "a"; desc = "102"; cmd = "swaymsg workspace number 3"; }
	    { key = "s"; desc = "103"; cmd = "swaymsg workspace number 4"; }
	    { key = "d"; desc = "104"; cmd = "swaymsg workspace number 5"; }
	    { key = "f"; desc = "105"; cmd = "swaymsg workspace number 6"; }
	    { key = "z"; desc = "106"; cmd = "swaymsg workspace number 7"; }
	    { key = "x"; desc = "107"; cmd = "swaymsg workspace number 8"; }
	    { key = "c"; desc = "108"; cmd = "swaymsg workspace number 9"; }
	    { key = "v"; desc = "109"; cmd = "swaymsg workspace number 10"; }
            
             
	    { key = "e"; desc = "Move"; submenu = [
	      { key = "q"; desc = "100"; cmd = "swaymsg move container to workspace number 1"; }
              { key = "r"; desc = "101"; cmd = "swaymsg move container to workspace number 2"; }
	      { key = "a"; desc = "102"; cmd = "swaymsg move container to workspace number 3"; }
	      { key = "s"; desc = "103"; cmd = "swaymsg move container to workspace number 4"; }
	      { key = "d"; desc = "104"; cmd = "swaymsg move container to workspace number 5"; }
	      { key = "f"; desc = "105"; cmd = "swaymsg move container to workspace number 6"; }
	      { key = "z"; desc = "106"; cmd = "swaymsg move container to workspace number 7"; }
	      { key = "x"; desc = "107"; cmd = "swaymsg move container to workspace number 8"; }
	      { key = "c"; desc = "108"; cmd = "swaymsg move container to workspace number 9"; }
	      { key = "v"; desc = "109"; cmd = "swaymsg move container to workspace number 10"; }
	    ];
	    }

	    { key = "w"; desc = "Further"; submenu = [
              { key = "q"; desc = "110"; cmd = "swaymsg workspace number 11"; }
              { key = "r"; desc = "111"; cmd = "swaymsg workspace number 12"; }
	      { key = "a"; desc = "112"; cmd = "swaymsg workspace number 13"; }
	      { key = "s"; desc = "113"; cmd = "swaymsg workspace number 14"; }
	      { key = "d"; desc = "114"; cmd = "swaymsg workspace number 15"; }
	      { key = "f"; desc = "115"; cmd = "swaymsg workspace number 16"; }
	      { key = "z"; desc = "116"; cmd = "swaymsg workspace number 17"; }
	      { key = "x"; desc = "117"; cmd = "swaymsg workspace number 18"; }
	      { key = "c"; desc = "118"; cmd = "swaymsg workspace number 19"; }
	      { key = "v"; desc = "119"; cmd = "swaymsg workspace number 20"; }
	    ];
	    }
	  ];
        }
        {
          key = "r";
	  desc = "Adjustments";
	  submenu = [
            { key = "q"; desc = "Bulldoze"; cmd = "swaymsg kill"; } 
	  ];
        }


      ];
    };
  };
}
