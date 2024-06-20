{
  description = "c-hello flake template";

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
      packages.${system}.c-hello = pkgs.stdenv.mkDerivation {
        name = "c-hello";
        src = ./.;

        nativeBuildInputs = with pkgs; [
          gcc
          clang
        ];

        buildPhase = ''
          $CC -o c-hello ./main.c
        '';

        installPhase = ''
                  mkdir -p "$out/bin"
          	mv ./c-hello "$out/bin"
        '';
      };

      defaultPackage.${system} = self.packages.${system}.c-hello;
    };
}
