{
  config,
  pkgs,
  inputs,
  ...
}:
{
  users.users."thesheepster" = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$I/M20OmRYebQH4dObfKUU/$Qt0EgemRWUSjr/cE8LEdrrfv7zep7Q6PYbevHQfTK6B";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
      "wireshark"
      "dialout"
    ];

    packages = [
      inputs.home-manager.packages.${pkgs.system}.default
    ];
  };

  home-manager.users."thesheepster" =
    import ../../../home/thesheepster/${config.networking.hostName}.nix;
}
