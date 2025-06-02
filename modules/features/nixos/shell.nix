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
        ffmpeg
        fzf
        gh
        gh-dash
        gnupg
        jq
        jujutsu
        pass
        pi-coding-agent
        ripgrep
        ripgrep-all
        sesh
        smassh
        starship
        stow
        tealdeer
        television
        timewarrior
        tmux
        yazi
        yq-go
        zoxide
      ];
    };
}
