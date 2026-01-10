{
  description = "Flake utils demo";

  inputs.flake-utils.url = "github:numtide/flake-utils";

 
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };


  # ...
};

  outputs = { self, nixpkgs, flake-utils, qml-niri, quickshell,... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          hello = pkgs.hello;
          default = qml-niri.packages."${system}".quickshell;

          my_quickshell = pkgs.stdenv.mkDerivation {

            src = self;

            name = "my_shell";


            buildInputs = [
              qml-niri.packages."${system}".quickshell
            
            ];

            nativeBuildInputs = [
                pkgs.makeWrapper
            ];

            installPhase = ''
            mkdir -p $out/share/shell
            cp . -r $out/share/shell
            runHook     postInstall
'';
            
            postInstall = 
            let
              quicksh = qml-niri.packages.${system}.quickshell;
            in
              ''
mkdir -p $out/bin
makeWrapper ${quicksh}/bin/quickshell $out/bin/myshell \
--add-flags "-c $out/share/shell"'';
            
          };

        };
        apps = rec {
          hello = flake-utils.lib.mkApp { drv = self.packages.${system}.hello; };
          default = flake-utils.lib.mkApp {
            drv = qml-niri.packages."${system}".quickshell;
          exePath = "/bin/quickshell";};

        };

        devShells = rec {test = pkgs.mkShell {


          shellHook = ''
export QML_IMPORT_PATH=${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:${qml-niri.packages.${system}.quickshell}/lib/qt-6/qml
export QML2_IMPORT_PATH=$QML_IMPORT_PATH

'';
          buildInputs = with pkgs; [
            qt6.qtlanguageserver

            qt6.qtdeclarative
#            qml-niri.packages"${system}".quickshell
          ];};
                        };
      }
          
    );
}
