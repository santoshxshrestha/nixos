# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/sddm/sddm.nix
    ./modules/packages.nix

  ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
      consoleMode = "auto";
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    timeout = 5;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.santosh = {
    isNormalUser = true;
    description = "Santosh Shrestha";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  hardware.graphics.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.dbus.enable = true;

  security.polkit.enable = true;

  # remap 
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = { capslock = "overload(control, esc)"; };
        # Optional: adjust timing (default is usually fine)
        global = {
          overload_tap_timeout = "200"; # milliseconds
        };
      };
    };
  };

  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.command-not-found.enable = true;
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [ clang-tools ];

  # enabling the stylix
  stylix.enable = true;
  stylix.image = ./home-manager/assets/nixos.png;
  stylix.polarity = "dark";

  #i18n.inputMethod.enable = "fcitx5";
  #i18n.inputMethod.fcitx5.addons= with pkgs;
  #[fcitx5-mozc];

  #services.logind = {
  #enable = true;
  #lidSwitch = "ignore";
  #lidSwitchDocked = "ignore";
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
