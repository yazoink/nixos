{
  pkgs,
  theme,
  ...
}: (import (./. + "/${theme}") {inherit pkgs;})
