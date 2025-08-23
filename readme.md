<h1 id="header" align="center">
  <img src=".github/assets/nix-snowflake-colours.svg" width="128px" height="128px" />
  <br>
    nixos
</h1>

> **⚠️ Disclaimer**: Use at your own risk. This configuration works well for me, but you might need to adapt it for your specific setup.

## Overview

This repository contains a personal NixOS and Home Manager configuration built with Nix flakes. It provides a reproducible, declarative system configuration that integrates system-level and user-level customizations for a complete development and daily-use environment.

## Features

### Core Components

- **NixOS System Configuration**: Complete system-level configuration managed declaratively
- **Home Manager Integration**: User-level configuration integrated into the NixOS system (not standalone)
- **Flake-based Architecture**: Modern Nix flakes for reproducibility and easy updates
- **nixvim Integration**: Neovim configuration managed through nixvim

### Desktop Environment

- **Hyprland Window Manager**: Modern Wayland compositor for tiling window management
- **Shell Customizations**: Enhanced Zsh/Fish shell configurations
- **Essential Software Packages**: Curated collection of daily-use applications

### Development Environment

- **Neovim Setup**: Fully configured development environment via nixvim
- **Development Tools**: Dev shells and additional tools in config
- **Modular Structure**: Easy customization and scaling for different needs

## Repository Structure

```

.
├── flake.nix # Main flake configuration
├── flake.lock # Locked dependencies
├── homes/ # Home Manager configurations (per user)
│ └── santosh/
│ ├── assets/ # Images and logos
│ ├── config/ # App and environment configs (alacritty, hyprland, kitty, etc.)
│ ├── home.nix # Home Manager entrypoint for user
│ ├── modules/ # Home Manager modules (nixvim, pkgs, starship, etc.)
│ └── scripts/ # User scripts and utilities
├── hosts/ # Host-specific NixOS configurations
│ └── helios/
│ ├── configuration.nix
│ ├── hardware-configuration.nix
│ └── modules/ # Host-specific modules (packages, sddm, stylix)
├── wallpapers/ # Wallpaper images
└── readme.md

```

## Configuration Highlights

### System Configuration

- **Host-based Configuration**: Each system under `hosts/` with its own modules
- **Boot Configuration**: Optimized boot settings and kernel parameters
- **Network Management**: NetworkManager with custom network profiles
- **Security Settings**: Firewall, user permissions, and security hardening
- **Hardware Support**: Graphics drivers, audio, and peripheral support

### Desktop Environment

- **Hyprland**: Configured with custom keybindings and workspace management
- **Display Management**: Multi-monitor support and display scaling
- **Theme and Appearance**: Consistent theming across applications
- **Input Method**: Keyboard and mouse configuration

### Development Setup

- **Neovim**: Full IDE experience with LSP, syntax highlighting, and plugins (via nixvim)
- **Shell Environment**: Enhanced shell with aliases, functions, and prompt customization
- **Version Control**: Git configuration with helpful aliases and settings
- **Development Tools**: Compilers, interpreters, and build tools

### Home Manager Integration

- **Dotfiles Management**: Centralized configuration for user applications
- **Application Configurations**: Browser, terminal, and productivity app settings
- **User Services**: Background services and automation
- **Environment Variables**: Consistent environment across shell sessions

## Customization Guide

### Adding New Packages

```nix
# In your hosts/helios/modules/packages.nix or relevant module
environment.systemPackages = with pkgs; [
  # Add your packages here
  firefox
  vscode
  # ... other packages
];
```

### Modifying Hyprland Configuration

Edit the relevant files under `homes/santosh/config/hyprland/` to adjust:

- Keybindings and shortcuts
- Window management rules
- Workspace configuration
- Display and monitor settings

### Extending Home Manager

```nix
# In homes/santosh/home.nix or a user module
home.packages = with pkgs; [
  # User-specific packages
];

programs.{application} = {
  enable = true;
  # Application-specific configuration
};
```

### Adding Custom Modules

Create new modules in the appropriate `modules/` directory:

```nix
# homes/santosh/modules/my-module.nix
{ config, pkgs, ... }:
{
  # Your custom configuration
}
```

## Maintenance

### Updating the System

```bash
# Update flake inputs
nix flake update

# Apply updates (replace helios with your host if needed)
sudo nixos-rebuild switch --flake .#helios
```

### Garbage Collection

```bash
# Clean old generations
sudo nix-collect-garbage -d

# Clean user profiles
nix-collect-garbage -d
```

### Rolling Back Changes

```bash
# List available generations
sudo nixos-rebuild list-generations

# Switch to a previous generation
sudo nixos-rebuild switch --rollback
```

## Troubleshooting

### Common Issues

1. **Hardware Compatibility**: Update `hardware-configuration.nix` for your specific hardware
2. **Missing Packages**: Check if packages are available in nixpkgs or require additional overlays
3. **Conflicting Configurations**: Review module imports and option conflicts

### Debugging Tips

- Use `nixos-rebuild dry-build` to check configuration without applying
- Check system logs with `journalctl` for boot and service issues
- Verify flake syntax with `nix flake check`

### Getting Help

- Check the [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- Visit the [NixOS Wiki](https://nixos.wiki/)
- Join the NixOS community on Discord or Matrix

## Contributing

### Before Contributing

1. Test changes thoroughly on your system
2. Document any new features or modifications
3. Follow Nix coding conventions and best practices

### Contribution Guidelines

- Keep configurations modular and reusable
- Document complex configurations
- Test on multiple hardware configurations when possible
- Update documentation for significant changes

## Architecture Notes

### Flake Structure

The configuration uses Nix flakes for:

- **Reproducible Builds**: Locked dependencies ensure consistent rebuilds
- **Input Management**: Easy integration of external configurations and packages
- **Output Flexibility**: Support for multiple system configurations

### Home Manager Integration

Home Manager is integrated into the NixOS system configuration rather than running standalone:

- Unified rebuild process
- Consistent user and system state
- Simplified maintenance

### Modular Design

The configuration is structured modularly to:

- Enable/disable features easily
- Reuse configurations across different systems
- Maintain clean separation of concerns
- Facilitate customization and extension

---

**Note**: This documentation is based on the repository structure and features in the current state. For the most up-to-date information, please refer to the actual configuration files and commit history in the repository.
