{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  environment.systemPackages = with pkgs; [
    sbctl # Secure boot keys management tool
  ];

  # Enable Lanzaboote
  boot.lanzaboote.enable = true;
  boot.lanzaboote.pkiBundle = "/var/lib/sbctl";

  # Force replace of systemd-boot by Lanzaboote
  boot.loader.systemd-boot.enable = lib.mkForce false;
}
