{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.krita.enable {
    home.packages = with pkgs; [krita];
  };
}
