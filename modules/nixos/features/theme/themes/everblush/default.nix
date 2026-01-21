# https://color.firefox.com/?theme=XQAAAAKYAwAAAAAAAABBqYhm849SCicxcUUSqiuG_ebZUZXOFqmA0BaFyCSgTnzmrCnE_CoWdpIL68SrzIik_qw1EasGFw7CNUVpCOZpMV5Un_0sunysOZ1Jq5g_YhUffbZBKVtLPj65AnXibOFlpnpjDvB34qOt5_IM0dXD0Fs8Lem0A1uxA5Akj-v_gf4vey0DX74BJGDWBOm7AfXD28MTVoXIiZk-CMFjQFzclUHA0zLTeagrd2iVcRdU-frtGIWkFOw1aZDgmw1IR-wemU9J0QFvzrdL5TKqXleiZcVTjCyJb9F_PwjZx72CUoGyNziitFiHc3pcF8lQPoFqPg1s6wldFuOpMqUGfMqfgz3KhDyGVvd_egeXOR5McCmiKMXsLl_qjUP1Ovz15-R-D6LI9rby6ozT2sRcpaDuoVYhF-cnA4RsPlXMKlVTYfuecBRB5QpqsUXU3w-DanoZ2IrWbks4vEy9__aLkxQ
{
  pkgs,
  config,
  lib,
  ...
}: let
  cursors = pkgs.callPackage ./everblush-cursors.nix {};
  icons = pkgs.callPackage ./everblush-icons.nix {};
in {
  config = lib.mkIf (config.myOptions.bundles.desktopBase.enable && config.myOptions.desktopTheme.colorscheme == "everblush") {
    desktopTheme.base16Accent = "base0D";
    desktopTheme.icons = {
      name = "Everblush-Icons";
      package = icons;
    };

    stylix = {
      cursor = {
        name = "BreezeX-Everblush";
        size = 32;
        package = cursors;
      };
      base16Scheme = {
        base00 = "141B1E";
        base01 = "1C2326";
        base02 = "232A2D";
        base03 = "353C3F";
        base04 = "B3B9B8";
        base05 = "DADADA";
        base06 = "DADADA";
        base07 = "DDDDDD";
        base08 = "E57474";
        base09 = "E59E70";
        base0A = "E5C76B";
        base0B = "8CCF7E";
        base0C = "6CBFBF";
        base0D = "67B0E8";
        base0E = "C47FD5";
        base0F = "CD6B6C";
      };
    };
  };
}
