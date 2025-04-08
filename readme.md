# NixOS Configuration

This repository contains my personal NixOS configuration, which is currently being set up by converting my existing dotfiles into NixOS-specific configurations. I am using **Nix Flakes** and **Home Manager** for reproducibility and modularity.

## Components

- **NixOS Configuration** (`configuration.nix`): The main system-level configuration for NixOS, defining packages, services, and system settings.
- **Home Manager** (`home-manager/home.nix`): Manages user-specific configurations, such as shell settings, editor preferences, and other user-level configurations.
- **Nix Flakes** (`flake.nix`): Used for version-locking, reproducibility, and modular configuration management.

## Structure

nixos-config/ ├── flake.nix # Flake configuration for system and user environment ├── configuration.nix # NixOS system configuration (system-wide) ├── home-manager/ │ ├── home.nix # Home Manager user-specific settings │ └── modules/ # Custom Home Manager modules (if any) └── modules/ # Custom NixOS modules (if any)

## Purpose

The goal of this repository is to:

- Convert my dotfiles into NixOS configurations
- Use Nix Flakes to ensure the configuration is reproducible
- Use Home Manager to handle user-level settings

This configuration will help me maintain a clean and portable setup across different systems.
