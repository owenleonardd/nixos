{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
        {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.owen = {
					imports = [
						inputs.nixvim.homeModules.nixvim
						./home.nix
					];
				};
            };
        }
      ];
    };
  };
}
