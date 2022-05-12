{
  description = "sielicki's nixos adventure";

  inputs = {
    configs.url             = "path:configs/";
    machines.url            = "path:machines/";
    nixpkgs.url             = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url    = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url              = "github:LnL7/nix-darwin/master";
    nixos-hardware.url      = "github:NixOS/nixos-hardware/master";
    home-manager.url        = "github:nix-community/home-manager/master";
    nix-doom-emacs.url      = "github:nix-community/nix-doom-emacs/master";
    emacs-overlay.url       = "github:nix-community/emacs-overlay/master";
    
    nixos-wsl.url             = "github:nix-community/nixos-wsl/main";

    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = inputs@{
    self,

    configs,
    darwin,
    home-manager,
    machines,
    nix-doom-emacs,
    nixos-hardware,
    nixos-wsl,
    nixpkgs-unstable,

    ...
  }:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      overlays = [ (import inputs.emacs-overlay) ];
    };
  in
  {
    nixosConfigurations = {
      dogdoor = nixpkgs-unstable.lib.nixosSystem {
        inherit system pkgs;
        modules = ([
	  inputs.nixos-wsl.nixosModules.wsl
          configs.nixosModules.my_locale
          configs.nixosModules.my_user
          configs.nixosModules.my_wsl
	  home-manager.nixosModules.home-manager {
              home-manager.users.sielicki = import ./home.nix { inherit inputs system pkgs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
          }
        ]);
      };
    };
  };
}
