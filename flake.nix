{
  description = "wofi-firefox flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    packages.x86_64-linux.default = self.packages.x86_64-linux.wofirefox;
    packages.x86_64-linux.wofirefox =
      pkgs.stdenv.mkDerivation {
        name = "wofirefox";
        src = self;
        installPhase = ''
          mkdir -p $out/bin
          cp ./wofirefox.sh $out/bin/wofirefox
          chmod +x $out/bin/wofirefox
        '';
      };
  };
}
