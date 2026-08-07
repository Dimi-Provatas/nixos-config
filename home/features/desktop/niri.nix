{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.niri;
in
{
  options.features.desktop.niri.enable = mkEnableOption "niri extra tools and config";

  imports = [
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
  ];

  config = mkIf cfg.enable {
    programs.noctalia-shell = import ./noctalia.nix;
    # HACK: Files exported from running the apps
    #       Too lazy to make those into nix files
    home.file = { } // (import ./config { inherit pkgs; });

    # programs.alacritty = import ./alacritty.nix;
    programs.wezterm = import ./wezterm.nix { inherit lib; };

    programs.niri = {
      enable = true;

      settings = {
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          { command = [ "noctalia-shell" ]; }
        ];

        window-rules = [
          {
            matches = [
              {
                title = "pulsemixer";
                app-id = "org.wezfurlong.wezterm";
              }
            ];
            open-floating = true;
            default-column-width = {
              fixed = 256;
            };
            default-window-height = {
              fixed = 128;
            };
            default-floating-position = {
              x = 4;
              y = 4;
              relative-to = "top-right";
            };
          }
        ];

        clipboard = {
          disable-primary = true;
        };

        input = {
          keyboard = {
            xkb = {
              layout = "us,de,gr";
            };

            numlock = true;
            track-layout = "window";
          };

          mouse = {
            accel-speed = 0.25;
            accel-profile = "flat";
          };

          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "5%";
          };
        };

        gestures = {
          hot-corners.enable = false;
        };

        overview = {
          backdrop-color = "#000000";
        };

        outputs = {
          "eDP-1" = {
            mode.width = 1920;
            mode.height = 1080;
            mode.refresh = 165.010;
            scale = 1.0;
            position.x = 0;
            position.y = 0;
            variable-refresh-rate = true;
          };

          "Philips Consumer Electronics Company 49M2C8900 AU42425001402" = {
            mode.width = 3840;
            mode.height = 1080;
            mode.refresh = 120.000;
            scale = 1.0;
            position.x = 1920;
            position.y = 0;
            variable-refresh-rate = true;
          };
        };

        layout = {
          gaps = 2;
          focus-ring = {
            enable = true;
            width = 1;
            active.color = "#8a2be2ff";
            inactive.color = "#2d1040";
          };
          background-color = "#000000";

          always-center-single-column = false;

          default-column-width = {
            proportion = 2. / 4.;
          };
          preset-column-widths = [
            { proportion = 1. / 4.; }
            { proportion = 1. / 3.; }
            { proportion = 1. / 2.; }
            { proportion = 2. / 3.; }
            { proportion = 3. / 4.; }
          ];
        };

        binds = import ./niri_binds.nix;
      };
    };

    xdg = import ./xdg.nix { inherit config lib; };

    home.sessionVariables = {
      DBUS_SESSION_BUS_ADDRESS = "unix:path=$XDG_RUNTIME_DIR/bus";
      DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
      GTK_THEME = "Adwaita:dark";
      LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.pipewire ]}:$LD_LIBRARY_PATH";
      NIXOS_OZONE_WL = "1";
      QT_MULTIMEDIA_PREFERRED_PLUGINS = "pipewire";
      QT_PLUGIN_PATH = "${pkgs.qt6Packages.qt6ct}/lib/qt-6/plugins";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "";
      TERM = "xterm-256color";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_DATA_DIRS = lib.concatStringsSep ":" [
        "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
        "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
        "${config.home.profileDirectory}/share"
        "${pkgs.kdePackages.kservice}/share"
        "${pkgs.kdePackages.kconfig}/share"
        "/etc/profiles/per-user/${config.home.username}/share"
        "/run/current-system/sw/share"
        "/usr/local/share"
        "/usr/share"
      ];
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "niri";
    };

    home.pointerCursor = {
      enable = true;
      name = "breeze_cursors";
      size = 10;
      package = pkgs.kdePackages.breeze;
      gtk.enable = true;
      x11.enable = false;
    };

    home.packages =
      with pkgs;
      [
        alacritty
        appimage-run
        blender
        gimp
        gnome-boxes
        grim
        libdeflate
        okteta
        onlyoffice-desktopeditors
        pulsemixer
        shared-mime-info
        slurp
        thunderbird
        vlc
        wdisplays
        wezterm
        wl-clipboard
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-utils
        xwayland-satellite
      ]
      ++ (with kdePackages; [
        ark
        breeze
        breeze-icons
        dolphin
        dolphin-plugins
        filelight
        gwenview
        kate
        kcalc
        kconfig
        kdeclarative
        kdegraphics-thumbnailers
        kdf
        kiconthemes
        kio
        kio-admin
        kio-extras
        kio-fuse
        kservice
        okular
        partitionmanager
        phonon
        plasma-integration
        qt6ct
        qtmultimedia
        qtsvg
        qtwayland
      ]);
  };
}
