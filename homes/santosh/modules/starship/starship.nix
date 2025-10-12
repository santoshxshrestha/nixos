{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      # Add a blank line between shell prompts
      add_newline = true;

      # Timeout for commands (in milliseconds)
      command_timeout = 500;

      # Main prompt format - customize the order and modules you want
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$python"
        "$nodejs"
        "$rust"
        "$lua"
        "$golang"
        "$java"
        "$line_break"
        "$character"
      ];

      # Right side prompt format
      right_format = "$cmd_duration";

      # Nix shell module
      nix_shell = {
        disabled = false;
        style = "bold white";
        symbol = " ";
      };

      # Directory module - shows current path
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = " ";
        read_only = " ";
        read_only_style = "bold red";
        format = "[ ](fg:#d20f39)[$path](fg:white bg:#d20f39)[$read_only]($read_only_style)[ ](fg:#d20f39)";
      };

      # Git branch with cool styling
      git_branch = {
        symbol = "󰘬 ";
        truncation_length = 16;
        truncation_symbol = "…";
        format = "[$symbol$branch](bold #575279) ";
        style = "bold #575279";
      };

      # Git status with neon indicators
      git_status = {
        format = "([$all_status$ahead_behind](#e0def4 ) )";
        style = "bold bright-red";
        conflicted = "⚡";
        ahead = "↑";
        behind = "↓";
        diverged = "↕";
        up_to_date = "";
        untracked = "?";
        stashed = "⚑";
        modified = "!";
        staged = "+";
        renamed = "→";
        deleted = "✘";
      };

      # Git commit
      git_commit = {
        commit_hash_length = 7;
        format = "[$hash$tag]($style) ";
        style = "bold yellow";
        only_detached = true;
        tag_symbol = " ";
        tag_disabled = false;
      };

      # Git state (for operations like merge, rebase, etc.)
      git_state = {
        format = "[($state( $progress_current of $progress_total))]($style) ";
        style = "bold red";
        cherry_pick = " PICKING";
        bisect = " BISECTING";
        am = " AM";
        am_or_rebase = " AM/REBASE";
        merge = " MERGING";
        rebase = " REBASING";
      };

      # Git metrics - shows insertions/deletions
      git_metrics = {
        added_style = "bold white";
        deleted_style = "bold white";
        format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
        disabled = true;
      };

      cmd_duration = {
        min_time = 0;
        format = "[🬖🬥🬔🬗](fg:#d20f39)[ time:$duration ](bg:#d20f39 fg:#000000)[🬖🬥🬖🬥](fg:#d20f39)";
        style = "bg:#d20f39 fg:#000000";
        show_milliseconds = true;
      };

      # Character module - the prompt character
      character = {
        success_symbol = "[🭧🭒](fg:#d20f39)[✦ ❯](fg:white bg:#d20f39)[](fg:#d20f39)";
        error_symbol = "[❯](bold red)";
        vicmd_symbol = "[❮](bold blue)";
      };

      # Language-specific modules
      python = {
        symbol = " ";
        format = "via [$symbol$pyenv_prefix($version)(($virtualenv))]($style) ";
        style = "bold blue";
        pyenv_version_name = true;
        python_binary = [
          "python"
          "python3"
          "python2"
        ];
      };

      nodejs = {
        symbol = " ";
        format = "via [$symbol($version)]($style) ";
        style = "bold green";
        detect_files = [
          "package.json"
          ".nvmrc"
        ];
      };

      rust = {
        symbol = " ";
        format = "via [$symbol($version)]($style) ";
        style = "bold red";
      };

      lua = {
        symbol = " ";
        format = "via [$symbol($version)]($style) ";
        style = "bold blue";
      };

      golang = {
        symbol = "󰟓 ";
        format = "via [$symbol($version)]($style) ";
        style = "bold cyan";
      };

      java = {
        symbol = "";
        format = "via [$symbol($version)]($style) ";
        style = "bold yellow";
      };

      # Additional useful modules
      status = {
        disabled = false;
        format = "[$symbol$number]($style) ";
        symbol = "✖";
        style = "bold red";
      };

      jobs = {
        disabled = false;
        format = "[$symbol$number]($style) ";
        symbol = "⚙";
        style = "bold blue";
      };

      shell = {
        disabled = true;
        format = "[$indicator]($style) ";
        bash_indicator = "bash";
        fish_indicator = "fish";
        zsh_indicator = "zsh";
        style = "bold dimmed white";
      };

      # Disabled modules (to exclude hostname, time, etc.)
      hostname = {
        disabled = true;
      };

      time = {
        disabled = true;
      };

      username = {
        disabled = true;
      };

      battery = {
        disabled = true;
      };

      memory_usage = {
        disabled = true;
      };

      package = {
        disabled = true;
      };

      aws = {
        disabled = true;
      };

      docker_context = {
        disabled = true;
      };

      kubernetes = {
        disabled = true;
      };
    };
  };
}
