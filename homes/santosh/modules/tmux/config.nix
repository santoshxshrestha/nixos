{ colors, ... }:
''
  # enable/disable status Bar
  set -g status off

  # Copy Mode
  set -g mode-keys vi
  bind -T copy-mode-vi v send-keys -X begin-selection
  bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
  # set -g mode-style fg="${colors.rose_surface}",bg="${colors.rose_text}"
  # set -g mode-style fg="${colors.rose_text}",bg="${colors.rose_surface}"

  # Vim-Like Navigation
  bind-key ^ last-window
  bind-key h select-pane -L
  bind-key j select-pane -D
  bind-key k select-pane -U
  bind-key l select-pane -R
  # I'll thing of them later I am ok with pre n pre p
  # bind-key -r C-h select-window -t :-
  # bind-key -r C-l select-window -t :+

  # Increased History
  set-option -g history-limit 100000

  # Status Bar Position
  set-option -g status-position top

  # switching windows
  bind -n M-] next-window      
  bind -n M-[ previous-window 

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


  # Pane Borders with Enhanced Colors
  set -g pane-border-style fg=${colors.rose_surface}
  set -g pane-active-border-style fg=${colors.rose_subtle}

  # Message Style
  set -g message-style bg=${colors.rose_surface},fg=${colors.rose_text}

  bind-key -r f run-shell "tmux neww sessionizer"
  bind -n M-i run-shell "tmux neww sessionizer"

  bind-key -r H run-shell "tmux neww sessionizer ~/nixos"
  bind-key -r k run-shell "tmux neww sessionizer ~/dev"

''
