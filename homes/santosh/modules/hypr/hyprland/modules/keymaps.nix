###################
### KEYBINDINGS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/
{
  wayland.windowManager.hyprland.settings = {
    # "$mainMod" = "SUPER";  # Sets "Windows" key as main modifier
    "$mainMod" = "ALT";

    bind = [
      # Custom script bindings
      "$mainMod,w,exec,rofi-wallpaper-selector"
      # "$mainMod,w,exec,~/.local/scripts/switch-to-static"
      "$mainMod,d,exec,~/.local/scripts/switch-to-dynamic"
      "$mainMod,minus,exec,~/.local/scripts/waybar-toggle"

      # Clipboard history with rofi
      # ''SUPER_SHIFT,V,exec,cliphist list | rofi -dmenu -theme ~/.config/rofi/themes/clipboard.rasi | cliphist delete''
      # ''SUPER,V,exec,cliphist list | rofi -dmenu -theme ~/.config/rofi/themes/clipboard.rasi | cliphist decode | wl-copy''
      ''SUPER,V,exec,clipManager''

      # Window management - see https://wiki.hyprland.org/Configuring/Binds/ for more
      "$mainMod,F,fullscreen"
      "$mainMod,RETURN,exec,$terminal"
      "$mainMod,C,killactive"
      "$mainMod,M,exit"
      "$mainMod,E,exec,$fileManager"
      "$mainMod,V,togglefloating"
      "$mainMod,P,pseudo" # dwindle: toggles pseudotiling for the focused window
      # "$mainMod,J,togglesplit"  # dwindle: toggles split orientation - commented to avoid vim motion interference
      "$mainMod,space,exec,$menu"
      "$mainMod,b,exec,$browser"

      # Scrolling management
      "$mainMod, period, layoutmsg, move +col"
      "$mainMod, comma, layoutmsg, move -col"
      "$mainMod SHIFT, period, layoutmsg, movewindowto r"
      "$mainMod SHIFT, comma, layoutmsg, movewindowto l"
      "$mainMod SHIFT, up, layoutmsg, movewindowto u"
      "$mainMod SHIFT, down, layoutmsg, movewindowto d"

      # Screenshot bindings
      # Note: HYPRSHOT_DIR command has issues, so forcing specific directory
      "$mainMod,PRINT,exec,hyprshot -m window -o /home/santosh/Pictures/Screenshots" # Screenshot a window
      ",PRINT,exec,hyprshot -m output -o /home/santosh/Pictures/Screenshots" # Screenshot a monitor
      "SHIFT,PRINT,exec,hyprshot -m region -o /home/santosh/Pictures/Screenshots" # Screenshot a region
      "$mainMod,s,exec,hyprshot -m region -o /home/santosh/Pictures/Screenshots --clipboard-only" # Screenshot region to clipboard only

      # Lock screen
      "SUPER_SHIFT,l,exec,hyprlock"

      # Move focus with mainMod + vim-style keys
      "$mainMod,h,movefocus,l"
      "$mainMod,l,movefocus,r"
      "$mainMod,k,movefocus,u"
      "$mainMod,j,movefocus,d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod,1,workspace,1"
      "$mainMod,2,workspace,2"
      "$mainMod,3,workspace,3"
      "$mainMod,4,workspace,4"
      "$mainMod,5,workspace,5"
      "$mainMod,6,workspace,6"
      "$mainMod,7,workspace,7"
      "$mainMod,8,workspace,8"
      "$mainMod,9,workspace,9"
      "$mainMod,0,workspace,10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT,1,movetoworkspace,1"
      "$mainMod SHIFT,2,movetoworkspace,2"
      "$mainMod SHIFT,3,movetoworkspace,3"
      "$mainMod SHIFT,4,movetoworkspace,4"
      "$mainMod SHIFT,5,movetoworkspace,5"
      "$mainMod SHIFT,6,movetoworkspace,6"
      "$mainMod SHIFT,7,movetoworkspace,7"
      "$mainMod SHIFT,8,movetoworkspace,8"
      "$mainMod SHIFT,9,movetoworkspace,9"
      "$mainMod SHIFT,0,movetoworkspace,10"

      # Example special workspace (scratchpad) - uncomment to enable:
      # "$mainMod,S,togglespecialworkspace,magic"
      # "$mainMod SHIFT,S,movetoworkspace,special:magic"

      # Scroll through existing workspaces with mainMod + scroll - uncomment to enable:
      # "$mainMod,mouse_down,workspace,e+1"
      # "$mainMod,mouse_up,workspace,e-1"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod,mouse:272,movewindow"
      "$mainMod,mouse:273,resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      # Volume controls - using wpctl with 150% volume limit
      ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      # Brightness controls
      ",XF86MonBrightnessUp,exec,brightnessctl s 10%+"
      ",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
    ];

    # Media player controls (requires playerctl)
    bindl = [
      ",XF86AudioNext,exec,playerctl next"
      ",XF86AudioPause,exec,playerctl play-pause"
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPrev,exec,playerctl previous"
    ];
  };
}
