{
  pkgs,
  fileManager,
  lib,
  ...
}:
lib.mkMerge [(import (./. + "/${fileManager}") {inherit pkgs;})]
