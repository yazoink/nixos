{
  pkgs,
  fileManager,
  ...
}: (import (./. + "/${fileManager}") {inherit pkgs;})
