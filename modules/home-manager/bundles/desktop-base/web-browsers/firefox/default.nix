{
  inputs,
  lib,
  osConfig,
  ...
}: {
  home = {
    sessionVariables = {
      MOZ_USE_XINPUT2 = 1;
    };
  };
  programs.firefox = lib.mkMerge [
    {enable = true;}
    (import ./config {inherit lib osConfig inputs;})
  ];
}
