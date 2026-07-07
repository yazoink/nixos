{
  config,
  osConfig,
  lib,
  ...
}: {
  keyboard = {
    default = false;
    keybind = lib.mkMerge [
      (import ./applications.nix {inherit config osConfig lib;})
    ];
  };
}
