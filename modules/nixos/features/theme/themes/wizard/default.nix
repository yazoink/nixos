{
  pkgs,
  config,
  lib,
  ...
}: let
  wizardTheme = pkgs.callPackage ./wizard-theme.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "wizard") {
    desktopTheme.base16Accent = "base0B";
    desktopTheme.icons = {
      name = "Wizard-Icons";
      package = wizardTheme;
    };

    stylix = {
      cursor = {
        name = "Bibata-Wizard";
        package = wizardTheme;
      };
      base16Scheme = {
        base00 = "1B0823";
        base01 = "371F2E";
        base02 = "53373A";
        base03 = "6F4E45";
        base04 = "A77D5C";
        base05 = "DFAC73";
        base06 = "DFAC73";
        base07 = "DFAC73";
        base08 = "CF320B";
        base09 = "EC8731";
        base0A = "F0BB30";
        base0B = "757A44";
        base0C = "879872";
        base0D = "727085";
        base0E = "9A1120";
        base0F = "8A3338";
      };
    };
  };
}
