# NixOS Configuration Documentation

> **⚠️ Disclaimer**: Use at your own risk. This configuration works well for the me, but you might need to adapt it for your specific setup.

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
- **Development Tools**: I use dev shells but there are some tools in config too
- **Modular Structure**: Easy customization and scaling for different needs

## Repository Structure

```
nixos/
├── flake.nix              # Main flake configuration
├── flake.lock             # Locked dependencies
├── configuration.nix      # Main NixOS configuration
├── hardware-configuration.nix  # Hardware-specific settings
├── home.nix              # Home Manager configuration
└── modules/              # Custom modules and configurations
    ├── desktop/          # Desktop environment configs
    ├── development/      # Development environment
    ├── system/           # System-level configurations
    └── users/            # User-specific settings
```

## Configuration Highlights

### System Configuration

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

- **Neovim**: Full IDE experience with LSP, syntax highlighting, and plugins
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
# In your configuration.nix or relevant module
environment.systemPackages = with pkgs; [
  # Add your packages here
  firefox
  vscode
  # ... other packages
];
```

### Modifying Hyprland Configuration

Edit the Hyprland configuration module to adjust:

- Keybindings and shortcuts
- Window management rules
- Workspace configuration
- Display and monitor settings

### Extending Home Manager

```nix
# In home.nix or user module
home.packages = with pkgs; [
  # User-specific packages
];

programs.{application} = {
  enable = true;
  # Application-specific configuration
};
```

### Adding Custom Modules

Create new modules in the `modules/` directory:

```nix
# modules/custom/my-service.nix
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

# Apply updates
sudo nixos-rebuild switch --flake .
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

# Switch to a specific generation
sudo nixos-rebuild switch --rollback
```

## Troubleshooting

### Common Issues

1. **Hardware Compatibility**: Update `hardware-configuration.nix` for your specific hardware
2. **Missing Packages**: Check if packages are available in nixpkgs or require additional channels
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

**Note**: This documentation is based on the repository structure and features in current state . For the most up-to-date information, please refer to the actual configuration files and commit history in the repository.
