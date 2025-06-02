{ self, inputs, ... }:
{
  flake.nixosConfigurations.asus-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      asus-laptop-hardware
      asus-laptop-specific
      bluetooth
      boot
      common
      envs
      firefox
      fonts
      greetd
      home-manager-max
      hyprland
      neovim
      nh
      nix-settings
      pipewire
      shell
      users-max
    ];
  };

  flake.nixosModules.asus-laptop-specific = {
    system.stateVersion = "25.05";
    networking.hostName = "asus-laptop";
    systemd.tpm2.enable = false;
    boot.initrd.systemd.tpm2.enable = false;
  };
}
