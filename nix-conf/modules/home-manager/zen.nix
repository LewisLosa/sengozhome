{ pkgs, ... }:

{
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles = {
      settings = {
    "browser.tabs.warnOnClose" = false;
    "browser.download.panel.shown" = false;
    # Since this is a json value, it can be nixified and translated by home-manager;
    browser = {
      tabs.warnOnClose = false;
      download.panel.shown = false;
    };
      *.extensions.packages = {
     with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          bitwarden
          ...
        ];
    };
    
  };
}