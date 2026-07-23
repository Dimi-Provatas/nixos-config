{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.fish;
in
{
  options.features.cli.fish.enable = mkEnableOption "enable extended fish config";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      generateCompletions = true;

      shellAliases = {
        ":q" = "exit";
        "ls" = "eza";
        "ll" = "eza -lah";
        "cat" = "bat -p";
        "neofetch" = "hyfetch";

        "rebuild" = "sudo nixos-rebuild switch --flake .#$(hostname)";
        "update" = "sudo nixos-rebuild switch --upgrade --flake .#$(hostname)";
      };

      shellInit = ''
        set fish_greeting
        fish_vi_key_bindings
      '';

      # if [ (tty) = "/dev/tty1" ]
      #   exec niri-session
      # end
      interactiveShellInit = ''
        clear
        hyfetch
      '';
    };

    home.packages = with pkgs; [
      fishPlugins.autopair
      fishPlugins.bass
      fishPlugins.tide

      killall
    ];
  };
}
