{
  inputs,
  pkgs-stable,
  config,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
    ./options
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs-stable;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${config.myOptions.userAccount.username}" = {
      imports = [
        ../home-manager
      ];
    };
  };
}
