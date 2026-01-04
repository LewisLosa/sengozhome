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

  home.username = "${vars.username}";
  home.homeDirectory = lib.mkForce "/home/${vars.username}";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "${vars.fullName}";
    userEmail = "${vars.email}";
  };

  home.stateVersion = "25.11";
}
