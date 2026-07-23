{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_7_2;

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [
        "amdgpu"
      ];
    };

    kernelModules = [
      "kvm-amd"
      "lenovo-legion-module"
    ];

    extraModulePackages = with config.boot.kernelPackages; [ lenovo-legion-module ];

    kernelPatches = [
      {
        name = "amdgpu-ignore-ctx-privileges";
        patch = pkgs.fetchpatch {
          name = "cap_sys_nice_begone.patch";
          url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
          hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
        };
      }
    ];

    kernelParams = [
      "radeon.cik_support=0"
      "amdgpu.cik_support=1"
      "preempt=full" # Soft RT latency
      "threadirqs" # Soft RT latency
    ];

    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/24311f50-ba94-4616-b19e-7521f17c3f1d";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/06A6-19E8";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/home/thesheepster/nvme" = {
      device = "/dev/disk/by-uuid/97910ccb-86ba-4228-8ed4-9d79ef62e26f";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
        "users"
        "rw"
        "exec"
      ];
    };
  };

  networking = {
    hostName = "sheepmachine";
    wireless.enable = true;
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    interfaces.eno1.useDHCP = lib.mkDefault true;
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/c151735e-0a75-4876-9f5c-654e2a4d7e27"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    bluetooth.enable = true;
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
    steam-hardware.enable = true;

    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
