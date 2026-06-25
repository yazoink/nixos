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
      (import ./misc.nix {inherit config osConfig lib;})
      (import ./windows.nix {inherit config osConfig lib;})
      (import ./workspaces.nix {inherit config osConfig lib;})
      (import ./applications.nix {inherit config osConfig lib wallpaperCommand;})
      (import ./media.nix {inherit config osConfig lib;})
    ];
  };
}
