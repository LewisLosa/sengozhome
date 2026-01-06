{
  pkgs,
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
    };
    libinput.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    pulseaudio.enable = false;
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
}
