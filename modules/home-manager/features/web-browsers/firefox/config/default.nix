{
  lib,
  osConfig,
  inputs,
  ...
}:
lib.mkMerge [
  (import ./policies.nix)
  {
    profiles."${osConfig.myOptions.userAccount.username}" = lib.mkMerge [
      {
        isDefault = true;
        extraConfig = builtins.readFile ./user.js;
      }
      (import ./search.nix)
      (import ./extensions.nix {inherit osConfig inputs lib;})
    ];
  }
]
