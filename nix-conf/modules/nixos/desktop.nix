{
  pkgs,
  pkgs-unstable,
  vars,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "tr";
        variant = "";
      };
      displayManager.lightdm.enable = false;
    };
    displayManager.sddm.enable = true;

    libinput.enable = true;
    pulseaudio.enable = false;
    geoclue2 = {
      enable = true;
      package = pkgs-unstable.geoclue2;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  programs.ssh.enableAskPassword = true;
  environment.variables.SSH_ASKPASS_REQUIRE = "prefer";
  security.rtkit.enable = true;
  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
  };
}
