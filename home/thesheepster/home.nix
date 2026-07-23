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

      signing.signByDefault = true;

      settings = {
        user = {
          name = "Dimi Provatas";
          email = "james.provatas@gmail.com";
        };

        init.defaultBranch = "master";
        lfs.enable = true;
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
      easyeffects
      firefox
      lmms
      lutris
      musescore
      solaar
    ];

    file = { };
  };
}
