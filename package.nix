{ stdenv }: stdenv.mkDerivation {
  name = "nix-act";
  version = "1.0.0";
  src = ./.;
  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
  preferLocalBuild = true;
}
