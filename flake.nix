{
  description = "wioenena flake templates";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      templates = {
        example = {
          path = ./example;
          description = "Example template";
        };
        c-hello = {
          path = ./c-hello;
          description = "c-hello template";
        };
      };

    };
}
