{pkgs, ...}:
pkgs.python312Packages.buildPythonApplication rec {
  pname = "lyricli";
  version = "1.0";
  pyproject = true;
  build-system = with pkgs; [setup-tools];

  src = pkgs.fetchFromGitHub {
    owner = "yazoink";
    repo = "lyricli";
    rev = "main";
    sha256 = "sha256-/MucVSa88eUqC8J5bX+ecCnnYgBn+bkyMvmogpeOmvg=";
  };

  propagatedBuildInputs = with pkgs.python312Packages; [
    requests
    beautifulsoup4
  ];

  doCheck = false;
}
