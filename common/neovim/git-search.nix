{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "git-search.nvim";
        doCheck = false;
        src = pkgs.fetchFromGitHub {
          owner = "keyboard-slayer";
          repo = "git-search.nvim";
          rev = "81cdf077577232bf1186a22300675e95824c0cea";
          sha256 = "qelHILy+w6xDeG/E+bWrV0UKEob1b9NCi9YayLuNNEQ=";
        };
      })
    ];
    extraConfigLua = ''
      require("git-search").setup({
        eu = true,
        show_langage = true,
        show_dates = true,
        max_commits = 50,
      })
    '';
  };
}
