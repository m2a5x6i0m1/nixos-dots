{ pkgs, ... }:
{
  # Wayland compositor of my choice
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # UWSM for robust Wayland session management
  programs.uwsm.enable = true;
  programs.hyprland.withUWSM = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # Utilities For Wayland
    brightnessctl
    cliphist
    swaybg
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
    obsidian
    pwvucontrol
    telegram-desktop
    zathura

    # Let's pretend it's not here
    quickshell
  ];
}
