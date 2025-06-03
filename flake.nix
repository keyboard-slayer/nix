{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

   home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  }@inputs:
  let
    inherit (self) outputs;
  in {
    darwinConfigurations = {
      "MacBook-Air-de-Jordan" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jordan = import ./machines/macbook/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }

          ./machines/macbook/config.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
