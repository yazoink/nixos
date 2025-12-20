{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "substrata") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "191C25";
        base01 = "232630";
        base02 = "2E303B";
        base03 = "383A46";
        base04 = "6C6D7C";
        base05 = "B5B4C9";
        base06 = "B5B4C9";
        base07 = "B5B4C9";
        base08 = "CF8164";
        base09 = "BD8A58";
        base0A = "AB924C";
        base0B = "76A065";
        base0C = "659EA2";
        base0D = "8296B0";
        base0E = "A18DAF";
        base0F = "BC755B";
      };
    };
  };
}
