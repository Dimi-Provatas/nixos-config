{
  description = "TheSheepster Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
      nixpkgs-unstable,
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
