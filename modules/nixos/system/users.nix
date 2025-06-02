{ pkgs, ... }:
{
  # Don't forget to set a password with ‘passwd’.
  users = {
    users.max = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
