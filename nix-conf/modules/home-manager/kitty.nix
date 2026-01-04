{
  pkgs,
  lib,
  vars,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = lib.mkForce {
      confirm_os_window_close = 1;
      scrollback_lines = 10000;
      enable_audio_bell = true;
      background_opacity = "0.5";
      background_blur = 5;
      font_size = 12.0;
      font_family = "Maple Mono NF";
      disable_ligatures = "never";
      cursor_trail = 1;
      cursor_shape = "block";
      cursor_blink_interval = 0.5;
      shell = "fish";
    };
  };
}