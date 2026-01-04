{
  pkgs, vars, ...
}: {
    services = {
        xserver.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        xserver.xkb = {
          layout = "tr";
          variant = "";
        };
      };      
}