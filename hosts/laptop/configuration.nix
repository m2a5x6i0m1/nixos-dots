{
  system.stateVersion = "25.05";
  networking.hostName = "laptop";
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];
}
