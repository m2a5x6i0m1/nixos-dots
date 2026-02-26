{
  system.stateVersion = "25.05";
  networking.hostName = "lenovo-laptop";
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];
}
