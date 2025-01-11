{
  description = "Keyb's nixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    firefox-addons = {
      url = "github:nix-community/nur-combined?dir=repos/rycee/pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nixvim,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        PostReality = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./PostReality/nixos/configuration.nix ];
        };
      };

      darwinConfigurations = {
        "MacBook-Air-de-Keyb" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            nixvim.nixDarwinModules.nixvim
            ./macbook/configuration.nix
            ./common/neovim

            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.keyb = import ./macbook/home.nix;
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations = {
        "keyb@PostReality" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            inputs.nixvim.homeManagerModules.nixvim
            ./common/neovim
            ./PostReality/home-manager/home.nix
          ];
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}
