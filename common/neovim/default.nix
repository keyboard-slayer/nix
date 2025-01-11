{ pkgs, ...} :
{
  imports = [
    ./oil.nix
    ./mini.nix
    ./bindings.nix
    ./lsp.nix
    ./conform.nix
  ];

  programs.nixvim = {
    enable = true;
  };

  home.packages = [
    pkgs.nixfmt-rfc-style
  ];
}
