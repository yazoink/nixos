# common configs
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    desktopTheme = {
      stylix.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "use stylix";
      };
    };
  };
  imports = [
    ./stylix
  ];
}
