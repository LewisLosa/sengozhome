{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      inter
      fira-code
      maple-mono.NF
    ];
  };
}
