{
  pkgs,
  config,
  ...
}: {
  services =
    {
      system-config-printer = {
        enable = true;
      };
      printing = {
        enable = true;
        drivers = [
          pkgs.gutenprint
        ];
      };
    }
    // (
      # If hostname is thinky, enable sharing and avahi
      if config.networking.hostName == "thinky"
      then {
        printing = {
          listenAddresses = ["*:631"];
          allowFrom = ["all"];
          browsing = true;
          defaultShared = true;
          openFirewall = true;
        };

        avahi = {
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
          publish = {
            enable = true;
            userServices = true;
          };
        };
      }
      else {}
    );
}
