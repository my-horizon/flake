{ ... }:
{
  flake.nixosModules.hyprlock =
    { ... }:
    {
      security.pam.services.hyprlock = { };
      home-manager.users.unknown = {
        programs.hyprlock = {
          enable = true;
          settings = {

            # cursor
            general = {
              hide_cursor = true;
            };

            # lockscreen color
            background = "rgb(000000)";
            blur_passes = 0;

            # input field
            input-field = {
              size = "250, 50";
              outline_thickness = 3;
              outer_color = "rgb(b4befe)";
              inner_color = "rgb(1e1e2e)";
              font_color = "rgb(cdd6f4)";
              fade_on_empty = true;
              hide_input = false;
              placeholder_text = "";
            };
          };
        };
      };
    };
}
