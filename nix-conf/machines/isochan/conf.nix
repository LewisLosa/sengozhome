{vars, ...}: {
  imports = [
    ./../../modules/nixos/iso.nix
  ];

  networking.hostName = "isochan";
}
