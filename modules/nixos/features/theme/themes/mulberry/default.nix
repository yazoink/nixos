{pkgs, config, lib, ...}:
# I made this one
{
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.name == "mulberry") {
    desktopTheme.base16Accent = "base0A";

    stylix = {
      base16Scheme = {
        base00 = "0F0F0F";
        base01 = "1B1B1B";
        base02 = "272627";
        base03 = "3E3C3E";
        base04 = "857E84";
        base05 = "CAC0C9";
        base06 = "CFC6CE";
        base07 = "D3CBD2";
        base08 = "A13A57";
        base09 = "995C6C";
        base0A = "A9758A";
        base0B = "9F9FAA";
        base0C = "3B6363";
        base0D = "8D868C";
        base0E = "62545D";
        base0F = "92354F";
      };
    };
  };
}
