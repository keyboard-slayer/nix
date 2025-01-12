{ pkgs, lib, ... }:
{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enable = true;
      indent.enable = true;
      input.enable = true;
      notifier.enable = true;
      quickfile.enable = true;
      statuscolumn.enable = true;
      words.enable = true;
      dashboard = {
        enable = true;
        sections = [
          {
            section = "terminal";
            cmd = "${lib.getExe' pkgs.chafa "chafa"} ${builtins.toString ./assets/lain.gif} --format symbols --clear";
            height = 25;
            padding = 10;
          }
          {
            pane = 2;
            section = "terminal";
            cmd = "${lib.getExe' pkgs.coreutils "cat"} ${builtins.toString ./assets/logo.cat}";
            padding = 0;
          }
          {
            pane = 2;
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
    };
  };
}
