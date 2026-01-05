{
  config,
  pkgs,
  inputs,
  vars,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-conf.nix
    ./../../modules/nixos/desktop.nix
    ./../../modules/nixos/base.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs vars;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix
          ./../../modules/home-manager/zen.nix
          ./../../modules/home-manager/kitty.nix
          ./../../modules/home-manager/_zsh.nix
        ];
      };
    };
  };

  networking.hostName = "yoga";
  system.stateVersion = "25.11";
}
