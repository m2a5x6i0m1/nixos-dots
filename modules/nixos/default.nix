{
  imports = [
    ./system/bluetooth.nix
    ./system/boot.nix
    ./system/enviroment-variables.nix
    ./system/fonts.nix
    ./system/locale.nix
    ./system/network.nix
    ./system/nix-settings.nix
    ./system/opengl.nix
    ./system/sound.nix
    ./system/timezone.nix
    ./system/users.nix

    ./programs/firefox.nix
    ./programs/greetd.nix
    ./programs/hyprland.nix
    ./programs/neovim.nix
    ./programs/shell.nix
  ];
}
