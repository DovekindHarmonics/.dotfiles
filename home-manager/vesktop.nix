{ inputs, config, lib, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    
    vencord = {

      settings = {
        autoUpdate = false;
        arRPC = true;
        checkUpdates = false;
        disableMinSize = true;
        minimizeToTray = false;
        tray = false;
        hardwareAcceleration = true;
        discordBranch = "stable";
        useQuickCss = true;
      };

      extraQuickCss = ''
/* ==UserStyle==
@name           Discord (web) - Remove top bar in the new 2025 UI refresh
@description    The bar is pretty useless and takes a ton of vertical space.
@namespace      https://greasyfork.org/en/users/4813
@author         Swyter
@version        2025.03.28
@license        CC-BY-SA 4.0
@preprocessor   default
==/UserStyle== */
   
@-moz-document domain('discord.com')
{
  .visual-refresh {
           /* swy: change the CSS variable so that the rest of the layout that goes below complies :) */
           --custom-app-top-bar-height: 0px !important;

           /* swy: hide the top bar contents, otherwise some icons bleed through */
           div[class^='container_'] > div[class^='base_'] > div[class^='bar_'] {
              display: none !important;
          }

        /* swy: restore the top padding for the sidebar server icon list (so that the Direct Messages button doesn't look weir>
        div[class^='sidebar_'] > nav[class^='wrapper_'] > ul[class^='tree_'] > div[class^='itemsContainer_'] > div[class^='sta>
            padding-top: 12px !important; /* swy: 12px is the original value */
        }
    }
}
 

      '';
    };

  };
}
