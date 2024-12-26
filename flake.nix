{
  description = "Gene's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:kaylorben/nixcord";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-qtutils,
    hyprsysteminfo,
    stylix,
    nixos-hardware,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      ##### Desktop #####
      fluoride = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/fluoride
        ];
      };

      ##### Laptop #####
      cyberia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/cyberia
        ];
      };
    };
  };
}
