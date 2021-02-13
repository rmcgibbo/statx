{ pkgs ? import <nixpkgs> {}
, pythonPackages ? pkgs.python38Packages }:

pythonPackages.buildPythonPackage rec {
    pname = "statx";
    version = "1";
    src = ./.;
}
