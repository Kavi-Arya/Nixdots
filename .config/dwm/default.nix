with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "dwm";
  version = "custom";

  src = /home/kvl/.config/dwm; # Path to your dmenu directory

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
