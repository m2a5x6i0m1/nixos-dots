{ self, inputs, ... }:
{
  flake.nixosModules.base-features =
    { pkgs, ... }:
    {
      boot = {
        # Fast systemd-boot in EFI mode
        loader.efi.canTouchEfiVariables = true;
        loader.systemd-boot.enable = true;
        loader.systemd-boot.editor = false;

        # Kernel optimized for desktop use
        kernelPackages = pkgs.linuxPackages_zen;

        # No logs except for kernel panic and systemd status messages
        kernelParams = [
          "vga=current"
          "rd.systemd.show_status=true"
          "rd.udev.log_level=3"
          "udev.log_priority=3"
        ];
        initrd.verbose = true;
        consoleLogLevel = 0;
      };

      # Locale
      i18n.defaultLocale = "en_US.UTF-8";

      # Time
      time.timeZone = "Europe/Moscow";

      # Network
      networking.networkmanager.enable = true;

      # Nix settings
      nixpkgs.config.allowUnfree = true;
      nix.settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      # Shell
      programs.zsh.enable = true;
      environment.systemPackages = with pkgs; [
        busybox
        curl
        eza
        fd
        fzf
        ripgrep
        smassh
        starship
        stow
        yazi
        zoxide
      ];
    };
}
