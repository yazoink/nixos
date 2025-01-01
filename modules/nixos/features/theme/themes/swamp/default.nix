{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "swamp") {
    desktopTheme.base16Accent = "base0B";

    stylix = {
      base16Scheme = {
        base00 = "242015";
        base01 = "3D3327";
        base02 = "554539";
        base03 = "6D584B";
        base04 = "856A5D";
        base05 = "EBE0BB";
        base06 = "EBE0BB";
        base07 = "EBE0BB";
        base08 = "96294D";
        base09 = "B95E2D";
        base0A = "DB930D";
        base0B = "7A7653";
        base0C = "508991";
        base0D = "716D7F";
        base0E = "91506C";
        base0F = "A8443D";
      };
    };
  };
}
