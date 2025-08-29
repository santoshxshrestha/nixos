{ pkgs, lib, ... }:
let
  tmux-session-manager = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-session-manager";
    name = "tmux-session-manager";
    src = pkgs.fetchFromGitHub {
      owner = "santoshxshrestha";
      repo = "tmux-session-manager";
      rev = "07c0d4447a40248bea4f04ab9b61263512394500";
      sha256 = "sha256-94s2I7NUKy0rTdNcI5105LPK/TNDdF2Cuegdxuz6qYA=";
    };
  };
in {
  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.prefix-highlight;
        extraConfig = ''
          # Prefix Highlight Configuration
          set -g @prefix_highlight_fg '$rose_text'
          set -g @prefix_highlight_bg '$rose_base'
          set -g @prefix_highlight_show_copy_mode 'on'
          set -g @prefix_highlight_copy_mode_attr 'fg=$rose_text,bg=$rose_base,bold'
          set -g @prefix_highlight_show_sync_mode 'on'
          set -g @prefix_highlight_sync_mode_attr 'fg=$rose_text,bg=$rose_base,bold'
          set -g @prefix_highlight_prefix_prompt '󰣇'  # Only show dot when prefix is active
          set -g @prefix_highlight_empty_prompt ' ● '   # show when not in prefix mode
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
          set -g @floax-border-color '#707070'
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
    ];

    extraConfig = ''
      # Terminal Configuration
      set -g terminal-overrides ',xterm-256color:Tc'
      set -g default-terminal "tmux-256color"
      set -s escape-time 0
      # set -ga terminal-overrides ",xterm-256color:Tc"
      # the ga one also work but since there is only one color Overrides so no need to use it

      # Prefix Setup
      unbind C-b
      set -g prefix C-a
      bind-key C-a send-prefix
      set -g mouse on

      # enable/disable status Bar
      set -g status on

      # Copy Mode
      set -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
      # set -g mode-style fg="$rose_surface",bg="$rose_text"
      # set -g mode-style fg="$rose_text",bg="$rose_surface"

      # Vim-Like Navigation
      bind-key ^ last-window
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      # I'll thing of them later I am ok with pre n pre p
      # bind-key -r C-h select-window -t :-
      # bind-key -r C-l select-window -t :+

      # Reload Configuration
      # unbind r
      # bind r source-file ~/.tmux.conf

      # Window and Pane Indexing
      set -g base-index 1
      set -g pane-base-index 1

      # Increased History
      set-option -g history-limit 100000

      # Status Bar Position
      set-option -g status-position top

      # Enhanced Rose Pine Colors
      rose_base="#020204"
      rose_surface="#1f1d2e"
      rose_text="#e0def4"
      rose_subtle="#908caa"
      rose_pine="#31748f"
      rose_gold="#f6c177"
      rose_love="#eb6f92"
      rose_foam="#9ccfd8"
      rose_iris="#c4a7e7"
      rose_highlight="#2a2837"
      rose_overlay="#26233a"

      # Status Bar with Enhanced Colors
      set -g status-style bg=$rose_base,fg=$rose_text
      set -g status-left "#[fg=$rose_text,bg=$rose_base,italics] 󰆍 #S #[fg=$rose_foam,bg=$rose_surface]"
      set -g status-left-length 20
      set -g status-right-length 40
      # set -g status-right '#[fg=#{rose_text},bg=#{rose_base},italics] #{battery_icon} #{battery_percentage}   %a %b %d   %I:%M %p #{prefix_highlight}' 
      set -g status-right '#[fg=#{rose_text},bg=#{rose_base},italics] #{prefix_highlight}' 
      set -g status-justify absolute-centre

      #session management
      bind C command-prompt -p "New session name: " "new-session -d -s '%%'"  # Create new sessio
      # bind S command-prompt -p "Rename session:" "rename-session '%%'"
      bind s choose-tree -Zs              # Interactive session chooser

      # For synchronize-panes mode
      bind = setw synchronize-panes

      # Resize panes with Alt+arrow
      bind -n M-Left resize-pane -L 5
      bind -n M-Right resize-pane -R 5
      bind -n M-Up resize-pane -U 5
      bind -n M-Down resize-pane -D 7

      # Better window/pane creation
      bind o split-window -h -c "#{pane_current_path}"   # Split horizontally using |
      bind v split-window -v -c "#{pane_current_path}"   # Split vertically using -
      bind c new-window -c "#{pane_current_path}"        # New window with current path

      setw -g monitor-activity on
      # set -g visual-activity on #this line will give give you kinda notification 
      setw -g automatic-rename on

      # Window Status with Better Colors
      setw -g window-status-format "#[fg=$rose_subtle,bg=$rose_base,italics] ○ #W "
      setw -g window-status-current-format "#[fg=$rose_text,bg=$rose_base,italics]  #W "
      # setw -g window-status-format "#[fg=$rose_subtle,bg=$rose_base,italics] #W "
      # setw -g window-status-current-format "#[fg=$rose_text,bg=$rose_base,underscore,italics] #W "
      setw -g window-status-separator ""

      # Pane Borders with Enhanced Colors
      set -g pane-border-style fg=$rose_surface
      set -g pane-active-border-style fg=$rose_subtle

      # Message Style
      set -g message-style bg=$rose_surface,fg=$rose_text

      bind-key -r f run-shell "tmux neww ~/.local/scripts/sessionizer"
      bind-key -r H run-shell "tmux neww ~/.local/scripts/sessionizer ~/dotfiles"
      bind-key -r k run-shell "tmux neww ~/.local/scripts/sessionizer ~/dev/mdwatch"

    '';
  };
}
