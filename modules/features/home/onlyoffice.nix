{ self, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  flake.homeModules.onlyoffice = {
    programs.onlyoffice = {
      enable = true;
      settings = {
        UITheme = "theme-dark";
        editorWindowMode = false;
        maximized = true;
      };
    };
  };
}
