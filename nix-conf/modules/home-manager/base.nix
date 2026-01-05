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

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "${vars.fullName}";
    userEmail = "${vars.email}";
  };
}
