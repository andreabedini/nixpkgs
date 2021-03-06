{ stdenv, fetchFromGitHub, cmake, pkgconfig
, zlib, libpng, libjpeg, libGLU_combined, glm
, libX11, libXext, libXfixes, libXrandr, libXcomposite, slop, icu
}:

stdenv.mkDerivation rec {
  name = "maim-${version}";
  version = "5.5";

  src = fetchFromGitHub {
    owner = "naelstrof";
    repo = "maim";
    rev = "v${version}";
    sha256 = "0dr44lwqsvhwf9pncxq6k42zj9hj07b96qsk1q8vh4l42zcpqzla";
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs =
    [ zlib libpng libjpeg libGLU_combined glm
      libX11 libXext libXfixes libXrandr libXcomposite slop icu ];

  doCheck = false;

  meta = with stdenv.lib; {
    inherit (src.meta) homepage;
    description = "A command-line screenshot utility";
    longDescription = ''
      maim (make image) takes screenshots of your desktop. It has options to
      take only a region, and relies on slop to query for regions. maim is
      supposed to be an improved scrot.
    '';
    platforms = stdenv.lib.platforms.all;
    license = stdenv.lib.licenses.gpl3Plus;
    maintainers = with maintainers; [ primeos mbakke ];
  };
}
