{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "levuaska") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "0f0f17";
        base01 = "13141c";
        base02 = "1E1F27";
        base03 = "646a73";
        base04 = "858893";
        base05 = "bfc9db";
        base06 = "BFC9DB";
        base07 = "C5CEDE";
        base08 = "d78787";
        base09 = "E0B089";
        base0A = "e4c9af";
        base0B = "afbea2";
        base0C = "b1e7dd";
        base0D = "a1bdce";
        base0E = "d7beda";
        base0F = "F2CDCD";
      };
    };
  };
}
