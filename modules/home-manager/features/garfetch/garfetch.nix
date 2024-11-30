{stdenv, lib, pciutils, fetchFromGitHub, bash, ...}:
stdenv.mkDerivation {
  pname = "garfetch";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "yazoink";
    repo = "garfetch";
    rev = "2b991c6ee4aca2665f942532561255d6187727aa";
    sha256 = "sha256-JCQbcQPLNxCfbDiRKa/mDaWAUEwDsm5g+yoEYHgaa3Y=";
  };

  buildInputs = [bash pciutils];

  installPhase = ''
    chmod +x garfetch
    mkdir -p "$out/bin"
    cp garfetch "$out/bin"
  '';

  meta = with lib; {
    homepage = "https://github.com/yazoink/garfetch";
    description = "system fetch but garfield";
    platforms = platforms.linux;
    maintainers = ["yazoink"];
  };
}
