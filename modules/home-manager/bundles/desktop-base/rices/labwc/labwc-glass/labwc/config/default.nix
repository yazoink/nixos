{
  config,
  osConfig,
  lib,
  ...
}: {
  rc = lib.mkMerge [
    (import ./general.nix {inherit config osConfig lib;})
    (import ./theme.nix {inherit config osConfig lib;})
  ];
}
