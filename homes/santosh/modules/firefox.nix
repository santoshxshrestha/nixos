{
  programs.firefox = {
    enable = true;

    policies = {
      AppAutoUpdate = false;
      DisablePocket = true;
      DisableTelemetry = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      OffferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;
      DisplayBookmarksToolbar = "never";

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      FirefoxHome = {
        "Search" = true;
        "TopSites" = true;
        "SponsoredTopSites" = false;
        "Highlights" = false;
        "Pocket" = false;
        "SponsoredPocket" = false;
      };
      ShowHomeButton = false;

      FirefoxSuggest = {
        "WebSuggestions" = true;
        "SponsoredSuggestions" = false;
        "ImproveSuggest" = true;
      };

      ExtensionSettings = {
        # Ublock Origin
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          "default_area" = "menupanel";
        };
        # Vimium C
        "vimium-c@gdh1995.cn" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          "default_area" = "menupanel";
        };
        # Dark Reader
        "addon@darkreader.org" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          "default_area" = "menupanel";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          "default_area" = "menupanel";
        };
        "sponsorBlocker@ajay.app" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          "default_area" = "menupanel";
        };
        "idcac-pub@guus.ninja" = {
          "installation_mode" = "force_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          "default_area" = "menupanel";
        };
      };

    };
    profiles.default = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        /* Hide the title bar */
        .titlebar-close {
            display: none !important;
        }


            :root {
              /* Show/hide reload button
               * show: flex
               * hide: none
               */
              --show-reload: none;

              /* Navigation toolbar width
               * max width is applied when url bar is expanded
               */
              --navbar-width: max(35vw, 500px);
              --navbar-max-width: max(60vw, 800px);

              /* Dynamic tab width */
              --active-tab-width: clamp(100px, 24vw, 240px);    
              --inactive-tab-width: clamp(100px, 18vw, 180px);

              /* Preferred find bar width
               * set to 0px for minimum width
               */
              --findbar-width: calc(var(--findbar-min-width-expanded) + (100vw - 2 * var(--findbar-right) - var(--findbar-min-width-expanded)) * 0.12);

              /* Find bar distance from window corners */
              --findbar-top: 12px;
              --findbar-right: max(2vw, 30px); /* scrollbar is 18px */

              /* Find bar transition duration
               * changes the duration of the find bar open/close transition animation
               */
              --findbar-transition-duration: 100ms;

              /* Find bar transition distance
               * changes how far the find bar travels down/up during the open/close transition animation
               */
              --findbar-transition-distance: 20px;

              /* Show/hide find bar options
               * show: 1
               * hide: 0
               */
              --show-highlight-all:    1;
              --show-match-case:       1;
              --show-match-diacritics: 1;
              --show-whole-words:      1;

              /* Find bar options position */
              --highlight-all-position:    0;
              --match-case-position:       1;
              --match-diacritics-position: 2;
              --whole-words-position:      3;
            }




            @media (min-width: 1200px) {
              #navigator-toolbox {
                display: flex !important;
                flex-wrap: wrap !important;
                flex-direction: row !important;
              }

              #toolbar-menubar {
                order: 0;
                width: 100% !important;
              }

              #nav-bar {
                order: 1;
                width: var(--navbar-width) !important;
              }
              #nav-bar:has(#urlbar[open]) {
                width: var(--navbar-max-width) !important;
              }

              #TabsToolbar {
                order: 2;
                width: auto !important;
              }
              #navigator-toolbox:has(#urlbar[open]) #TabsToolbar {
                margin-left: calc(var(--navbar-width) - var(--navbar-max-width)) !important;
              }

              #PersonalToolbar {
                order: 3;
                width: 100% !important;
              }
            }

            :root {
              /* hide panel borders */
              --arrowpanel-border-color: transparent !important;

              /* hide focus borders */
              --toolbar-field-focus-border-color: transparent !important;
            }

            /* hide navigator toolbox border */
            #navigator-toolbox {
              border: none !important;
            }

            /* hide context menu border */
            .menupopup-arrowscrollbox {
              border: none !important;
            }

            /* hide notifications toolbar */
            #notifications-toolbar {
              display: none !important;
            }

            /* hide spacers */
            .titlebar-spacer {
              display: none !important;
            }



            /* ,--.  ,--.  ,---.,--.   ,--.      ,-----.    ,---.  ,------.  
             * |  ,'.|  | /  O  \\  `.'  /,-----.|  |) /_  /  O  \ |  .--. ' 
             * |  |' '  ||  .-.  |\     / '-----'|  .-.  \|  .-.  ||  '--'.' 
             * |  | `   ||  | |  | \   /         |  '--' /|  | |  ||  |\  \  
             * `--'  `--'`--' `--'  `-'          `------' `--' `--'`--' '--' 
             */

            /* hide nav bar background */
            #nav-bar {
              background: none !important;
            }

            /* hamburger menu */
            #PanelUI-button {
              order: -2 !important;
            }
            #PanelUI-menu-button {
              padding-inline-start: var(--toolbar-start-end-padding) !important;
              padding-inline-end: var(--toolbarbutton-outer-padding) !important;
            }

            /* dynamic extensions button */
            #unified-extensions-button {
              order: -1 !important;
              width: 0px !important;
              padding: 0px !important;
              box-sizing: content-box !important;
              justify-content: flex-start !important;
              overflow: hidden !important;
              transition: width 100ms ease-out, padding 100ms ease-out !important;
            }

            /* show extensions button when hamburger menu is hovered */
            #nav-bar:has(#PanelUI-menu-button:not([open]):hover) #unified-extensions-button {
              width: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
              padding: 0px var(--toolbarbutton-outer-padding) !important;
              transition-delay: 450ms !important;
            }
            /* show on interaction */
            #unified-extensions-button:is(:hover, [open], :has(.toolbarbutton-icon[showing])) {
              width: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
              padding: 0px var(--toolbarbutton-outer-padding) !important;
            }

            /* dynamic forward/back button */
            #forward-button, #back-button {
              width: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
              box-sizing: content-box !important;
              overflow: hidden !important;
              justify-content: flex-start !important;
              transition: width 100ms ease-out, padding 100ms ease-out !important;
            }
            #forward-button[disabled], #back-button[disabled] {
              width: 0px !important;
              padding: 0px !important;
            }

            /* show/hide reload button */
            #stop-reload-button {
              display: var(--show-reload) !important;
            }

            /* remove margins from extension buttons*/
            .toolbaritem-combined-buttons {
              margin-inline: 0px !important;
            }

            /* override default first item padding */
            #nav-bar-customization-target > :is(toolbarbutton):not([disabled], #unified-extensions-button):first-child {
              padding-inline-start: var(--toolbarbutton-outer-padding) !important;
            }
            #nav-bar-customization-target > :is(toolbaritem):not([disabled], #unified-extensions-button):first-child {
              padding-inline-start: 0px !important;
            }

            /* pad last visible item before tabs (large window) */
            @media (min-width: 1200px) {
              /* need to be explicit about hbox else FireFox crashes on dialog box popup for some reason */
              hbox#nav-bar-customization-target > :nth-last-child(1 of :is(toolbarbutton, toolbaritem):not([disabled], #unified-extensions-button)):is(#stop-reload-button, .unified-extensions-item) {
                padding-inline-end: calc(var(--urlbar-margin-inline) - var(--toolbarbutton-outer-padding)) !important;
              }
              hbox#nav-bar-customization-target > :nth-last-child(1 of :is(toolbarbutton, toolbaritem):not([disabled], #unified-extensions-button)):not(#urlbar-container, #stop-reload-button, .unified-extensions-item) {
                padding-inline-end: var(--urlbar-margin-inline) !important;
              }
            }

            /* pad last visible item (small window) */
            @media (max-width: 1200px) {
              /* need to be explicit about hbox else FireFox crashes on dialog box popup for some reason */
              hbox#nav-bar-customization-target > :nth-last-child(1 of :is(toolbarbutton, toolbaritem):not([disabled], #unified-extensions-button)):is(#urlbar-container) {
                margin-inline-end: var(--toolbar-start-end-padding) !important;
              }
              hbox#nav-bar-customization-target > :nth-last-child(1 of :is(toolbarbutton, toolbaritem):not([disabled], #unified-extensions-button)):is(#stop-reload-button, .unified-extensions-item) {
                padding-inline-end: calc(var(--toolbar-start-end-padding) - var(--toolbarbutton-outer-padding)) !important;
              }
              hbox#nav-bar-customization-target > :nth-last-child(1 of :is(toolbarbutton, toolbaritem):not([disabled], #unified-extensions-button)):not(#urlbar-container, #stop-reload-button, .unified-extensions-item) {
                padding-inline-end: var(--toolbar-start-end-padding) !important;
              }
            }



            /* ,--. ,--.,------. ,--.       ,-----.    ,---.  ,------.  
             * |  | |  ||  .--. '|  |,-----.|  |) /_  /  O  \ |  .--. ' 
             * |  | |  ||  '--'.'|  |'-----'|  .-.  \|  .-.  ||  '--'.' 
             * '  '-'  '|  |\  \ |  '--.    |  '--' /|  | |  ||  |\  \  
             *  `-----' `--' '--'`-----'    `------' `--' `--'`--' '--' 
             */

            /* has a fixed sized for some reason; make it auto */
            #urlbar-container {
              width: auto !important
            }

            /* show background on hover/focus */
            #urlbar:not(:hover, [focused]) #urlbar-background {
              background: none !important;
            }

            /* pad url bar text */
            #urlbar:not([focused]) .urlbar-input-box {
              padding-left: var(--urlbar-icon-padding) !important;
            }

            /* hide identity box and "shield" buttons */
            #urlbar:not([focused]):not(:has(:is(#tracking-protection-icon-container, #identity-box > *):is(:hover, [open]))) :is(#tracking-protection-icon-container, #identity-box) {
              display: none !important
            }

            /* hide all page action buttons except zoom */
            #urlbar:not(:hover, [focused]) #page-action-buttons > :not([open], #urlbar-zoom-button) {
              display: none !important
            }



            /* ,--------. ,---.  ,-----.   ,---.   
             * '--.  .--'/  O  \ |  |) /_ '   .-'  
             *    |  |  |  .-.  ||  .-.  \`.  `-.  
             *    |  |  |  | |  ||  '--' /.-'    | 
             *    `--'  `--' `--'`------' `-----'  
             */

            /* always positions tabs first */
            #tabbrowser-tabs {
              order: -1 !important;
            }

            /* hide default border, padding, and margin left of tabs */
            #tabbrowser-tabs {
              border-inline-start: none !important;
              padding-inline-start: 0px !important;
              margin-inline-start: 0px !important;
            }

            /* add padding left of first tab (small window) */
            @media (max-width: 1200px) {
              #pinned-tabs-container, #tabbrowser-tabs:not([overflow], :has(#pinned-tabs-container > .tabbrowser-tab)) #tabbrowser-arrowscrollbox {
                & > .tabbrowser-tab:first-child, & > tab-group:first-child > .tab-group-label-container {
                  padding-inline-start: calc(2 * var(--tab-overflow-clip-margin)) !important;
                }
              }
            }

            /* add margin right of tabs so that there is always a draggable area */
            #tabbrowser-tabs:not(:has(+ #new-tab-button)),
            #TabsToolbar-customization-target:has(#tabbrowser-tabs + #new-tab-button) :is(#new-tab-button, #tabs-newtab-button) {
              margin-right: 40px !important;
            }

            /* remove gap after pinned tabs */
            #pinned-tabs-container {
              margin-inline-end: 0px !important;
            }

            /* normalize tab group padding */
            .tab-group-label-container {
              margin-inline-start: 0px !important;
              padding-inline: var(--tab-overflow-clip-margin) !important;
              box-sizing: content-box !important;
            }
            .tab-group-overflow-count-container {
              margin-inline-end: 0px !important;
              padding-inline-end: var(--tab-overflow-clip-margin) !important;
            }

            /* hide tab group label outline */
            .tab-group-label {
              outline: none !important;
            }

            /* hide tab shadow & outline */
            .tabbrowser-tab .tab-background {
              box-shadow: none !important;
              outline: none !important;
            }

            /* hide tab close button */
            .tabbrowser-tab:not([pinned]) .tab-close-button {
              display: none !important;
            }
            .tabbrowser-tab:not([pinned]):hover .tab-close-button {
              display: inline-block !important;
            }

            /* dynamic tab width */
            .tabbrowser-tab[selected]:not([pinned]) {
              max-width: var(--active-tab-width) !important;
            }
            :not([collapsed]) > .tabbrowser-tab[fadein]:not([selected], [pinned]) {
              max-width: var(--inactive-tab-width) !important;
            }



            /* rounded toolbar corners */
            #PersonalToolbar {
              border-top-left-radius: var(--tab-border-radius) !important;
              border-top-right-radius: var(--tab-border-radius) !important;
            }

            /* toolbar button margins */ 
            #PersonalToolbar toolbarbutton {
              margin-top: 4px !important;
              margin-bottom: 4px !important;
            }

            /* make bookmark button padding uniform */ 
            #PlacesToolbarItems toolbarbutton {
              padding: var(--bookmark-block-padding) !important;
            }

            /* match chevron button size to bookmark button size */
            #PlacesChevron .toolbarbutton-icon {
              width: calc(2 * var(--bookmark-block-padding) + 16px) !important;
              height: calc(2 * var(--bookmark-block-padding) + 16px) !important;
              padding: var(--bookmark-block-padding) !important;
            }



            /* ,------.,--.,--.  ,--.,------.         ,-----.    ,---.  ,------.  
             * |  .---'|  ||  ,'.|  ||  .-.  \ ,-----.|  |) /_  /  O  \ |  .--. ' 
             * |  `--, |  ||  |' '  ||  |  \  :'-----'|  .-.  \|  .-.  ||  '--'.' 
             * |  |`   |  ||  | `   ||  '--'  /       |  '--' /|  | |  ||  |\  \  
             * `--'    `--'`--'  `--'`-------'        `------' `--' `--'`--' '--' 
             *  __________________________________________________________________________________
             * |  ————————————————————————————————————————————————————————————   ———— ————   ———  |
             * | | Find in page                                               | | /\ | \/ | | X | |
             * |  ————————————————————————————————————————————————————————————   ———— ————   ———  |
             *  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
             *  8                        {textboxWidth}                        8  30   30  8  24 8                                  = 116px + {textboxWidth}
             *  ______________________________________________________________________________________________________________
             * |  ————————————————————————————————————————————————————————————   ———— ————   ————   ————   ————   ————   ———  |
             * | | Find in page                                               | | /\ | \/ | | HL | | Aa | | a̲b̲ | | àë | | X | |
             * |  ————————————————————————————————————————————————————————————   ———— ————   ————   ————   ————   ————   ———  |
             *  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
             *  8                        {textboxWidth}                        8  30   30  8       {optionsWidth}         24 8      = 116px + {optionsWidth} + {textboxWidth}
             */

            :root {
              --show-margin: round(up, calc((var(--show-highlight-all) + var(--show-match-case) + var(--show-match-diacritics) + var(--show-whole-words)) / 4));
              --options-width: calc(34px*var(--show-highlight-all) + 34px*var(--show-match-case) + 34px*var(--show-match-diacritics) + 34px*var(--show-whole-words) + 4px*var(--show-margin));

              --findbar-min-width: calc(450px - 2 * var(--findbar-right)); /* minimum browser width = 450px */
              --findbar-min-width-expanded: calc(var(--findbar-min-width) + var(--options-width));
              --findbar-max-width: calc(100vw - 2 * var(--findbar-right));
              --findbar-width-use: clamp(var(--findbar-min-width-expanded), var(--findbar-width), var(--findbar-max-width));

              --textbox-min-width: calc(var(--findbar-min-width) - 116px);
              --textbox-width: calc(var(--findbar-width-use) - 116px - var(--options-width));
            }

            /* floating find bar */
            findbar {
              position: absolute !important;
              top: var(--findbar-top) !important;
              left: var(--findbar-right) !important;
              right: var(--findbar-right) !important;
              width: var(--findbar-width-use) !important;
              max-width: var(--findbar-max-width) !important;
              margin-left: auto !important;
              border: none !important;
              border-radius: var(--tab-border-radius) !important;
              box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.2) !important;
            }

            /* find bar transiton */
            findbar {
              height: 40px !important;
              overflow-y: hidden !important;
              transition-property: top, height, padding-block, visibility !important;
              transition-duration: var(--findbar-transition-duration), var(--findbar-transition-duration), var(--findbar-transition-duration), 0s !important;
              transition-timing-function: ease-in-out, ease-in-out, ease-in-out, linear !important;
              transition-delay: 0s, 0s, 0s, 0s !important;
            }
            findbar[hidden="true"] {
              top: calc(var(--findbar-top) - var(--findbar-transition-distance)) !important;
              height: 0px !important;
              padding-block: 0px !important;
              transition-delay: 0s, 0s, 0s, var(--findbar-transition-duration) !important;
            }
            findbar > * {
              transition-duration: calc(var(--findbar-transition-duration) / 2) !important;
              transition-delay: calc(var(--findbar-transition-duration) / 2) !important;
            }
            findbar[hidden="true"] > * {
              transition-delay: 0s !important;
            }

            /* format textbox */
            .findbar-textbox {
              width: var(--textbox-width) !important;
              min-width: var(--textbox-min-width) !important;
              border: none !important;
              outline: none !important;
              box-shadow: none !important;
            }
            .findbar-textbox:not([status]) {
              background-color: transparent !important;
            }
            .findbar-textbox:not(:focus, [status]):hover {
              background-color: var(--toolbar-field-background-color) !important;
            }

            /* position found matches label */
            label.found-matches {
              position: absolute !important;
              right: calc(100% - var(--textbox-width)) !important;
              text-align: right !important;
              margin: 0px !important;
            }

            /* hide other labels */
            .findbar-label:not(.found-matches) {
              display: none !important;
            }

            /* simplify checkboxes */
            .findbar-container > checkbox {
              display: grid !important;
              justify-items: center !important;
              margin-left: 0px !important;
              overflow: hidden !important;
            }
            .findbar-container > checkbox *{
              display: none !important;
            }

            /* format checkboxes */
            .findbar-highlight {
              order: var(--highlight-all-position) !important;
              width: calc(30px * var(--show-highlight-all)) !important;
              height: calc(24px * var(--show-highlight-all)) !important;
              margin-right: calc(4px * var(--show-highlight-all)) !important;
            }
            .findbar-case-sensitive {
              order: var(--match-case-position) !important;
              width: calc(30px * var(--show-match-case)) !important;
              height: calc(24px * var(--show-match-case)) !important;
              margin-right: calc(4px * var(--show-match-case)) !important;
            }
            .findbar-match-diacritics {
              order: var(--match-diacritics-position) !important;
              width: calc(30px * var(--show-match-diacritics)) !important;
              height: calc(24px * var(--show-match-diacritics)) !important;
              margin-right: calc(4px * var(--show-match-diacritics)) !important;
            }
            .findbar-entire-word {
              order: var(--whole-words-position) !important;
              width: calc(30px * var(--show-whole-words)) !important;
              height: calc(24px * var(--show-whole-words)) !important;
              margin-right: calc(4px * var(--show-whole-words)) !important;
            }
            .findbar-highlight::before {
              content: "[ab]";
              font-weight: bold;
              color: var(--toolbar-color);
            }
            .findbar-case-sensitive::before {
              content: "Aa";
              font-weight: bold;
              color: var(--toolbar-color);
            }
            .findbar-match-diacritics::before {
              content: "àë";
              font-weight: bold;
              color: var(--toolbar-color);
            }
            .findbar-entire-word::before {
              content: "ab";
              font-weight: bold;
              color: var(--toolbar-color);
              grid-row: 1;
              grid-column: 1;
            }
            .findbar-entire-word::after {
              width: 1.3em;
              height: 0.2em;
              margin-bottom: -1em;
              content: "";
              border-left: 2px solid var(--toolbar-color);
              border-right: 2px solid var(--toolbar-color);
              border-bottom: 1px solid var(--toolbar-color);
              grid-row: 1;
              grid-column: 1;
            }

            /* checkbox hover/active background */
            .findbar-container > checkbox:not([checked]):hover {
              background-color: var(--toolbarbutton-hover-background) !important;
              border-radius: 4px !important;
            }
            .findbar-container > checkbox[checked] {
              background-color: var(--toolbarbutton-active-background) !important;
              border-radius: 4px !important;
            }

            /* format close button */
            .findbar-closebutton {
              margin-left: calc(4px * var(--show-margin)) !important;
            }

      '';
    };
  };
}
