{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.myOptions.features.obsidian.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}
