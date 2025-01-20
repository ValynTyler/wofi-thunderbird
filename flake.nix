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
    packages.x86_64-linux.default = self.packages.x86_64-linux.wofiemail;
    packages.x86_64-linux.wofiemail =
      pkgs.stdenv.mkDerivation {
        name = "wofiemail";
        src = self;
        installPhase = ''
          mkdir -p $out/bin
          cp ./wofiemail.sh $out/bin/wofiemail
          chmod +x $out/bin/wofiemail
        '';
      };
  };
}
