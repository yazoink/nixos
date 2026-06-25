{
  pkgs,
  sansFont,
  ...
}: {
  sansSerif = import (./. + "/${sansFont}") {inherit pkgs;};
}
