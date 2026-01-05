{
  pkgs,
  inputs,
  osConfig,
  ...
}: let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in {
  home = {
    packages = with pkgs;
      [
        curl
        dig
        figlet
        lolcat
        cowsay
        wget
        imagemagick
        openssl
        jq
        kopia
        statix
        qrencode
        tree
        fastfetch
      ]
      ++ (
        if osConfig.networking.hostName != "thinky"
        then [
          # Below packages are for personal machines only; excluded from servers
          # inspo: https://discourse.nixos.org/t/how-to-use-hostname-in-a-path/42612/3
          starship
          maple-mono.NF
          windsurf
          bun
          just
          gnupg1
          ffmpeg
          nil
          nixos-rebuild
          nixd
          sops
          statix
          zola
        ]
        else [
          # server only
        ]
      );
  };
}
