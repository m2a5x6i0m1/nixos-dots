{ self, inputs, ... }:
{
  flake.nixosModules.common = {
    # Locale
    i18n.defaultLocale = "en_US.UTF-8";

    # Time
    time.timeZone = "Europe/Moscow";

    # Network
    networking.networkmanager.enable = true;
  };
}
