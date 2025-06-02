{ self, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
        user.name = "m2a5x6i0m1";
        user.email = "personal.maxim.yanchenko@gmail.com";
      };
    };

    programs.lazygit = {
      enable = true;
      settings = {
        gui.showIcons = false;
        gui.theme = {
          lightTheme = false;
          activeBorderColor = [ "#fab387" ];
          inactiveBorderColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#45475a" ];
        };
      };
    };
  };
}
