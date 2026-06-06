{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
      environment.systemPackages = with pkgs; [
        bat
        btop
        busybox
        curl
        eza
        fd
        fzf
        lazydocker
        ripgrep
        smassh
        starship
        stow
        television
        tmux
        yazi
        zellij
        zoxide
      ];
    };
}
