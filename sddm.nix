{ pkgs, ... }:
let
  myCustomSddmTheme = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "sddm-greenleaf";
    rev = "d21828cc54d1e0c25d5d026539bcb13503ed07b9";
    sha256 = "sha256-gB2ljFqhm4SaI5M/IfU37gySdIn7BQH7PlDRIv66Hpo=";
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    theme = "greenleaf";
    
    package = pkgs.kdePackages.sddm;
    
    settings = {
      Theme = {
        Current = "greenleaf";
        ThemeDir = "/etc/sddm/themes";
      };
    };
  };
  
  environment.etc."sddm/themes/greenleaf".source = myCustomSddmTheme;
  
  environment.systemPackages = with pkgs; [
    kdePackages.qt5compat      # qt6-5compat
    kdePackages.qtdeclarative  # qt6-declarative
    kdePackages.qtsvg          # qt6-svg
    
  ];
}
