{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.ncd;

  confFile = pkgs.writeText "ncd-bind.conf"
    ''
      options {
        listen-on port 53 { ${cfg.address}; };
        allow-query { any; };
        auth-nxdomain no;
        recursion yes;
        directory "${cfg.workingDir}/bindDir";
        pid-file "${cfg.workingDir}/bind.pid";
        session-keyfile "${cfg.workingDir}/session.key";
        include "${cfg.workingDir}/resolvconfOptions.conf";
      };
      
      zone "${cfg.domain}" {
        type master;
        file "${cfg.dataDir}/records";
        allow-update { localhost; };
      };

      include "${cfg.workingDir}/resolvconfZones.conf";
    '';

    records = ''
      $TTL    604800
      @               IN      SOA     ${cfg.domain}. bind.${cfg.domain}. (
                                  2017012601         ; Serial
                                      604800         ; Refresh
                                       86400         ; Retry
                                     2419200         ; Expire
                                      604800 )       ; Negative Cache TTL
      ;
      ${cfg.domain}.  IN      NS      ${cfg.domain}.
      ;
      
      @               IN      A       127.0.0.1
      ;
    '';

    resolvconfConf = ''
      name_servers='${cfg.address}'
      named_server=ncd
      named_restart='${pkgs.systemd}/bin/systemctl try-restart --no-block ncd.service'
      named_options='${cfg.workingDir}/resolvconfOptions.conf'
      named_zones='${cfg.workingDir}/resolvconfZones.conf'
    '';

in

{

  options = {

    services.ncd = {

      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Whether to enable ncd
        '';
      };

      user = mkOption {
        default = "ncd";
        type = types.str;
        description = ''
          Name that will be given to the ncd user
        '';
      };

      workingDir = mkOption {
        type = types.path;
        default = "/var/run/ncd";
        description = ''
          Directory where temporary data is kept
        '';
      };

      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/ncd";
        description = ''
          Directory where persistent data is kept
        '';
      };

      domain = mkOption {
        type = types.string;
        default = "ncd";
        description = ''
          The super-domain for the containers
        '';
      };

      address = mkOption {
        type = types.string;
        default = "127.0.0.1";
        description = ''
          The private IP address that will be bound to the DNS server
        '';
      };

    };
  };

  config = mkIf config.services.ncd.enable {

    users.extraUsers = singleton {
      name = cfg.user;
      # Will be added if I get to push this upstream
      # uid = config.ids.uids.ncd;
      uid = 236; # Bogus number
      description = "User managing ncd";
    };

    systemd.services.ncd = {
      description = "A daemon for nixos-container";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      preStart = ''
        # TODO -- invalidate previous transactions if the zone changes
        if [ -d ${cfg.dataDir} ]; then
          install -D -o ${cfg.user} <(echo '${records}') ${cfg.dataDir}/records
        fi

        install -d -o ${cfg.user} ${cfg.workingDir}
        install -d -o ${cfg.user} ${cfg.workingDir}/bindDir
      '';
      script = "${pkgs.bind.out}/sbin/named -4 -u ${cfg.user} -c ${confFile} -f";
    };

    networking.extraResolvconfConf = resolvconfConf;

  };

}

