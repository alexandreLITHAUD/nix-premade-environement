{
  description = "Initialisation flake for java and eclipse";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/22.11";
      flake-utils.url = "github:numtide/flake-utils";
    };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {

          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [
                eclipses.eclipse-java
              ];
            };
            java8 = pkgs.mkShell {
              buildInputs = with pkgs; [
                (eclipses.eclipse-java.overrideAttrs (oldAttrs: { jdk = jdk8; }))
              ];
            };
            java11 = pkgs.mkShell {
              buildInputs = with pkgs; [
                (eclipses.eclipse-platform {
                  name = "eclipse-java11";
                  jdk = jdk11;
                })
              ];
            };
            java17 = pkgs.mkShell {
              buildInputs = with pkgs; [
                (eclipses.eclipse-platform {
                  name = "eclipse-java17";
                  jdk = jdk17;
                })
              ];
            };
          };

        });
}
