{ self, inputs, ... }:
{
  flake.nixosModules.desktop-features =
    { pkgs, ... }:
    {
      # Bluetooth
      services.blueman.enable = true;
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      # Environment Variables
      environment.sessionVariables = rec {
        TERMINAL = "ghostty";
        EDITOR = "nvim";
        MANPAGER = "nvim +Man!";
        XDG_BIN_HOME = "$HOME/.local/bin";
        PATH = [ "${XDG_BIN_HOME}" ];
      };

      # Fonts
      fonts.fontDir.enable = true;
      fonts.packages = with pkgs; [
        nerd-fonts.code-new-roman
        nerd-fonts.jetbrains-mono
      ];

      # Pipewire
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
}
