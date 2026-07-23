{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.neofetch;
in
{
  options.features.cli.neofetch.enable = mkEnableOption "enable neofetch";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fastfetch
    ];

    programs.hyfetch = {
      enable = true;

      settings = {
        preset = "nonbinary";
        mode = "rgb";
        auto_detect_light_dark = true;
        light_dark = "dark";
        lightness = 0.65;
        color_align = {
          mode = "horizontal";
        };
        backend = "fastfetch";
        distro = "nixos";
        pride_month_disable = false;
      };
    };
  };
}
