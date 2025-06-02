{ self, inputs, ... }:
{
flake.nixosModules.asus-laptop-hardware = { config, lib, pkgs, modulesPath, ... }:
  {
    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "ehci_pci" "usbhid" "usb_storage" "sd_mod" "sr_mod" "sdhci_pci" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/8a28ff49-f41c-4fe2-9231-5009d1b29eae";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/8717-5EDF";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/7523b41a-7c3d-4c79-bfe8-a83bf6e17e59"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
