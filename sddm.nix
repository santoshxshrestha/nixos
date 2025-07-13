{ pkgs, ... }:
let
  myCustomSddmTheme = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "sddm-greenleaf";
    rev = "d21828cc54d1e0c25d5d026539bcb13503ed07b9";
    sha256 = pkgs.lib.fakeSha256;  
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-greenleaf";
  };
  
  environment.etc."sddm/themes/sddm-greenleaf".source = myCustomSddmTheme;
}
