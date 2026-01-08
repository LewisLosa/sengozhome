{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      inter
      fira-code
      maple-mono.NF
      rubik
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];
  };
}
