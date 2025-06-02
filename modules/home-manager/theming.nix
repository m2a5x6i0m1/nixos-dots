{ pkgs, ... }:
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
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
