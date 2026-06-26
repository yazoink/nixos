{
  pkgs,
  fileManager,
  ...
}: {
  config = import (./. + "/${fileManager}") {inherit pkgs;};
}
