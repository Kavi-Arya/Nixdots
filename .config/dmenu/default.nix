with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "dmenu";
  version = "custom";

  src = ../dmenu; # Path to your dmenu directory

  buildInputs = [
    pkg-config
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
  ];

  unpackPhase = "true"; # Skip the unpack phase as src is already a directory

  installPhase = ''
    make PREFIX=$out install
  '';
}
