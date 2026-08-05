{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default

    ./fish.nix
    ./neofetch.nix
    ./arduino.nix
  ];

  home.file = import ./config;

  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      extraOptions = [
        "--icons"
        "-h"
      ];
    };

    bat = {
      enable = true;
    };

    lazyvim = import ./lazyvim.nix { inherit pkgs; };

    btop = {
      enable = true;
    };
  };

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    btop
    cmake
    coreutils
    curl
    fd
    gcc
    gdb
    git
    gnumake
    htop
    inetutils
    jq
    lazygit
    mlocate
    netcat
    pciutils
    python3
    ripgrep
    rustup
    tealdeer
    tmux
    unzip
    usbutils
    wget
    zip
  ];
}
