{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "posterpole") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "18161C";
        base01 = "221F23";
        base02 = "2B272B";
        base03 = "353032";
        base04 = "5B524F";
        base05 = "A89789";
        base06 = "A89789";
        base07 = "A89789";
        base08 = "A86F6F";
        base09 = "B7806D";
        base0A = "C5916B";
        base0B = "6B8D7A";
        base0C = "6C7F92";
        base0D = "73708A";
        base0E = "7A6182";
        base0F = "996565";
      };
    };
  };
}
