{
  description = "sielicki's nixos adventure";

  inputs = {
    configs.url             = "path:configs/";
    machines.url            = "path:machines/";
    nixpkgs.url            = "github:nixos/nixpkgs/master";
    #nixpkgs.url             = "github:nixos/nixpkgs/1fc7212a2c3992eedc6eedf498955c321ad81cc2";
    #nixpkgs.url             = "github:sielicki/nixpkgs/master";
    darwin.url              = "github:LnL7/nix-darwin/master";
    nixos-hardware.url     = "github:NixOS/nixos-hardware/master";
    home-manager.url        = "github:nix-community/home-manager/master";
    nix-doom-emacs.url      = "github:nix-community/nix-doom-emacs/master";
    emacs-overlay.url       = "github:nix-community/emacs-overlay/master";
    
    nixos-wsl.url             = "github:nix-community/nixos-wsl/main";
    #nixos-wsl.url             = "github:nzbr/nixos-wsl/mount-fix";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
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
    nixpkgs,

    ...
  }:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ (import inputs.emacs-overlay) ];
    };
  in
  {
    nixosConfigurations = {
      dogdoor = nixpkgs.lib.nixosSystem {
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
