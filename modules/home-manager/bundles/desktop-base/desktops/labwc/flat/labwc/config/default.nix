{
  config,
  osConfig,
  lib,
  ...
}: {
  rc = lib.mkMerge [
    (import ./general.nix {inherit config osConfig lib;})
    (import ./theme.nix {inherit config osConfig lib;})
    (import ./keybinds {inherit config osConfig lib;})
    (import ./autostart.nix {inherit config osConfig lib;})
  ];
}
