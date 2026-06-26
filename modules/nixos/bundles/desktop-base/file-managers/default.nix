{
  pkgs,
  fileManager,
  lib,
  ...
}:
lib.mkIf lib.path.subpath.isValid fileManager (import (./. + "/${fileManager}") {inherit pkgs;})
