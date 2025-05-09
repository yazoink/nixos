{
  cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      experimental = {ghost_text = true;};
      performance = {
        debounce = 60;
        fetchingTimeout = 200;
        maxViewEntries = 30;
      };
      snippet = {expand = "luasnip";};
      formatting = {fields = ["kind" "abbr" "menu"];};
      sources = [
        {name = "nvim_lsp";}
        #{ name = "emoji"; }
        {
          name = "buffer"; # text within current buffer
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keywordLength = 3;
        }
        {
          name = "path"; # file system paths
          keywordLength = 3;
        }
        {
          name = "luasnip"; # snippets
          keywordLength = 3;
        }
      ];

      window = {
        completion = {border = "solid";};
        documentation = {border = "solid";};
      };

      mapping = {
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-Down>" = "cmp.mapping.select_next_item()";
        "<C-Up>" = "cmp.mapping.select_prev_item()";
        "<C-e>" = "cmp.mapping.abort()";
        #"<C-b>" = "cmp.mapping.scroll_docs(-4)";
        #"<C-f>" = "cmp.mapping.scroll_docs(4)";
        # "<C-Space>" = "cmp.mapping.complete()";
        "<C-Space>" = "cmp.mapping.confirm({ select = true })";
        # "<Tab>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
      };
    };
  };

  cmp-nvim-lsp = {
    enable = true; # LSP
  };
  cmp-buffer = {
    enable = true;
  };
  cmp-path = {
    enable = true; # file system paths
  };
  cmp_luasnip = {
    enable = true; # snippets
  };
}
