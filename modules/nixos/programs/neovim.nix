{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # Set's of tools
    clang-tools
    kdePackages.qtdeclarative

    # LSPs
    bash-language-server
    lua-language-server
    rust-analyzer
    harper
    nixd

    # Formatters
    nixfmt-rfc-style
    prettierd
    stylua

    # Compilers & Interpreters
    clang
    rustup
  ];
}
