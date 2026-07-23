{
  description = "TheSheepster Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
    };
    dolphin-overlay = {
      url = "github:rumboon/dolphin-overlay";
    };

    spt-linux-guide = {
      url = "github:rykugur/SPT-Linux-Guide";
    };
  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        "sheepmachine" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/sheepmachine
            {
              nixpkgs.overlays = [
                inputs.dolphin-overlay.overlays.default
                inputs.spt-linux-guide.overlays.default

                (final: prev: {
                  fwupd = prev.fwupd.overrideAttrs (oldAttrs: {
                    patches = (oldAttrs.patches or [ ]) ++ [
                      (final.fetchpatch {
                        name = "fwupd-jcat-limit-fix.patch";
                        url = "https://github.com/fwupd/fwupd/pull/10479.patch";
                        hash = "sha256-wthjHm3yjevkOCAqCgZNpyybbI3TZ+07knOdRbUQV7g=";
                      })
                    ];
                  });
                })
              ];
            }
          ];
        };
      };

      homeConfigurations = {
        "thesheepster@sheepmachine" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/thesheepster/sheepmachine.nix
          ];
        };
      };
    };
}
