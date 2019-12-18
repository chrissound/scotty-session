{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, base64-bytestring, blaze-builder
      , bytestring, crypto-api, http-types, scotty, stdenv, stm, text
      , time, transformers, unordered-containers, wai
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
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
