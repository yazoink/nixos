{ pkgs, ... }:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "hyprviewbinds";
  version = "1.0";

  src = ./audtousd;

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
