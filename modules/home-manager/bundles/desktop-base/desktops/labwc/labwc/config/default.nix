{
  config,
  osConfig,
  lib,
  wallpaperCommand,
  ...
}:
lib.mkMerge [
  (import ./environment.nix {inherit config osConfig lib;})
  (import ./autostart.nix {inherit config osConfig lib wallpaperCommand;})
  {
    rc = lib.mkMerge [
      (import ./hardware.nix {inherit config osConfig lib;})
      (import ./general.nix {inherit config osConfig lib;})
      (import ./theme.nix {inherit config osConfig lib;})
      (import ./window_rules.nix {inherit config osConfig lib;})
      (import ./keybinds {inherit config osConfig lib wallpaperCommand;})
    ];
  }
]
