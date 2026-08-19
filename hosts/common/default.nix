{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ./users

    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    backupFileExtension = "bckp";
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  environment.systemPackages = with pkgs; [
    curl
    git
    localsend
    neovim
    wget
  ];

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        trusted-users = [
          "root"
          "thesheepster"
        ];
      };

      gc = {
        automatic = true;
        options = "--delete-older-than 30d";
      };

      optimise.automatic = true;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = [
        "/etc/nix/path"
      ]
      ++ lib.mapAttrsToList (flakeName: _: "${flakeName}=flake:${flakeName}") flakeInputs;
    };

  programs = {
    fish.enable = true;
    niri.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  users.defaultUserShell = pkgs.fish;

  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };

    rtkit = {
      enable = true;
    };
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    dbus.enable = true;
    fwupd.enable = true;

    displayManager = {
      enable = true;
      # NOTE: https://github.com/NixOS/nixpkgs/blob/8c91a71d13451abc40eb9dae8910f972f979852f/nixos/modules/services/display-managers/ly.nix#L45
      sessionData.desktops."share/wayland-sessions" = "${pkgs.niri}/share/wayland-sessions/niri.desktop";

      ly = {
        enable = true;
        x11Support = false;
      };
      defaultSession = "niri";
    };
  };
}
