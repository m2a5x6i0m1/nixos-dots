{ self, inputs, ... }:
{
  flake.nixosConfigurations.asus-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asus-laptop-specific
      self.nixosModules.asus-laptop-hardware

      self.nixosModules.boot
      self.nixosModules.nix-settings
      self.nixosModules.shell
      self.nixosModules.common

      self.nixosModules.firefox
      self.nixosModules.neovim
      self.nixosModules.hyprland
      self.nixosModules.greetd

      self.nixosModules.pipewire
      self.nixosModules.bluetooth
      self.nixosModules.envs
      self.nixosModules.fonts

      self.nixosModules.users-max
      self.nixosModules.home-manager-max
    ];
  };

  flake.nixosModules.asus-laptop-specific = {
    system.stateVersion = "25.05";
    networking.hostName = "asus-laptop";
    systemd.tpm2.enable = false;
    boot.initrd.systemd.tpm2.enable = false;
  };
}
