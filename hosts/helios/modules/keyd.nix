{
  config,
  lib,
  ...
}:
{
  options = {
    keyd.enable = lib.mkEnableOption "Enable keyd for keyboard remapping";
  };
  config = lib.mkIf config.keyd.enable {
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
          # Optional: adjust timing (default is usually fine)
          global = {
            overload_tap_timeout = "200"; # milliseconds
          };
        };
      };
    };
  };
}
