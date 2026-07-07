{
  config,
  osConfig,
  lib,
  ...
}: {
  keyboard = {
    keybind = lib.mkMerge [
      (import ./applications.nix {inherit config osConfig lib;})
    ];
  };
}
