{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    let
      pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      pkgs-hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      # Cachix as a cache for latest hyprland
      nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        trusted-users = [ "root" "@wheel" ];
      };

      # Wayland compositor of my choice
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      programs.hyprland = {
        enable = true;
        package = pkgs-hyprland.hyprland;
        portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
      };

      hardware.graphics = {
        package = pkgs-unstable.mesa;
        package32 = pkgs-unstable.pkgsi686Linux.mesa;
        enable32Bit = true;
      };

      # UWSM for robust Wayland session management
      programs.uwsm.enable = true;
      programs.hyprland.withUWSM = true;

      # Packages
      environment.systemPackages = with pkgs; [
        # Utilities For Wayland
        awww
        brightnessctl
        cliphist
        swaynotificationcenter
        waypaper
        wev
        wl-clip-persist
        wl-clipboard
        wofi

        # Hyprland Ecosystem Utilities
        hyprpolkitagent
        hyprshot
        hyprsunset

        # Desktop apps
        ghostty
        localsend
        obsidian
        pwvucontrol

        # Let's pretend it's not here
        quickshell
      ];
    };
}
