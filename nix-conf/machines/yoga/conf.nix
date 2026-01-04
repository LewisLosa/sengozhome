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
        ];
      };
    };
  };

  networking.hostName = "yoga";
  system.stateVersion = "25.11";
}
