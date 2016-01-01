{ config, lib, pkgs, ... }:

with lib;

let 
  cfg = config.services.sway;
in

{
  options = {

    services.sway = {

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable the sway compositor.
        '';
      };
      
      # autorun = mkOption {
      #   type = types.bool;
      #   default = false;
      #   description = ''
      #     Whether to start the sway compositor automatically when logging.
      #   '';
      # };

      user = mkOption {
        type = types.str;
        description = ''
          The user that will start sway.
        '';
      };

      terminal = mkOption {
        type = types.str;
        description = ''
          The terminal in which to start sway.
        '';
      };

      config = mkOption {
        type = types.lines;
        description = ''
          The contents of the configuration file of the sway compositor
          (<filename>/etc/sway/config</filename>).
        '';
      };

      xkbLayout = mkOption {
        type = types.str;
        default = "us";
        example = "fr";
        description = ''
          Keyboard layout.
        '';
      };

      xkbModel = mkOption {
        type = types.str;
        default = "pc104";
        example = "presario";
        description = ''
          Keyboard model.
        '';
      };

      xkbOptions = mkOption {
        type = types.str;
        default = "terminate:ctrl_alt_bksp";
        example = "grp:caps_toggle, grp_led:scroll";
        description = ''
          X keyboard options; layout switching goes here.
        '';
      };

      xkbVariant = mkOption {
        type = types.str;
        default = "";
        example = "colemak";
        description = ''
          X keyboard variant.
        '';
      };

      # nativeGTK = mkOption {
      #   type = types.bool;
      #   default = false;
      #   description = ''
      #     Whether to use the Wayland backend for GTK applications.
      #   '';
      # };

      # nativeQt = mkOption {
      #   type = types.bool;
      #   default = false;
      #   description = ''
      #     Whether to use the Wayland backend for Qt applications.
      #   '';
      # };
    };
  };

  config = let ttyn = "tty${cfg.terminal}"; in mkIf cfg.enable {

    hardware.opengl.enable = mkDefault true;

    environment.systemPackages = [ pkgs.sway ];
    
    # Inspired from https://phabricator.freedesktop.org/T63
    systemd.services.sway = {
      description = "Sway compositor";
      restartIfChanged = true;
      environment = {
        XKB_DEFAULT_LAYOUT = cfg.xkbLayout;
        XKB_DEFAULT_MODEL = cfg.xkbModel;
        XKB_DEFAULT_OPTIONS = cfg.xkbOptions;
        XKB_DEFAULT_VARIANT = cfg.xkbVariant;  
      };
      wantedBy = [ "graphical.target" ];
      after = [ "systemd-user-sessions.service getty@${ttyn}.service" ];
      conflicts = [ "getty@${ttyn}.service" ];
      before = [ "graphical.target" ];
      serviceConfig = {
        Type = "simple";
        PermissionsStartOnly = "true";
        # TODO Check that pkgs.kdb is ok
        ExecStartPre = "${pkgs.kbd}/bin/chvt ${cfg.terminal}";
        ExecStart = "${pkgs.sway}/bin/sway";
        # TODO Check that the user exists
        User = cfg.user;
        # TODO Proper working directory
        WorkingDirectory = "/home/${cfg.user}";
        PAMName = "login";
        UtmpIdentifier = ttyn;
        TTYPath = "/dev/${ttyn}";
        TTYReset = "yes";
        TTYVHangup = "yes";
        TTYVTDisallocate = "yes";

        StandardInput = "tty";
        StandardOutput = "journal";
        StandardError = "journal";
      };
    };
  };
}
