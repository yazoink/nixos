{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "atelier-savanna") {
    desktopTheme.base16Accent = "base0F";

    stylix = {
      base16Scheme = {
        base00 = "171C19";
        base01 = "232A25";
        base02 = "526057";
        base03 = "5F6D64";
        base04 = "78877D";
        base05 = "DFE7E2";
        base06 = "DFE7E2";
        base07 = "ECF4EE";
        base08 = "B16139";
        base09 = "9F713C";
        base0A = "A07E3B";
        base0B = "489963";
        base0C = "1C9AA0";
        base0D = "478C90";
        base0E = "55859B";
        base0F = "867469";
      };
    };
  };
}
