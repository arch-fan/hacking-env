{
  description = "Basic flake with Home Manager for git";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
      ];
    };
  };
}
