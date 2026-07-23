{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.features.desktop.vscode;
in
{
  options.features.desktop.vscode.enable = mkEnableOption "vscode configuration";

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      profiles.default.extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
      ];
    };
  };
}
