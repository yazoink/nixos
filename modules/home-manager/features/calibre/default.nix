{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.calibre.enable {
    programs.calibre = {
      enable = builtins.trace "calibre" true;
      # plugins = with pkgs; [];
    };
  };
}
