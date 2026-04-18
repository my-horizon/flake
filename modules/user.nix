{ ... }:
{
  flake.nixosModules.user =
    { config, lib, ... }:
    {
      options.myConfig.user = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "unknown";
          description = "primary user name";
        };

        home = lib.mkOption {
          type = lib.types.str;
          default = "/home/${config.myConfig.user.name}";
          defaultText = lib.literalExpression ''"/home/''${config.myConfig.user.name}"'';
          description = "home directory path";
        };
      };
    };
}
