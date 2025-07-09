# NixOS Configuration

> [!NOTE]
> the reason that the config for the zsh is in the configuration.nix is below
>Home Manager only configures applications for your user - it doesn't have permission to change system-level settings like your login shell. When you log in, the system looks at /etc/passwd (or equivalent) to determine which shell to start, and Home Manager can't modify that.
