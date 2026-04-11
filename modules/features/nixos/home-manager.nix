{ self, inputs, ... }:
{
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "bak";

    home-manager.users."max" = {
      home = {
        username = "max";
        homeDirectory = "/home/max";
        stateVersion = "25.05";
      };

      imports = [
        self.homeModules.git
        self.homeModules.notes-sync
        self.homeModules.firefox
        self.homeModules.onlyoffice
        self.homeModules.theme
      ];
    };
  };
}
