{ pkgs, ... }:
{
  boot = {
    # Fast systemd-boot in EFI mode
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.editor = false;

    # Kernel optimized for desktop use
    kernelPackages = pkgs.linuxPackages_zen;

    # No logs during boot at all
    kernelParams = [
      "quiet"
      "vga=current"
      "console=tty2"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = false;
    consoleLogLevel = 0;
  };
}
