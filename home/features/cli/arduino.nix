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
  options.features.cli.arduino.enable = mkEnableOption "enable arduino programming capabilities";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      arduino-cli
      arduino-ide
      arduino-language-server
      espflash
      pkg-config
      udev
    ];
  };
}
