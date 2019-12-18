{ mkDerivation, base, base64-bytestring, blaze-builder, bytestring
, crypto-api, http-types, scotty, stdenv, stm, text, time
, transformers, unordered-containers, wai
}:
mkDerivation {
  pname = "scotty-session";
  version = "0.0.5";
  src = ./.;
  libraryHaskellDepends = [
    base base64-bytestring blaze-builder bytestring crypto-api
    http-types scotty stm text time transformers unordered-containers
    wai
  ];
  homepage = "https://github.com/agrafix/scotty-session";
  description = "Adding session functionality to scotty";
  license = stdenv.lib.licenses.bsd3;
}
