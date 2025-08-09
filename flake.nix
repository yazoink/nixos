{
  description = "Gene's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixos-hardware,
    zen-browser,
    nixvim,
    hyprland,
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
          {
            config = {
              nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
            };
          }
        ];
      };

      ##### Laptop #####
      cyberia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/cyberia
          {
            config = {
              nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
            };
          }
        ];
      };

      ##### Portable Laptop #####
      stardust = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/stardust
          {
            config = {
              nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
            };
          }
        ];
      };

      iris = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/iris
          {
            config = {
              nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
            };
          }
        ];
      };

      tallulah = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./options
          ./nixos/tallulah
          {
            config = {
              nixpkgs.config.permittedInsecurePackages = ["libsoup-2.74.3"];
            };
          }
        ];
      };
    };
  };
}
