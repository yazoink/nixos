{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    bundles.desktopBase.awesome.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf config.bundles.desktopBase.awesome.enable {
    services = {
      xserver = {
        enable = true;
        windowManager.awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
          ];
        };
      };
    };
  };
}
