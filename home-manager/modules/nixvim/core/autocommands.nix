{
  config.autoCmd = [{
    # Highlight yank text
    event = "TextYankPost";
    pattern = "*";
    command = "lua vim.highlight.on_yank{timeout=500}";
  }];
}
