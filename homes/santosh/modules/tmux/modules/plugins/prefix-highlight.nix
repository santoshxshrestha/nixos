{ pkgs, colors, ... }:
{
  plugin = pkgs.tmuxPlugins.prefix-highlight;
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
    # helps to change status bar colors when tmux is focused or unfocused
    set -g focus-events on
    # set -g status-style bg=${colors.rose_base},fg=${colors.rose_text}
    set -g status-style bg=default,fg=${colors.rose_text}

    # set -g status-left "#[fg=${colors.rose_text},bg=${colors.rose_base},italics] 󰆍 #S #[fg=${colors.rose_foam},bg=${colors.rose_surface}]"
    set -g status-left "#[fg=${colors.rose_text},bg=default,italics] 󰆍 #S #[fg=${colors.rose_foam},bg=${colors.rose_surface}]"

    set -g status-left-length 99
    set -g status-right-length 99

    # set -g status-right '#[fg=${colors.rose_text},bg=${colors.rose_base},italics] #{battery_icon} #{battery_percentage}   %a %b %d   %I:%M %p #{prefix_highlight}'
    # set -g status-right '#[fg=${colors.rose_text},bg=${colors.rose_base},italics] #{prefix_highlight}'
    set -g status-right '#[fg=${colors.rose_text},bg=default,italics] #{prefix_highlight}'
    set -g status-justify centre


    # Window Status with Better Colors
    # setw -g window-status-format "#[fg=${colors.rose_subtle},bg=${colors.rose_base},italics] ○ #W "
    # setw -g window-status-current-format "#[fg=${colors.rose_text},bg=${colors.rose_base},italics]  #W "
    setw -g window-status-format "#[fg=${colors.rose_subtle},bg=default,italics] #W "
    setw -g window-status-current-format "#[fg=${colors.rose_text},bg=default,underscore,italics] #W "
    setw -g window-status-separator ""
  '';
}
