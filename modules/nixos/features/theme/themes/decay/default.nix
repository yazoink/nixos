{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "decay") {
    desktopTheme.base16Accent = "base0D";

    stylix = {
      base16Scheme = {
        base00 = "171B20";
        base01 = "21262e";
        base02 = "2b323b";
        base03 = "3c4453";
        base04 = "485263";
        base05 = "b6beca";
        base06 = "dee1e6";
        base07 = "dee1e6";
        base08 = "70A5EB";
        base09 = "e9a180";
        base0A = "f1cf8a";
        base0B = "78DBA9";
        base0C = "e26c7c";
        base0D = "86aaec";
        base0E = "c68aee";
        base0F = "9cd1ff";
      };
    };
  };
}
