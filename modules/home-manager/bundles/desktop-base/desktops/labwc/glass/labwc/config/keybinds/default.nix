{
  config,
  osConfig,
  lib,
  wallpaperCommand,
  ...
}: {
  keyboard = {
    default = true;
    keybind = lib.mkMerge [
      (import ./applications.nix {inherit config osConfig lib wallpaperCommand;})
    ];
  };
}
