{
  system.stateVersion = "25.05";
  networking.hostName = "asus-laptop";
  systemd.tpm2.enable = false;
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];
}
