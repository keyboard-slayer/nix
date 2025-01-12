{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      # transparent_background = true;
      flavour = "mocha";
      integrations = {
        mini.enabled = true;
        treesitter = true;
      };

      color_overrides = {
        mocha = {
          base = "#000000";
          mantle = "#000000";
          crust = "#000000";
        };
      };
    };
  };
}
