{ pkgs, ... }:
{
  boot = {
    # Fast systemd-boot in EFI mode
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    loader.systemd-boot.editor = false;

    # Kernel optimized for desktop use
    kernelPackages = pkgs.linuxPackages_zen;

    # No logs during boot at all
    kernelParams = [
      "vga=current"
      "rd.systemd.show_status=true"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = true;
    consoleLogLevel = 0;
  };
}
