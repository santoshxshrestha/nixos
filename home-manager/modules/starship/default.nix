{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 500;
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
        "$golang"
        "$java"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
    };
  };
}
