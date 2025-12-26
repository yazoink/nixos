{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.calibre.enable {
    programs.calibre = {
      enable = true;
      # plugins = with pkgs; [];
    };
  };
}
