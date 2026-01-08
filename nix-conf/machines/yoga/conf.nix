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
    ./../../modules/nixos/printer.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs vars;};
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    backupCommand = ''
      mv -f "$1" "$1.bak"
    '';

    users = {
      "${vars.username}" = {
        imports = [
          ./../../modules/home-manager/base.nix
          ./../../modules/home-manager/zen.nix
          ./../../modules/home-manager/kitty.nix
          ./../../modules/home-manager/fonts.nix
          ./../../modules/home-manager/git.nix
          ./../../modules/home-manager/hyprland.nix
        ];
      };
    };
  };

  networking.hostName = "yoga";
  system.stateVersion = "25.11";
}
