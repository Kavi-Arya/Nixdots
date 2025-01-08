with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "st";
  version = "custom";

  src = /home/kvl/.config/st; # Path to your dmenu directory

  buildInputs = [
    pkg-config
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    harfbuzz
  ];

  unpackPhase = "true"; # Skip the unpack phase as src is already a directory

  installPhase = ''
    make PREFIX=$out install
  '';
}
