{
  description = "Hyprland configuration managed via Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      hyprland-system = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            environment.systemPackages = with pkgs; [
              hyprland
              kitty
              pcmanfm
              wofi
              waybar
              playerctl
            ];

            services.hyprland = {
              enable = true;
              config = {
                monitors = [ {
                  name = "HDMI-A-1";
                  resolution = "2560x1080@100";
                  position = "0x0";
                  scale = 1;
                } ];

                variables = {
                  terminal = "kitty";
                  fileManager = "pcmanfm";
                  menu = "wofi --show drun";
                  VimEnter = "SUPER, Escape";
                };

                autostart = [
                  "waybar &"
                  "swww-daemon &"
                  "hyprctl setcursor macOS-White 23 &"
                ];

                general = {
                  gaps_in = 5;
                  gaps_out = 20;
                  border_size = 2;
                  col = {
                    active_border = "rgba(ea6962FF) rgba(e78a4eFF) 45deg";
                    inactive_border = "rgba(1d2021FF)";
                  };
                  resize_on_border = false;
                  allow_tearing = false;
                  layout = "dwindle";
                };

                decoration = {
                  rounding = 10;
                  active_opacity = 1.0;
                  inactive_opacity = 0.6;
                  shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                  };
                  blur = {
                    enabled = true;
                    size = 8;
                    passes = 1;
                    vibrancy = 0.1696;
                  };
                };

                animations = {
                  enabled = true;
                  bezier = {
                    overshot = "0.05, 0.9, 0.1, 1.05";
                    smoothOut = "0.36, 0, 0.66, -0.56";
                    smoothIn = "0.25, 1, 0.5, 1";
                  };
                  windows = {
                    in = "1, 3, overshot, slide";
                    out = "1, 3, smoothOut, slide";
                  };
                };

                input = {
                  kb_layout = "us";
                  kb_options = "caps:escape";
                  repeat_rate = 40;
                  repeat_delay = 300;
                  accel_profile = "flat";
                  follow_mouse = 1;
                  force_no_accel = 1;
                  sensitivity = 0.0;
                  touchpad = {
                    natural_scroll = false;
                  };
                };

                keybindings = {
                  mainMod = "SUPER";
                  binds = [
                    { key = "SUPER+Escape"; action = "exec ~/.local/bin/normalMode.sh"; }
                    { key = "SUPER+B"; action = "exec pkill waybar &"; }
                    { key = "SUPER+SHIFT+B"; action = "exec waybar &"; }
                  ];
                };

                sourceFiles = [
                ~/.config/hypr/vim_mode.conf

                ];
              };
            };
          }
        ];
      };
    };
  };
}

