{
  description = "wioenena flake templates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

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
        flake-utils = {
          path = ./flake-utils;
          description = "Simple flake with flake-utils";
        };
      };
    };
}
