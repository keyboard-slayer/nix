{
  imports = [
    ./oil.nix
    ./mini.nix
    ./bindings.nix
    ./lsp.nix
    ./conform.nix
    ./catppuccin.nix
    ./lualine.nix
    ./options.nix
    ./snacks.nix
    ./telescope.nix
    ./treesitter.nix
    ./term.nix
    ./lazydev.nix
    ./cmp.nix
    ./git-search.nix
  ];

  programs.nixvim = {
    enable = true;

    plugins.lazy = {
      enable = true;
    };
  };
}
