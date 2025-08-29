{ pkgs, colors, tmux-session-manager, ... }:
with pkgs; [
  tmuxPlugins.sensible
  tmuxPlugins.vim-tmux-navigator
  {
    plugin = tmuxPlugins.prefix-highlight;
    extraConfig = ''
      # Prefix Highlight Configuration
      set -g @prefix_highlight_fg '${colors.rose_text}'
      set -g @prefix_highlight_bg '${colors.rose_base}'
      set -g @prefix_highlight_show_copy_mode 'on'
      set -g @prefix_highlight_copy_mode_attr 'fg=${colors.rose_text},bg=${colors.rose_base},bold'
      set -g @prefix_highlight_show_sync_mode 'on'
      set -g @prefix_highlight_sync_mode_attr 'fg=${colors.rose_text},bg=${colors.rose_base},bold'
      set -g @prefix_highlight_prefix_prompt ' '  # Only show dot when prefix is active
      set -g @prefix_highlight_empty_prompt ' ● '   # show when not in prefix mode


      # Status Bar with Enhanced Colors
      set -g status-style bg=${colors.rose_base},fg=${colors.rose_text}
      set -g status-left "#[fg=${colors.rose_text},bg=${colors.rose_base},italics] 󰆍 #S #[fg=${colors.rose_foam},bg=${colors.rose_surface}]"
      set -g status-left-length 20
      set -g status-right-length 40
      # set -g status-right '#[fg=${colors.rose_text},bg=${colors.rose_base},italics] #{battery_icon} #{battery_percentage}   %a %b %d   %I:%M %p #{prefix_highlight}' 
      set -g status-right '#[fg=${colors.rose_text},bg=${colors.rose_base},italics] #{prefix_highlight}' 
      set -g status-justify absolute-centre


      # Window Status with Better Colors
      setw -g window-status-format "#[fg=${colors.rose_subtle},bg=${colors.rose_base},italics] ○ #W "
      setw -g window-status-current-format "#[fg=${colors.rose_text},bg=${colors.rose_base},italics]  #W "
      # setw -g window-status-format "#[fg=${colors.rose_subtle},bg=${colors.rose_base},italics] #W "
      # setw -g window-status-current-format "#[fg=${colors.rose_text},bg=${colors.rose_base},underscore,italics] #W "
      setw -g window-status-separator ""
    '';
  }

  {
    plugin = tmuxPlugins.battery;
    extraConfig = ''
      # Battery Icons Configuration
      set -g @batt_icon_charge_tier8 '󰁹'
      set -g @batt_icon_charge_tier7 '󰂀'
      set -g @batt_icon_charge_tier6 '󰁿'
      set -g @batt_icon_charge_tier5 '󰁾'
      set -g @batt_icon_charge_tier4 '󰁽'
      set -g @batt_icon_charge_tier3 '󰁼'
      set -g @batt_icon_charge_tier2 '󰁻'
      set -g @batt_icon_charge_tier1 '󰁺'
      set -g @batt_icon_status_charged '󰂅 '
      set -g @batt_icon_status_charging '󱐋'
      set -g @batt_icon_status_discharging '󰂀'
    '';
  }

  {
    plugin = tmuxPlugins.tmux-floax;
    extraConfig = ''

      # Floax Configuration
      # set -g @floax-border-color '#7195D2'
      set -g @floax-border-color '${colors.rose_subtle}'
      # M- means "hold Meta/Alt"
      set -g @floax-bind '-n M-o'
      set -g @floax-title  '   #{user}@#{host} '
    '';
  }
  {
    plugin = tmux-session-manager;
    extraConfig = ''
      set -g @session_manager_key 'j'
    '';
  }
]
