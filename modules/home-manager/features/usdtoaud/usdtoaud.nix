{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "usdtoaud";
  version = "1.0";
  pyproject = true;
  build-system = [setup-tools];

  src = ./usdtoaud;

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
