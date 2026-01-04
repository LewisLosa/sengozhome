{
  description = "A simple NixOS flake for sengozhome :=)";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # "yoga" is my yoga 6 laptop
    nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
      modules = [
        ./machines/yoga/conf.nix
      ];
    };
  };
}