{
  pkgs,
  monoFont,
  ...
}: {
  monospace = import (./. + "/${monoFont}") {inherit pkgs;};
}
