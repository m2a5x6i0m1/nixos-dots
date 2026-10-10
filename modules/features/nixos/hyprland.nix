{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    let
      nixpkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      # Wayland compositor of my choice
      programs.hyprland = {
        enable = true;
        package = nixpkgs-unstable.hyprland;
        portalPackage = nixpkgs-unstable.xdg-desktop-portal-hyprland;
      };

      programs.hyprlock.enable = true;
      services.hypridle.enable = true;

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
