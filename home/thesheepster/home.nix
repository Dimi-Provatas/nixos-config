{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      lfs.enable = true;

      signing.signByDefault = true;

      settings = {
        user = {
          name = "Dimi Provatas";
          email = "james.provatas@gmail.com";
        };

        init.defaultBranch = "master";
        gpg.format = "ssh";
      };
    };
  };

  home = {
    username = lib.mkDefault "thesheepster";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "26.05";

    packages = with pkgs; [
      alsa-utils
      audacity
      chromium
      discord
      dotnetCorePackages.dotnet_8.runtime
      dotnetCorePackages.dotnet_8.sdk
      easyeffects
      firefox
      lmms
      lutris
      mono
      muse-sounds-manager
      musescore
      rar
      solaar
      tor
      tor-browser
      unityhub
    ];

    file = { };
  };
}
