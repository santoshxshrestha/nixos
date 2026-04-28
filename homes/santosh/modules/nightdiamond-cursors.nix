{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "NightDiamond-cursors";
  version = "49650765c3396ccee9ffb796608845d4660d5692";

  src = fetchFromGitHub {
    owner = "vimlinuz";
    repo = "NightDiamond-cursors";
    rev = "49650765c3396ccee9ffb796608845d4660d5692";
    hash = "sha256-Ue6dDvNMq1pGfzudt1O8h0pawfKj4FskTGLnpyEp0CM=";
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
