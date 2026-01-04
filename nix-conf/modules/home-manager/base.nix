{ lib, config, pkgs, vars, ... }:

{
  home.username = "${vars.username}";
  home.homeDirectory = lib.mkForce "/home/${vars.username}";

  home.packages = with pkgs; [
    kdePackages.kate
    windsurf
    git
    direnv
    fastfetch
    nnn
    firefox
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    yq-go
    eza
    fzf
    mtr 
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    btop
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "${vars.fullName}";
    userEmail = "${vars.email}";
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  home.stateVersion = "25.11";
}