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
      ShowHomeButton = true;

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

      '';
    };
  };
}
