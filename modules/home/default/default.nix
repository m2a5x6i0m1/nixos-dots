{ inputs, ... }:
{
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
      ./firefox.nix
      ./git.nix
      ./lazygit.nix
      ./notes-sync.nix
      ./onlyoffice.nix
      ./theming.nix
    ];
  };
}
