{ self, inputs, ... }:
{
  flake.nixosConfigurations.lenovo-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.lenovo-laptop-specific
      self.nixosModules.lenovo-laptop-hardware

      ## TODO: Create this host when I'll have it on my hands
    ];
  };

  flake.nixosModules.lenovo-laptop-specific = {
    system.stateVersion = "25.05";
    networking.hostName = "lenovo-laptop";
  };
}
