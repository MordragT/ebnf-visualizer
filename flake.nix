{
  description = "A very basic flake";

  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in rec
      {
        devShells.default = pkgs.mkShell rec {
          buildInputs = with pkgs; [
            mono
            just
            # gtk2 # windows theme looks way better on dark system themes
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      }
    );
}
