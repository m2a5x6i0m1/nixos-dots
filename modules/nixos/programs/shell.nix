{ pkgs, ... }:
{
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    busybox
    curl
    eza
    fd
    fzf
    nix-search-tv
    pastel
    ripgrep
    smassh
    starship
    stow
    tealdeer
    yazi
    zoxide
  ];
}
