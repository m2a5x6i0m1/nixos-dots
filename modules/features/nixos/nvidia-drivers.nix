{ self, inputs, ... }:
{
  flake.nixosModules.nvidia-drivers = {
    # Nvidia open drivers
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;

    # Fix for with suspend/hibernate
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.powerManagement.enable = true;
  };
}
