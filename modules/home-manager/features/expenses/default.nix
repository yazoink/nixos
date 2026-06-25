{pkgs, ...}: let
  expenses = pkgs.callPackage ./expenses.nix {};
in {
  home.packages = [
    expenses
  ];
}
