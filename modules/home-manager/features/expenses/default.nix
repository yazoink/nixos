{
  pkgs,
  osConfig,
  lib,
  ...
}: let
  expenses = pkgs.callPackage ./expenses.nix {};
in {
  config = lib.mkIf osConfig.myOptions.features.expenses.enable {
    home.packages = [
      expenses
    ];
  };
}
