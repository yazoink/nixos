{
  imports = [
    ./bundles/base
    ./bundles/desktop-base
    ./bundles/desktop-full
    ./features/ollama
    ./features/ssd
    ./features/steam
    ./features/virt-manager
    ./features/virtualbox
    ./features/retroarch
    ./features/disk-burner
    ./features/opentabletdriver
  ];
  config = {
    nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
  };
}
