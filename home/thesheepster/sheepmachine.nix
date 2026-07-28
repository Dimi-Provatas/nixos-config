{
  pkgs,
  ...
}:
{
  imports = [
    ../common
    ../features/cli
    ../features/desktop

    ./dotfiles
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      neofetch.enable = true;
      arduino.enable = true;
    };

    desktop = {
      fonts.enable = true;
      niri.enable = true;
      vscode.enable = true;
    };
  };

  programs = {
    niri.settings = {
      window-rules = [
        {
          matches = [
            {
              app-id = "solaar";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "discord";
              at-startup = true;
            }
          ];
          open-maximized = true;
          open-on-output = "eDP-1";
        }
        {
          matches = [
            {
              app-id = "firefox";
              at-startup = true;
            }
          ];
          open-on-output = "Philips Consumer Electronics Company 49M2C8900 AU42425001402";
          open-on-workspace = "2";
        }
        {
          matches = [
            {
              app-id = "steam";
              at-startup = true;
            }
          ];
          open-on-output = "Philips Consumer Electronics Company 49M2C8900 AU42425001402";
          open-on-workspace = "4";
        }
      ];

      spawn-at-startup = [
        {
          command = [
            "solaar"
            "--window=hide"
          ];
        }
        { command = [ "discord" ]; }
        { command = [ "firefox" ]; }
        { command = [ "steam" ]; }
      ];
    };

    git.signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK2RizeXuD65in8fXxqCcVlc2u6Ekk5pnJzxCm3ba5HO james.provatas@gmail.com";
  };

  home = {
    packages = with pkgs; [
      amdgpu_top
    ];

    file = {
      # ".config/nixpkgs/config.nix".text = "{ allowUnfree = true; }";
    };
  };
}
