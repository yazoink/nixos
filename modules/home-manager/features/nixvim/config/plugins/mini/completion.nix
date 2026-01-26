{lib, ...}: {
  completion = {
    autoLoad = true;
    settings = {
      delay = {
        completion = 100;
        info = 100;
        signature = 50;
      };
      fallback_action = "<C-n>";
      lsp_completion = {
        auto_setup = true;
        process_items = lib.nixvim.mkRaw "nil";
        snippet_insert = lib.nixvim.mkRaw "nil";
        source_func = "completefunc";
      };
      mappings = {
        force_fallback = "<A-Space>";
        force_twostep = "<C-Space>";
        scroll_down = "<C-f>";
        scroll_up = "<C-b>";
      };
      window = {
        info = {
          border = lib.nixvim.mkRaw "nil";
          height = 25;
          width = 80;
        };
        signature = {
          border = lib.nixvim.mkRaw "nil";
          height = 25;
          width = 80;
        };
      };
    };
  };
}
