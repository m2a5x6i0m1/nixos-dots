{ self, inputs, ... }:
{
  flake.nixosConfigurations.asus-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asus-laptop-specific
      self.nixosModules.asus-laptop-hardware

      self.nixosModules.base-features
      self.nixosModules.desktop-features

      self.nixosModules.firefox
      self.nixosModules.greetd
      self.nixosModules.hyprland
      self.nixosModules.neovim

      self.nixosModules.users-max
      self.nixosModules.home-manager
    ];
  };

  flake.nixosModules.asus-laptop-specific = {
    system.stateVersion = "25.05";
    networking.hostName = "asus-laptop";
    systemd.tpm2.enable = false;
  };
}
