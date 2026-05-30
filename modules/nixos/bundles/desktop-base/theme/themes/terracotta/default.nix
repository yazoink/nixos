{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "terracotta") {
    desktopTheme.base16Accent = "base0E";

    stylix = {
      base16Scheme = {
        base00 = "241D1A";
        base01 = "362B27";
        base02 = "473933";
        base03 = "594740";
        base04 = "A78E84";
        base05 = "B8A59D";
        base06 = "CABBB5";
        base07 = "DCD2CE";
        base08 = "E78C82";
        base09 = "F59C7A";
        base0A = "F7BA6E";
        base0B = "ABBB7F";
        base0C = "B5B1D0";
        base0D = "A195B4";
        base0E = "CA95A3";
        base0F = "E5A38C";
      };
    };
  };
}
