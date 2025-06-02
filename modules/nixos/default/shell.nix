{ pkgs, ... }:
{
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    busybox
    curl
    eza
    fd
    fzf
    ripgrep
    smassh
    starship
    stow
    yazi
    zoxide
  ];
}
