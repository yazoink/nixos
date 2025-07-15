{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "replacecolor";
  version = "1.0";
  pyproject = true;
  build-system = with pkgs.python312Packages; [setuptools];

  src = ./replacecolor;

  propagatedBuildInputs = with pkgs.python312Packages; [
    pillow
    numpy
  ];

  doCheck = false;
}
