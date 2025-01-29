{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "swamp") {
    desktopTheme.base16Accent = "base0A";

    stylix = {
      base16Scheme = {
        base00 = "242015";
        base01 = "312D20";
        base02 = "3F3A2B";
        base03 = "4C4636";
        base04 = "8E866E";
        base05 = "EBE0BB";
        base06 = "EBE0BB";
        base07 = "EBE0BB";
        base08 = "96294D";
        base09 = "C1666B";
        base0A = "DB930D";
        base0B = "7A7653";
        base0C = "508991";
        base0D = "91506C";
        base0E = "C1666B";
        base0F = "96294D";
      };
    };
  };
}
