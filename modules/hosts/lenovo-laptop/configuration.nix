{ self, inputs, ... }:
{
  flake.nixosConfigurations.lenovo-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      lenovo-laptop-hardware
      lenovo-laptop-specific

      ## TODO: Create this host when I'll have it on my hands
    ];
  };

  flake.nixosModules.lenovo-laptop-specific = {
    system.stateVersion = "25.05";
    networking.hostName = "lenovo-laptop";
  };
}
