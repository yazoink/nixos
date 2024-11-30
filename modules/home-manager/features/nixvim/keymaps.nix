{config, lib, ...}:
{
  config = lib.mkIf config.bundles.base.nixvim.enable {
    programs.nixvim = {
      globals.mapleader = ",";

      keymaps = [
        {
          mode = "n";
          key = "<leader>u";
          action = "<cmd>UndotreeToggle<CR>";
          options = {
            desc = "Undotree";
          };
        }

        {
          action = "<Cmd>Neotree toggle<CR>";
          key = "<leader>e";
        }
        /*{
          key = "<Tab>";
          action = "<Cmd>BufferNext<CR>";
        }
        {
          key = "<S-Tab>";
          action = "<cmd>BufferLast<CR>";
        }*/
        {
          key = "<Tab>";
          action = "<Cmd>tabNext<CR>";
        }
        {
          key = "<S-Tab>";
          action = "<cmd>tabLast<CR>";
        }
        {
          mode = "n";
          key = "<esc>";
          action = "<Cmd>noh<CR>";
        }
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>fw";
        }
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
        }
        {
          action = "<cmd>Telescope git_commits<CR>";
          key = "<leader>fg";
        }
        {
          action = "<cmd>Telescope oldfiles<CR>";
          key = "<leader>fh";
        }
        {
          action = "<cmd>Telescope colorscheme<CR>";
          key = "<leader>ch";
        }
        {
          action = "<cmd>Telescope man_pages<CR>";
          key = "<leader>fm";
        }
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w><C-h>";
          options = {
            desc = "Move focus to the left window";
          };
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w><C-l>";
          options = {
            desc = "Move focus to the right window";
          };
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w><C-j>";
          options = {
            desc = "Move focus to the lower window";
          };
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w><C-k>";
          options = {
            desc = "Move focus to the upper window";
          };
        }
        {
          mode = "n";
          key = "<C-t>";
          action = "<cmd>tabnew<cr>";
          options = {desc = "New Tab";};
        }
        {
          mode = "n";
          key = "<C-w>";
          action = "<cmd>tabclose<cr>";
          options = {desc = "Next Tab";};
        }
      ];
    };
  };
}
