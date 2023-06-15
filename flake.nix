{
    description = "Main flake for each developpement environnement";

    inputs = 
    {
        flake-utils.url = "github:numtide/flake-utils";
        javadev.url = "./java";
    };

    outputs = { self, flake-utils, javadev}:
        flake-utils.lib.eachDefaultSystem
        (system: {
        devShells = {
            java = javadev.devShells.${system}.default;
        };
    });  

}