{
  description = "Main flake for each developpement environnement";

  inputs =
    {
      flake-utils.url = "github:numtide/flake-utils";
      javadev.url = "./java";
      pascaldev.url = "./pascal";
    };

  outputs = { self, flake-utils, javadev, pascaldev }:
    flake-utils.lib.eachDefaultSystem
      (system: {
        devShells = {
          java = javadev.devShells.${system}.default;
          java8 = javadev.devShells.${system}.java8;
          java11 = javadev.devShells.${system}.java11;
          java17 = javadev.devShells.${system}.java17;
          pascal = pascaldev.devShells.${system}.default;
        };
      });

}
