{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.lazydev-nvim ];
    extraConfigLua = ''
      require('lazydev').setup({
        library = {
          {
            path = 'luvit-meta/library',
            words = {'vim%.uv'}
          }
        }
      })
    '';
  };
}
