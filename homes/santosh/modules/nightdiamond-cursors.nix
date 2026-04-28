{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "NightDiamond-cursors";
  version = "e13db9e75f74e42a68e32c53d96b53334c7b92b1";

  src = fetchFromGitHub {
    owner = "vimlinuz";
    repo = "NightDiamond-cursors";
    rev = "e13db9e75f74e42a68e32c53d96b53334c7b92b1";
    hash = "sha256-4cxQCN5MXGowRi/tzBPL/gTbPXpsMiSZSQr/vLFkcVQ=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r NightDiamond-* $out/share/icons/
    runHook postInstall
  '';

  meta = with lib; {
    description = "NightDiamond custom cursor theme";
    homepage = "https://github.com/vimlinuz/NightDiamond-cursors";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
