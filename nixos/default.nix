{inputs, ...}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
    ./options
  ];
}
