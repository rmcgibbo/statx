{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.py-utils.url = "github:rmcgibbo/python-flake-utils";
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils, py-utils }: {
    overlay = py-utils.lib.mkPythonOverlay (pkgs: {
      statx = pkgs.callPackage ./. { };
    });
   } //
    utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ self.overlay ]; };
    in {
      defaultPackage = pkgs.python3.pkgs.statx;
    });    
}
