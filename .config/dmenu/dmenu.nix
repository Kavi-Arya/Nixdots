with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "dmenu";
  version = "custom";

  src = ./../dmenu; # Path to your dmenu source folder

  buildInputs = [
    pkg-config
    libX11
    libXft
    libXinerama
  ];

  installPhase = ''
    make PREFIX=$out install
  '';

