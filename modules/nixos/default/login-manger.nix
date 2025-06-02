{ pkgs, ... }:
{
  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet -r -c 'uwsm start hyprland-uwsm.desktop' --asterisks";
          user = "greeter";
        };
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet -r -c 'uwsm start hyprland-uwsm.desktop' --asterisks";
          user = "greeter";
        };
      };
    };
  };
}
