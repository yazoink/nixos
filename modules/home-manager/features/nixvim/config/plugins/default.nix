{
  lib,
  config,
  pkgs,
  ...
}: {
  plugins = lib.mkMerge [
    {
      ts-autotag.enable = true;
      persistence.enable = true;
      nix.enable = true;
      zig.enable = true;
      neoscroll.enable = true;
      scrollview.enable = true;
      colorizer.enable = true;
      luasnip.enable = true;
    }
    # (import ./lualine.nix {inherit config lib;})
    # (import ./bufferline.nix {inherit config lib;})
    (import ./floaterm.nix)
    (import ./gitsigns.nix)
    (import ./mini {inherit lib;})
    (import ./alpha.nix)
    (import ./neo-tree.nix)
    (import ./illuminate.nix)
    (import ./treesitter.nix)
    (import ./conform.nix {inherit pkgs;})
    (import ./cmp.nix)
    (import ./lsp.nix)
    (import ./telescope.nix)
    (import ./fidget.nix)
    # (import ./undotree.nix)
  ];
}
