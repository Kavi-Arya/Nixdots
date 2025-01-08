{
  description = "My Firest Flake!";

  inputs = {
      nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }:
  let 
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
    NixBox = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
     };
    };
  };

}
