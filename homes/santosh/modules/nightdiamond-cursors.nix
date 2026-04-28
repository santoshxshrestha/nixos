{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "NightDiamond-cursors";
  version = "c9452947a77d944d7afd87bc2bed3078cebcd72f";

  src = fetchFromGitHub {
    owner = "vimlinuz";
    repo = "NightDiamond-cursors";
    rev = "c9452947a77d944d7afd87bc2bed3078cebcd72f";
    hash = "sha256-lFufq2Weurcuo4U8jEoVHYMSRQs3iq7NBEdfA5ZN4vY=";
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
