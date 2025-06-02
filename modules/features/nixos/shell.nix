{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
      environment.systemPackages = with pkgs; [
        atuin
        bat
        btop
        busybox
        curl
        eza
        fd
        fzf
        gh
        gh-dash
        gnupg
        jujutsu
        pass
        pi-coding-agent
        ripgrep
        ripgrep-all
        smassh
        starship
        stow
        tealdeer
        television
        tmux
        yazi
        zoxide
      ];
    };
}
