{
  # Nvidia open drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # Fix for issues after suspend/hibernate
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
}
