{ pkgs, ... }:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "lyricli";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "lyricli";
    rev = "main";
    sha256 = "sha256-B3Nei90osL1k9qpVI6gdgGXgNa+8WFQBQkroL5CLUIM=";
  };

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
