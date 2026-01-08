{vars, ...}: {
  imports = [
    ./_packages.nix
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      vars.sshPublicKey
    ];
  };

  users.motd = ''
    Hellooooo, oni-chan~!

    if u install the systeem, u can use this command:

    coming soon. :/"

  '';

  security.sudo.wheelNeedsPassword = false;

  # needed for ventoy
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh = {
    enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
