{ self, inputs, ... }:
{
  flake.nixosModules.nh = {
    programs.nh.enable = true;
    programs.nh.flake = "/home/max/nixos-dots";
  };
}
