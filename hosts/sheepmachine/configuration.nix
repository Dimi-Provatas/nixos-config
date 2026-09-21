{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    drm_info
    lenovo-legion
    libdisplay-info
    logiops
    pkg-config
    wayvr

    spt-additions
    spt-server
    spt-launcher
  ];

  programs = {
    # NOTE: for SteamVR to properly work, run the following (https://bbs.archlinux.org/viewtopic.php?id=290998)
    #       $ sudo setcap CAP_SYS_NICE=eip ~/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrcompositor-launcher
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode = {
      enable = true;
    };

    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    nix-ld.enable = true;
  };

  system.stateVersion = "26.05";

  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    fstrim.enable = true;
    lact.enable = true;
    tailscale.enable = true;

    udev.packages = with pkgs; [ via ];

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 44100;
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 256;
        };
      };
    };
  };
}
