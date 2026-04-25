{ self, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  flake.homeModules.theme =
    { pkgs, config, ... }:
    {
      gtk = {
        enable = true;
        colorScheme = "dark";
        theme.name = "catppuccin-mocha-lavender-standard";
        theme.package = pkgs.catppuccin-gtk.override {
          accents = [ "lavender" ];
          size = "standard";
          variant = "mocha";
        };
        gtk4.theme = config.gtk.theme;
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
      };
    };
}
