{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "audtousd";
  version = "1.0";
  pyproject = true;
  build-system = ["setup-tools"];

  src = ./audtousd;

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
