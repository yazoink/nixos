{pkgs, config, lib, ...}:
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "henna") {
    desktopTheme.base16Accent = "base0C";

    stylix = {
      base16Scheme = {
        base00 = "10151a";
        base01 = "1B1F23";
        base02 = "2c313a";
        base03 = "3B4048";
        base04 = "495162";
        base05 = "f8f8f0";
        base06 = "f8f8f0";
        base07 = "f8f8f0";
        base08 = "e74c3c";
        base09 = "fd7c56";
        base0A = "9cd230";
        base0B = "53df83";
        base0C = "1abc9c";
        base0D = "56b5c2";
        base0E = "FFB8D1";
        base0F = "ECBE7B";
      };
    };
  };
}
