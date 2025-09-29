# -----------------------------------------------------
# Animations
# Current: "Dynamic" style (disabled for performance)
# Alternative configurations commented below
# -----------------------------------------------------

# https://wiki.hyprland.org/Configuring/Variables/#animations
{
  wayland.windowManager.hyprland.settings = {

    animations = {
      enabled = true; # Set to true to enable animations
      bezier = [
        "wind,0.05,0.9,0.1,1"
        "winIn,0.1,1,0.1,1"
        "winOut,0.3,0,0,1"
        "liner,1,1,1,1"
      ];
      animation = [
        "windows,1,6,wind,slide"
        "windowsIn,1,6,winIn,slide"
        "windowsOut,1,5,winOut,slide"
        "windowsMove,1,5,wind,slide"
        "border,0,1,liner"
        "borderangle,0,30,liner,loop"
        "fade,1,10,default"
        "workspaces,0,5,wind"
      ];
    };

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    # Alternative "Default" animations configuration:
    # animations = {
    #   enabled = true;  # yes, please :)
    #   bezier = [
    #     "easeOutQuint,0.23,1,0.32,1"
    #     "easeInOutCubic,0.65,0.05,0.36,1"
    #     "linear,0,0,1,1"
    #     "almostLinear,0.5,0.5,0.75,1.0"
    #     "quick,0.15,0,0.1,1"
    #   ];
    #   animation = [
    #     "global,1,10,default"
    #     "border,1,5.39,easeOutQuint"
    #     "windows,1,4.79,easeOutQuint"
    #     "windowsIn,1,4.1,easeOutQuint,popin 87%"
    #     "windowsOut,1,1.49,linear,popin 87%"
    #     "fadeIn,1,1.73,almostLinear"
    #     "fadeOut,1,1.46,almostLinear"
    #     "fade,1,3.03,quick"
    #     "layers,1,3.81,easeOutQuint"
    #     "layersIn,1,4,easeOutQuint,fade"
    #     "layersOut,1,1.5,linear,fade"
    #     "fadeLayersIn,1,1.79,almostLinear"
    #     "fadeLayersOut,1,1.39,almostLinear"
    #     "workspaces,1,1.94,almostLinear,fade"
    #     "workspacesIn,1,1.21,almostLinear,fade"
    #     "workspacesOut,1,1.94,almostLinear,fade"
    #   ];
    # };

    # Alternative "Fast" animations configuration:
    # animations = {
    #   enabled = true;
    #   bezier = [
    #     "linear,0,0,1,1"
    #     "md3_standard,0.2,0,0,1"
    #     "md3_decel,0.05,0.7,0.1,1"
    #     "md3_accel,0.3,0,0.8,0.15"
    #     "overshot,0.05,0.9,0.1,1.1"
    #     "crazyshot,0.1,1.5,0.76,0.92"
    #     "hyprnostretch,0.05,0.9,0.1,1.0"
    #     "fluent_decel,0.1,1,0,1"
    #     "easeInOutCirc,0.85,0,0.15,1"
    #     "easeOutCirc,0,0.55,0.45,1"
    #     "easeOutExpo,0.16,1,0.3,1"
    #   ];
    #   animation = [
    #     "windows,1,3,md3_decel,popin 60%"
    #     "border,1,10,default"
    #     "fade,1,2.5,md3_decel"
    #     "workspaces,1,3.5,easeOutExpo,slide"
    #     "specialWorkspace,1,3,md3_decel,slidevert"
    #   ];
    # };

    # windowrulev2 are defined at the end
    # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    # "Smart gaps" / "No gaps when only" - uncomment all if you wish to use that:
    # workspace = [
    #   "w[tv1],gapsout:0,gapsin:0"
    #   "f[1],gapsout:0,gapsin:0"
    # ];
  };
}
