{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        section_separators = "";
        component_separators = "";
      };

      sections = {
        lualine_b = [
          "branch"
          "diagnostics"
        ];

        lualine_c = [
          "%="
          {
            __unkeyed-1 = "tabs";
            mode = 1;
            path = 1;
            symbols.modified = "";
            fmt = {
              __raw = ''
                function(name, context)
                  -- Show + if buffer is modified in tab
                  local buflist = vim.fn.tabpagebuflist(context.tabnr)
                  local winnr = vim.fn.tabpagewinnr(context.tabnr)
                  local bufnr = buflist[winnr]
                  local mod = vim.fn.getbufvar(bufnr, "&mod")
                  local bold_name = "%#LualineBoldFileName#" .. name .. "+%*"
                  if mod == 1 then
                    return bold_name
                  else
                    return name
                  end
                end
              '';
            };
          }
        ];
      };
    };
  };
}
