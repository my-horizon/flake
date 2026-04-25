{ ... }:
{
  flake.nixosModules.pi5 =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        trusted-users = [
          "root"
          "@wheel"
        ];

        substituters = [
          "https://nixos-raspberrypi.cachix.org"
        ];

        trusted-public-keys = [
          "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
        ];
      };

      # Define hostname
      networking.hostName = "pi5";

      # firewall
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [
          80
          443
        ];
        allowedUDPPorts = [
          443
        ];
      };

      # set your time zone
      time.timeZone = "Europe/Berlin";

      # select internationalisation properties
      i18n.defaultLocale = "de_DE.UTF-8";

      # define a user account. don't forget to set a password with ‘passwd’
      users.users.${config.myConfig.user.name} = {
        isNormalUser = true;
        description = config.myConfig.user.name;
        extraGroups = [
          "wheel"
        ];
        initialPassword = "722772";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUsRfD2xqsTb1zobM1jKoOqAIbZMwqVwAZQ8SQH+0Y9 mail@virtualhorizon.de"
        ];
      };

      services.openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };

      services.caddy = {
        enable = true;
        email = "mail@virtualhorizon.de";
        virtualHosts = {

        };
      };

      environment.systemPackages = with pkgs; [
        vim
        git
        curl
      ];

      system.stateVersion = "25.11";
    };
}
