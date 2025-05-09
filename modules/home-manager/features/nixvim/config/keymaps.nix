{
  lib,
  config,
  ...
}: let
  inherit (config.programs.nixvim.plugins) neo-tree bufferline telescope undotree;
in {
  globals.mapleader = ",";
  keymaps = lib.mkMerge [
    [
      {
        mode = "n";
        key = "<esc>";
        action = "<Cmd>noh<CR>";
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
    ]
    (lib.mkIf neo-tree.enable [
      {
        action = "<Cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }
    ])
    (lib.mkIf bufferline.enable [
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>br";
        action = "<cmd>BufferLineCloseRight<cr>";
        options = {
          desc = "Delete buffers to the right";
        };
      }

      {
        mode = "n";
        key = "<leader>bl";
        action = "<cmd>BufferLineCloseLeft<cr>";
        options = {
          desc = "Delete buffers to the left";
        };
      }

      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "Delete other buffers";
        };
      }

      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLineTogglePin<cr>";
        options = {
          desc = "Toggle pin";
        };
      }

      {
        mode = "n";
        key = "<leader>bP";
        action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
        options = {
          desc = "Delete non-pinned buffers";
        };
      }
    ])
    (lib.mkIf (bufferline.enable == false) [
      {
        key = "<Tab>";
        action = "<Cmd>BufferNext<CR>";
      }
      {
        key = "<S-Tab>";
        action = "<cmd>BufferLast<CR>";
      }
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
    ])
    (lib.mkIf telescope.enable [
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
    ])
    (lib.mkIf undotree.enable [
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          desc = "Undotree";
        };
      }
    ])
  ];
}
