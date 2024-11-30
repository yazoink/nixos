{config, lib, ...}:
{
  config = lib.mkIf config.bundles.base.nixvim.enable {
    stylix.targets.nixvim.enable = false;

    programs.nixvim = {
      colorschemes.base16 = {
        enable = true;
        colorscheme = {
          base00 = "#${config.stylix.base16Scheme.base00}";
          base01 = "#${config.stylix.base16Scheme.base01}";
          base02 = "#${config.stylix.base16Scheme.base02}";
          base03 = "#${config.stylix.base16Scheme.base03}";
          base04 = "#${config.stylix.base16Scheme.base04}";
          base05 = "#${config.stylix.base16Scheme.base05}";
          base06 = "#${config.stylix.base16Scheme.base06}";
          base07 = "#${config.stylix.base16Scheme.base07}";
          base08 = "#${config.stylix.base16Scheme.base08}";
          base09 = "#${config.stylix.base16Scheme.base09}";
          base0A = "#${config.stylix.base16Scheme.base0A}";
          base0B = "#${config.stylix.base16Scheme.base0B}";
          base0C = "#${config.stylix.base16Scheme.base0C}";
          base0D = "#${config.stylix.base16Scheme.base0D}";
          base0E = "#${config.stylix.base16Scheme.base0E}";
          base0F = "#${config.stylix.base16Scheme.base0F}";
        };
      };
    };
  };
}
