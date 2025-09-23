{ stdenvNoCC, fetchFromGitHub, lib, }:
stdenvNoCC.mkDerivation {
  pname = "NightDiamond-cursors";
  version = "3ff3c0486430a4901b4d5cbbee87a370aa2b8ce9";

  src = fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "NightDiamond-cursors";
    rev = "3ff3c0486430a4901b4d5cbbee87a370aa2b8ce9";
    hash = "sha256-huruHo5w7Qrte1+nIiz+P1xPNDGrv5/eByHwaSlZYwQ=";

  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r * $out/share/icons/
    runHook postInstall
  '';

  meta = with lib; {
    description = "NightDiamond custom cursor theme";
    homepage = "https://github.com/santoshxshrestha/NightDiamond-cursors";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
