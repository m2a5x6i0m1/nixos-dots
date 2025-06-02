{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    clang-tools
    clang

    kdePackages.qtdeclarative
    bash-language-server
    lua-language-server
    harper
    nixd

    nixfmt
    prettierd
    stylua
  ];
}
