{
    description = "Initialisation flake for java and eclipse";

    inputs =
    {
        nixpkgs.url = "github:NixOS/nixpkgs/22.11";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = {self, nixpkgs, flake-utils}:
        flake-utils.lib.eachDefaultSystem
        (system:
            let
                pkgs = nixpkgs.legacyPackages.${system};
            in 
            rec {

                devShells = {
                    default = pkgs.mkShell {
                        buildInputs = with pkgs; [
                                jdk17
                                eclipses.eclipse-java
                            ];
                    };
                };

        });
}