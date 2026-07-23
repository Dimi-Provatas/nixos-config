# NixOS Configuration

NixOS configuration, using [flakes](https://nixos.wiki/wiki/flakes) and [Home Manager](https://nix-community.github.io/home-manager/).

## New host

1. Download the project
1. `mkdir ./hosts/<new host>`
1. `touch ./hosts/<new host>/default.nix`
1. `cp /etc/nixos/hardware-configuration.nix ./hosts/<new host>/hardware-configuration.nix`
1. Enable features, add specific packages and configurations
  -  Don't forget to import the hardware config
1. Append the `<new host>` in `./flake.nix`, both in `nixosConfigurations` and `homeConfigurations`
1. Rebuild -> Reboot -> Profit

## Usage

```sh
# Rebuild
sudo nixos-rebuild switch --flake .#$(hostname)
# or
rebuild # alias in fish

# Update
sudo nixos-rebuild switch --upgrade --flake .#$(hostname)
# or
update # alias in fish
```

## Overview

```
nix-config
├── ❄️ flake.nix                          # Top level flake
├── 📂 home                               # Directory of all home configurations
│   ├── 📂 common                         # Configurations shared across all features and user
│   ├── 📂 features                       # Major configuration groups
│   │   ├── 📂 cli                        # Tools for terminals and TTY
│   │   └── 📂 desktop                    # Desktop environments and GUI tools
│   └── 📂 <username>                     # Per-user home configurations
│       ├── 📂 dotfiles                   # User-specific dotfiles (usually in .config)
│       ├── ❄️ home.nix                   # User-specific definitions that follow the user reguardless of host
│       └── ❄️ <hostname>.nix             # User-specific definitions for a specific host
├── 🖥️ hosts                              # Per-host configurations
│   ├── 📂 common                         # Configurations shared across all hosts
│   │   ├── ❄️ default.nix                # Configurations shared across users
│   │   └── 👤 users                      # Per-user configurations shared across all hosts
│   │       └── ❄️ <username>.nix         # User-specific configurations
│   └── 📂 <hostname>                     # Per-host configurations
│       ├── ❄️ configuration.nix          # Features, services and general configurations (similar to the auto-generated `configuraion.nix`)
│       ├── ❄️ default.nix                # Module declaration
│       └── ❄️ hardware-configuration.nix # Hardware, kernel and driver based configurations (similar to the auto-generated `hardware-configuration.nix`)
├── ⚙️ modules                            # Custom modules used across the configuration
│   └── 📂 home-manager                   # Home manager specific modules
├── 📚 overlays                           # Custom package overlays
└── 📚 pkgs                               # Special package configurations, custom flakes, etc
```

