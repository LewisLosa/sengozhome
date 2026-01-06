{
  lib,
  config,
  pkgs,
  vars,
  ...
}: {
  imports = [
    ./_packages.nix
  ];

  home = {
    username = "${vars.username}";
    homeDirectory = lib.mkForce "/home/${vars.username}";
    stateVersion = "25.11";
  };
}
