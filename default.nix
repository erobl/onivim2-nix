# {fetchurl, appimageTools, pkgs}:
with import <nixpkgs> {};

let
  pname = "onivim2";
  name = "Oni2";
  version = "0.3.0";
  # you need to supply your own appimage, write the path of the file here.
  src = ./Onivim2.AppImage;
  appimageContents = appimageTools.extractType2 {
    inherit name src;
  };
in
appimageTools.wrapType2 rec {
  inherit name src;
  profile = "";

  meta = {
    description = "Native, lightweight modal code editor";
    homepage = https://github.com/onivim/oni2;
    platforms = [ "x86_64-linux" ];
  };

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/Onivim2.desktop $out/share/applications/Onivim2.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/Onivim2.png \
      $out/share/icons/hicolor/512x512/apps/Onivim2.png
  '';
}

