{ buildPythonPackage }:

buildPythonPackage rec {
  pname = "statx";
  version = "1";
  src = ./.;
}
