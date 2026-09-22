{ inputs, config, lib, pkgs, ... }:
{
  wayland.windowManager.sway = {
     enable = true;
     wrapperFeatures.gtk = true;

     config = rec {
       terminal = "kitty";
       modifier = "Mod4";

       startup = [
       { command = "waybar"; }
       ];

       colors = {
         focused = 
           {
  	     background  = "#ffffff";
	     border      = "#ffffff";
             childBorder = "#ffffff";
	     indicator   = "#ffffff";
	     text        = "#ffffff";
	   };
      
      };
   
       bars = [];

       gaps.bottom     = 5;
       gaps.left       = 5;
       gaps.right      = 5;
       gaps.top        = 5;


       keybindings = {
         # applications
         "Mod4+Q" = "exec fuzzel";
         "Mod4+W" = "exec QTWEBENGINE_FORCE_USE_GBM=0 qutebrowser";
	 "Mod4+E" = "exec foot";


         "Mod4+C" = "kill";

	 "Mod4+1" = "workspace number 1";
	 "Mod4+2" = "workspace number 2";
         "Mod4+3" = "workspace number 3";
         "Mod4+4" = "workspace number 4";
	 "Mod4+5" = "workspace number 5";
         "Mod4+6" = "workspace number 6";
         "Mod4+7" = "workspace number 7";
         "Mod4+8" = "workspace number 8";
         "Mod4+9" = "workspace number 9";
         "Mod4+0" = "workspace number 10";

	 "Mod4+Ctrl+1" = "move container to workspace number 1"; 
	 "Mod4+Ctrl+2" = "move container to workspace number 2";
	 "Mod4+Ctrl+3" = "move container to workspace number 3";
	 "Mod4+Ctrl+4" = "move container to workspace number 4";
	 "Mod4+Ctrl+5" = "move container to workspace number 5";
         "Mod4+Ctrl+6" = "move container to workspace number 6";
	 "Mod4+Ctrl+7" = "move container to workspace number 7";
	 "Mod4+Ctrl+8" = "move container to workspace number 8";
	 "Mod4+Ctrl+9" = "move container to workspace number 9";
	 "Mod4+Ctrl+0" =  "move container to workspace number 10";

         "Mod4+h" = "focus left";
         "Mod4+j" = "focus down";
         "Mod4+k" = "focus up";  
         "Mod4+l" = "focus right";  

       };

     };
   };
}
