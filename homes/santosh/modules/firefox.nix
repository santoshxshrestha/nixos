{
  programs.firefox = {
    enable = true;
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
